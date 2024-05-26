package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFindIdCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
	
		if(name.equals("sName") && email.equals("sEmail")) {
			request.setAttribute("message", "회원님의 아이디는 "+mid+" 입니다.");
			request.setAttribute("url", "");
		}
	}

}
