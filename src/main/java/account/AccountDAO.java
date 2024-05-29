package account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class AccountDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	AccountVO vo = null;	
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {} 
			finally {
				pstmtClose();
			}
		}
	}

//	//mid를 account테이블에서 검색하여 해당 항목의 idx를 구해온다.
//	public AccountVO getAccountMidSearch(String mid) {
//		AccountVO vo = new AccountVO();
//		try {
//			sql = "select * from account where mid = ? order by idx desc limit 1";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, mid);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				vo.setIdx(rs.getInt("idx"));
//				vo.setMid(mid);
//				vo.setMoney(rs.getInt("money"));
//			}
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			rsClose();
//		}
//		return vo;
//	}

	//실제 잔고에 적용하기
	public void setAccountInput(AccountVO vo) {
		System.out.println("vo: " + vo);
		try {
			// 트랜잭설정 : false를 인자값으로 설정하여 수동커밋으로 지정한다.
			conn.setAutoCommit(false);
			
			sql = "insert into account values (default,?,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getFlagSw());
			pstmt.setInt(3, vo.getMoney());
			pstmt.setString(4, vo.getContent());
			pstmt.executeUpdate();
			
			// I:입금,  C:출금, E:계좌출금, G:계좌입금
			// 정상적으로 트랜잭션작업단위가 종료된후에 트랜잭션을 커밋시킨다.
			if(!vo.getFlagSw().equals("E"))	conn.commit();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
			try {
				if(conn != null) conn.rollback();	// 예외오류 발생시는 기존에 작업된 sql문의 모두 rollback처리된다.
			} catch (Exception e2) {}
		} finally {
			pstmtClose();
		}

	}

	// 출금 전 잔액 확인
	public int getAccountBalance(String mid, String flagSw1, String flagSw2) {
		int sum = 0;
		try {
			sql = "select sum(money) as balance from account where (mid=? and flagSw=?) or (mid=? and flagSw=?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, flagSw1);
			pstmt.setString(3, mid);
			pstmt.setString(4, flagSw2);
			rs = pstmt.executeQuery();
			if(rs.next()) sum = rs.getInt("balance");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return sum;
		
	}

	// 즐겨찾기 계좌 조회
	public ArrayList<AccountVO> getAccountFarvorite(String mid) {
		ArrayList<AccountVO> vos = new ArrayList<AccountVO>();
		try {
			sql = "select * from accountFavorite where myId=? order by youId";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AccountVO vo = new AccountVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setYouId(rs.getString("youId"));
				vo.setAccountNumber(rs.getString("accountNumber"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 계좌번호로 아이디 검색
	public String getAccountSearch(String accountNumber) {
		String mid = "";
		try {
			//sql = "select myId from accountFavorite where accountNumber=?";
			sql = "select mid from member where accountNumber=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountNumber);
			rs = pstmt.executeQuery();
			
			if(rs.next()) mid = rs.getString("mid");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return mid;
	}

	// 즐겨찾기 계좌등록
	public int setAccountInputOk(AccountVO vo) {
		int res = 0;
		try {
			sql = "insert into accountFavorite values (default,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMyId());
			pstmt.setString(2, vo.getYouId());
			pstmt.setString(3, vo.getAccountNumber());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}
