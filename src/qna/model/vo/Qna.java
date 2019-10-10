package qna.model.vo;

import java.sql.Date;

public class Qna implements java.io.Serializable{

	private static final long serialVersionUID = 999L;
	
	private int qnaNo;
	private String qnaTitle;
	private String qnaWriter;
	private String qnaContent;
	private java.sql.Date qnaDate;
	private int qnaViews;
	private String qnaStatus;
	private String qnaOfile;
	private String qnaRfile;
	private String qnaTop;
	
	public Qna() {}

	public Qna(int qnaNo, String qnaTitle, String qnaWriter, String qnaContent, Date qnaDate, int qnaViews,
			String qnaStatus, String qnaOfile, String qnaRfile, String qnaTop) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaWriter = qnaWriter;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qnaViews = qnaViews;
		this.qnaStatus = qnaStatus;
		this.qnaOfile = qnaOfile;
		this.qnaRfile = qnaRfile;
		this.qnaTop = qnaTop;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public java.sql.Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(java.sql.Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public int getQnaViews() {
		return qnaViews;
	}

	public void setQnaViews(int qnaViews) {
		this.qnaViews = qnaViews;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	public String getQnaOfile() {
		return qnaOfile;
	}

	public void setQnaOfile(String qnaOfile) {
		this.qnaOfile = qnaOfile;
	}

	public String getQnaRfile() {
		return qnaRfile;
	}

	public void setQnaRfile(String qnaRfile) {
		this.qnaRfile = qnaRfile;
	}

	public String getQnaTop() {
		return qnaTop;
	}

	public void setQnaTop(String qnaTop) {
		this.qnaTop = qnaTop;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaWriter=" + qnaWriter + ", qnaContent="
				+ qnaContent + ", qnaDate=" + qnaDate + ", qnaViews=" + qnaViews + ", qnaStatus=" + qnaStatus
				+ ", qnaOfile=" + qnaOfile + ", qnaRfile=" + qnaRfile + ", qnaTop=" + qnaTop + "]";
	}
	
	
}
