package mybook.model.vo;

import java.sql.Date;

public class MyBook implements java.io.Serializable{

	private static final long serialVersionUID = 777L;
	
	private String userId;
	private String bookCode;
	private int readPage;
	private java.sql.Date readSdate;
	private java.sql.Date readRdate;
	
	public MyBook() {}

	public MyBook(String userId, String bookCode, int readPage, Date readSdate, Date readRdate) {
		super();
		this.userId = userId;
		this.bookCode = bookCode;
		this.readPage = readPage;
		this.readSdate = readSdate;
		this.readRdate = readRdate;
	}

	
	
	public MyBook(String userId, String bookCode) {
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

	public int getReadPage() {
		return readPage;
	}

	public void setReadPage(int readPage) {
		this.readPage = readPage;
	}

	public java.sql.Date getReadSdate() {
		return readSdate;
	}

	public void setReadSdate(java.sql.Date readSdate) {
		this.readSdate = readSdate;
	}

	public java.sql.Date getReadRdate() {
		return readRdate;
	}

	public void setReadRdate(java.sql.Date readRdate) {
		this.readRdate = readRdate;
	}

	@Override
	public String toString() {
		return "MyBook [userId=" + userId + ", bookCode=" + bookCode + ", readPage=" + readPage + ", readSdate="
				+ readSdate + ", readRdate=" + readRdate + "]";
	}
	
	

}
