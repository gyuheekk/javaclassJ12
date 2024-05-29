package account;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.acc")
public class AccountController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountInterface command = null;
		String viewPage = "/WEB-INF/account";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증 처리
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(level > 4) {
			request.setAttribute("message", "로그인후 사용하세요");
			request.setAttribute("url", "MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AccountDeposit")) {
			viewPage += "/accountDeposit.jsp";
		}
		else if(com.equals("/AccountWithdraw")) {
			viewPage += "/accountWithdraw.jsp";
		}
		else if(com.equals("/AccountTransfer")) {
			command = new AccountTransferCommand();
			command.execute(request, response);
			viewPage += "/accountTransfer.jsp";
		}
		else if(com.equals("/AccountOk")) {
			command = new AccountOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AccountInputOk")) {
			command = new AccountInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AccountHistory")) {
			command = new AccountHistoryCommand();
			command.execute(request, response);
			viewPage += "/accountHistory.jsp";
		}
		else if(com.equals("/AccountFavorite")) {
			viewPage += "/accountFavorite.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);		
	}
}
