package likebook.model.vo;

public class LikeBook implements java.io.Serializable{

	private static final long serialVersionUID = 444L;
	
	private String userId;
	private String bookCode;

	public LikeBook() {}

	public LikeBook(String userId, String bookCode) {
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

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	@Override
	public String toString() {
		return "LikeBook [userId=" + userId + ", bookCode=" + bookCode + "]";
	}
	
	

}
