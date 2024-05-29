package account;

public class AccountVO {
	private int idx;
	private String mid;
	private String accountNumber;
	private String flagSw;
	private int money;
	private String content;
	private String accDate;
	
	private String myId;
	private String youId;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getFlagSw() {
		return flagSw;
	}
	public void setFlagSw(String flagSw) {
		this.flagSw = flagSw;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAccDate() {
		return accDate;
	}
	public void setAccDate(String accDate) {
		this.accDate = accDate;
	}
	public String getMyId() {
		return myId;
	}
	public void setMyId(String myId) {
		this.myId = myId;
	}
	public String getYouId() {
		return youId;
	}
	public void setYouId(String youId) {
		this.youId = youId;
	}
	
	@Override
	public String toString() {
		return "AccountVO [idx=" + idx + ", mid=" + mid + ", accountNumber=" + accountNumber + ", flagSw=" + flagSw
				+ ", money=" + money + ", content=" + content + ", accDate=" + accDate + ", myId=" + myId + ", youId=" + youId
				+ "]";
	}
}
