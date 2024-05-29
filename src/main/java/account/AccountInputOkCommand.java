package account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AccountInputOkCommand implements AccountInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String myId = (String) session.getAttribute("sMid");
		String youId = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String accountNumber = request.getParameter("accountNumber")==null ? "" : request.getParameter("accountNumber");
		
		AccountVO vo = new AccountVO();
		vo.setMyId(myId);
		vo.setYouId(youId);
		vo.setAccountNumber(accountNumber);
		
		AccountDAO dao = new AccountDAO();
		int res = dao.setAccountInputOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "즐겨찾기 계좌에 등록되었습니다.");
		}
		else {
			request.setAttribute("message", "즐겨찾기 계좌등록 실패");
		}
		request.setAttribute("url", "AccountTransfer.acc");
	}

}
