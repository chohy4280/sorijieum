package notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable{

	private static final long serialVersionUID = 888L;
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private java.sql.Date noticeDate;
	private int noticeViews;
	private String noticeOfile;
	private String noticeRfile;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeWriter, String noticeContent, Date noticeDate,
			int noticeViews, String noticeOfile, String noticeRfile) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeViews = noticeViews;
		this.noticeOfile = noticeOfile;
		this.noticeRfile = noticeRfile;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public java.sql.Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(java.sql.Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeViews() {
		return noticeViews;
	}

	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}

	public String getNoticeOfile() {
		return noticeOfile;
	}

	public void setNoticeOfile(String noticeOfile) {
		this.noticeOfile = noticeOfile;
	}

	public String getNoticeRfile() {
		return noticeRfile;
	}

	public void setNoticeRfile(String noticeRfile) {
		this.noticeRfile = noticeRfile;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeWriter=" + noticeWriter
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticeViews=" + noticeViews
				+ ", noticeOfile=" + noticeOfile + ", noticeRfile=" + noticeRfile + "]";
	}
	
	

}
