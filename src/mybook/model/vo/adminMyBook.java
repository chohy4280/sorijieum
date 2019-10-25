package mybook.model.vo;

public class adminMyBook implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8825577981895251751L;

	private String userId;
	private String bookCode;
	private String bookTitle;
	private String author;
	private String publisher;
	
	public adminMyBook() {}

	public adminMyBook(String userId, String bookCode, String bookTitle, String author, String publisher) {
		super();
		this.userId = userId;
		this.bookCode = bookCode;
		this.bookTitle = bookTitle;
		this.author = author;
		this.publisher = publisher;
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

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Override
	public String toString() {
		return "adminMyBook [userId=" + userId + ", bookCode=" + bookCode + ", bookTitle=" + bookTitle + ", author="
				+ author + ", publisher=" + publisher + "]";
	}
	
	
}
