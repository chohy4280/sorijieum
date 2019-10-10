package wishbook.model.vo;

import java.sql.Date;

public class WishBook implements java.io.Serializable {

	private static final long serialVersionUID = 131313L;
	
	private int wishNo;
	private String wishWriter;
	private String wishBookTitle;
	private String wishBookWriter;
	private String wishPublisher;
	private java.sql.Date wishPublishDate;
	private java.sql.Date wishDate;
	private int wishViews;
	private String wishStatus;
	private String rjctReason;
	private java.sql.Date wishStatusDate;
	private String wishTop;
	

	public WishBook() {}


	public WishBook(int wishNo, String wishWriter, String wishBookTitle, String wishBookWriter, String wishPublisher,
			Date wishPublishDate, Date wishDate, int wishViews, String wishStatus, String rjctReason,
			Date wishStatusDate, String wishTop) {
		super();
		this.wishNo = wishNo;
		this.wishWriter = wishWriter;
		this.wishBookTitle = wishBookTitle;
		this.wishBookWriter = wishBookWriter;
		this.wishPublisher = wishPublisher;
		this.wishPublishDate = wishPublishDate;
		this.wishDate = wishDate;
		this.wishViews = wishViews;
		this.wishStatus = wishStatus;
		this.rjctReason = rjctReason;
		this.wishStatusDate = wishStatusDate;
		this.wishTop = wishTop;
	}


	public int getWishNo() {
		return wishNo;
	}


	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}


	public String getWishWriter() {
		return wishWriter;
	}


	public void setWishWriter(String wishWriter) {
		this.wishWriter = wishWriter;
	}


	public String getWishBookTitle() {
		return wishBookTitle;
	}


	public void setWishBookTitle(String wishBookTitle) {
		this.wishBookTitle = wishBookTitle;
	}


	public String getWishBookWriter() {
		return wishBookWriter;
	}


	public void setWishBookWriter(String wishBookWriter) {
		this.wishBookWriter = wishBookWriter;
	}


	public String getWishPublisher() {
		return wishPublisher;
	}


	public void setWishPublisher(String wishPublisher) {
		this.wishPublisher = wishPublisher;
	}


	public java.sql.Date getWishPublishDate() {
		return wishPublishDate;
	}


	public void setWishPublishDate(java.sql.Date wishPublishDate) {
		this.wishPublishDate = wishPublishDate;
	}


	public java.sql.Date getWishDate() {
		return wishDate;
	}


	public void setWishDate(java.sql.Date wishDate) {
		this.wishDate = wishDate;
	}


	public int getWishViews() {
		return wishViews;
	}


	public void setWishViews(int wishViews) {
		this.wishViews = wishViews;
	}


	public String getWishStatus() {
		return wishStatus;
	}


	public void setWishStatus(String wishStatus) {
		this.wishStatus = wishStatus;
	}


	public String getRjctReason() {
		return rjctReason;
	}


	public void setRjctReason(String rjctReason) {
		this.rjctReason = rjctReason;
	}


	public java.sql.Date getWishStatusDate() {
		return wishStatusDate;
	}


	public void setWishStatusDate(java.sql.Date wishStatusDate) {
		this.wishStatusDate = wishStatusDate;
	}


	public String getWishTop() {
		return wishTop;
	}


	public void setWishTop(String wishTop) {
		this.wishTop = wishTop;
	}


	@Override
	public String toString() {
		return "WishBook [wishNo=" + wishNo + ", wishWriter=" + wishWriter + ", wishBookTitle=" + wishBookTitle
				+ ", wishBookWriter=" + wishBookWriter + ", wishPublisher=" + wishPublisher + ", wishPublishDate="
				+ wishPublishDate + ", wishDate=" + wishDate + ", wishViews=" + wishViews + ", wishStatus=" + wishStatus
				+ ", rjctReason=" + rjctReason + ", wishStatusDate=" + wishStatusDate + ", wishTop=" + wishTop + "]";
	}
	
	

}
