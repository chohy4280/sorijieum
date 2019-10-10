package likebook.model.vo;

public class LikeBook implements java.io.Serializable{

	private static final long serialVersionUID = 444L;
	
	private String userId;
	private int bookCode;

	public LikeBook() {}

	public LikeBook(String userId, int bookCode) {
		super();
		this.userId = userId;
		this.bookCode = bookCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBookCode() {
		return bookCode;
	}

	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}

	@Override
	public String toString() {
		return "LikeBook [userId=" + userId + ", bookCode=" + bookCode + "]";
	}
	
	

}
