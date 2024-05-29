package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		String gender = request.getParameter("gender")==null? "" : request.getParameter("gender");
		String birth = request.getParameter("birth")==null? "" : request.getParameter("birth");
		String tel = request.getParameter("tel")==null? "" : request.getParameter("tel");
		String job = request.getParameter("job")==null? "" : request.getParameter("job");
		String address = request.getParameter("address")==null? "" : request.getParameter("address");
		String message = request.getParameter("message")==null? "" : request.getParameter("message");
		
		// 모든 체크가 끝난 자료는 vo에 담아서 DB에 저장처리한다.
		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setName(name);
		vo.setEmail(email);
		vo.setGender(gender);
		vo.setBirth(birth);
		vo.setTel(tel);
		vo.setJob(job);
		vo.setAddress(address);
		vo.setMessage(message);
		
		MemberDAO dao = new MemberDAO();
		
		int res = dao.setMemberUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원 정보가 수정되었습니다.");
			request.setAttribute("url", "MemberMain.mem");
		}
		else {
			request.setAttribute("message", "회원정보 수정 실패");
			request.setAttribute("url", "MemberUpdate.mem");
		}
	}

}
