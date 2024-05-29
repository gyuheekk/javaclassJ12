package account;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AccountTransferCommand implements AccountInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		AccountDAO dao = new AccountDAO();
		
		ArrayList<AccountVO> vos = dao.getAccountFarvorite(mid);
		
		request.setAttribute("vos", vos);
	}

}
