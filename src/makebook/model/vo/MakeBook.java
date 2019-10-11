package makebook.model.vo;

import java.sql.Date;

public class MakeBook implements java.io.Serializable{

	private static final long serialVersionUID = 555L;
	
	private String userId;
	private String bookCode;
	private java.sql.Date makeDate;

	public MakeBook() {}

	public MakeBook(String userId, String bookCode, Date makeDate) {
		super();
		this.userId = userId;
		this.bookCode = bookCode;
		this.makeDate = makeDate;
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

	public java.sql.Date getMakeDate() {
		return makeDate;
	}

	public void setMakeDate(java.sql.Date makeDate) {
		this.makeDate = makeDate;
	}

	@Override
	public String toString() {
		return "MakeBook [userId=" + userId + ", bookCode=" + bookCode + ", makeDate=" + makeDate + "]";
	}
	
	
}
