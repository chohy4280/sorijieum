package qnacomment.model.vo;

import java.sql.Date;

public class QnaComment implements java.io.Serializable{

	private static final long serialVersionUID = 101010L;
	
	private int qnaNo;
	private String qnaComWriter;
	private String qnaComments;
	private java.sql.Date qnaComDate;
	
	public QnaComment() {}

	public QnaComment(int qnaNo, String qnaComWriter, String qnaComments, Date qnaComDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaComWriter = qnaComWriter;
		this.qnaComments = qnaComments;
		this.qnaComDate = qnaComDate;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaComWriter() {
		return qnaComWriter;
	}

	public void setQnaComWriter(String qnaComWriter) {
		this.qnaComWriter = qnaComWriter;
	}

	public String getQnaComments() {
		return qnaComments;
	}

	public void setQnaComments(String qnaComments) {
		this.qnaComments = qnaComments;
	}

	public java.sql.Date getQnaComDate() {
		return qnaComDate;
	}

	public void setQnaComDate(java.sql.Date qnaComDate) {
		this.qnaComDate = qnaComDate;
	}

	@Override
	public String toString() {
		return "QnaComment [qnaNo=" + qnaNo + ", qnaComWriter=" + qnaComWriter + ", qnaComments=" + qnaComments
				+ ", qnaComDate=" + qnaComDate + "]";
	}
	
	

}
