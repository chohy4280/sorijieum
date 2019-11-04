package likebook.model.vo;

import java.sql.Date;

public class LikeBook implements java.io.Serializable{

	private static final long serialVersionUID = 444L;
	
	private String userId;
	private String bookCode;
	private java.sql.Date likeDate;

	public LikeBook() {}

	public LikeBook(String userId, String bookCode, Date likeDate) {
		super();
		this.userId = userId;
		this.bookCode = bookCode;
		this.likeDate = likeDate;
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

	public java.sql.Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(java.sql.Date likeDate) {
		this.likeDate = likeDate;
	}

	@Override
	public String toString() {
		return "LikeBook [userId=" + userId + ", bookCode=" + bookCode + ", likeDate=" + likeDate + "]";
	}
	
	

}
