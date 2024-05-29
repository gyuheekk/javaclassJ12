package account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccountOkCommand implements AccountInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		int money = (request.getParameter("money")==null || request.getParameter("money").equals("")) ? 0 : Integer.parseInt(request.getParameter("money"));
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String flagSw = request.getParameter("flagSw")==null ? "" : request.getParameter("flagSw");
		String accountNumber = request.getParameter("accountNumber")==null ? "" : request.getParameter("accountNumber");
	
		AccountDAO dao = new AccountDAO(); 
		
		// mid를 Account테이블에서 검색하여 해당 항목의 idx를 구해온다.
		AccountVO vo = new AccountVO();
		vo.setMid(mid);
		vo.setFlagSw(flagSw);
		vo.setMoney(money);
		vo.setContent(content);
		
		// 출금할 금액이 잔액보다 작은지 확인
		String flag = "NO";
		if(flagSw.equals("C") || flagSw.equals("E")) {
			int sum = dao.getAccountBalance(mid, "I", "G");
			if(sum < money) {
				request.setAttribute("message", "입금액을 초과 했습니다. 확인해보세요");
				if(flagSw.equals("C")) request.setAttribute("url", "AccountWithdraw.acc");
				else if(flagSw.equals("E")) request.setAttribute("url", "AccountTransfer.acc");
				flag = "OK";
			}
		}
		
		if(!flag.equals("OK")) {
			// 입/출금 내역 기록하기
			dao.setAccountInput(vo);
			
			if(flagSw.equals("E")) {
				String imsiMid = dao.getAccountSearch(accountNumber);
				vo.setMid(imsiMid);
				vo.setFlagSw("G");
				vo.setContent(mid);
				dao.setAccountInput(vo);
			}
			
			request.setAttribute("message", "거래가 완료되었습니다.");
			request.setAttribute("url", "MemberMain.mem");
		}
	}

}
