package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		String gender = request.getParameter("gender")==null? "" : request.getParameter("gender");
		String birth = request.getParameter("birth")==null? "" : request.getParameter("birth");
		String tel = request.getParameter("tel")==null? "" : request.getParameter("tel");
		String address = request.getParameter("address")==null? "" : request.getParameter("address");
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		String job = request.getParameter("job")==null? "" : request.getParameter("job");
		String message = request.getParameter("message")==null? "" : request.getParameter("message");
		
		// DB에 저장시킨자료중 not null 데이터는 Back End 체크시켜준다.
		
		// 아이디 중복체크
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("message", "이미 사용중인 아이디 입니다.");
			request.setAttribute("url", "MemberJoin.mem");
			return;
		}
		
		// 비밀번호 암호화(sha256) - salt키를 만든후 암호화 시켜준다.(uuid코드중 앞자리 8자리 같이 병행처리후 암호화시킨다.)
		// uuid를 통한 salt키 만들기(앞에서 8자리를 가져왔다.)
		String salt = UUID.randomUUID().toString().substring(0,8);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		
		pwd = salt + pwd;
		
	  // 계좌번호 발급 (생년월일 6자리 + 난수6자리 -> 총 12자리 / ex.생년월일이 1999.12.31 이라면? 991-231-123456)
	  
		int rand = 0;
		String strRand = "";
	  for(int i=0; i<6; i++) { 
	  	rand = (int)(Math.random()*10);
	  	strRand += rand + "";
  	}
	  
	  // 1999-05-24 : 990-524-____
	  String accountnumber = birth.substring(2,4)+birth.substring(5,6)+"-"+birth.substring(6,7)+birth.substring(8,10)+"-"+strRand;
		 
		// 모든 체크가 끝난 자료는 vo에 담아서 DB에 저장처리한다.
		vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirth(birth);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setJob(job);
		vo.setMessage(message);
		vo.setAccountNumber(accountnumber);
		
		int res = dao.setMemberJoinOk(vo);
		
		//int res = dao.setAccountCreate(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원 가입되셨습니다.\\n다시 로그인해 주세요.");
			request.setAttribute("url", "MemberLogin.mem");
		}
		else {
			request.setAttribute("message", "회원 가입 실패~~");
			request.setAttribute("url", "MemberJoin.mem");
		}
		 
	}
}
