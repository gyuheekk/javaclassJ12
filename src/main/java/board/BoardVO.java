package board;

public class BoardVO {
	private int idx;
	private String mid;
	private String title;
	private String content;
	private int readNum;
	private String openSw;
	private String wDate;
	
	private int hour_diff; // 게시글 24시간 경과유무 체크
	private int date_diff; // 게시글 일자 경과유무 체크
	private int replyCnt; // 부모글의 댓글수를 저장하는 변수
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadNum() {
		return readNum;
	}
	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}
	public String getOpenSw() {
		return openSw;
	}
	public void setOpenSw(String openSw) {
		this.openSw = openSw;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public int getHour_diff() {
		return hour_diff;
	}
	public void setHour_diff(int hour_diff) {
		this.hour_diff = hour_diff;
	}
	public int getDate_diff() {
		return date_diff;
	}
	public void setDate_diff(int date_diff) {
		this.date_diff = date_diff;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", mid=" + mid + ", title=" + title + ", content=" + content + ", readNum=" + readNum
				+ ", openSw=" + openSw + ", wDate=" + wDate + ", hour_diff=" + hour_diff + ", date_diff=" + date_diff
				+ ", replyCnt=" + replyCnt + "]";
	}
	
	
}
