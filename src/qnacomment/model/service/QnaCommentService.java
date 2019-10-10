package qnacomment.model.service;

import qnacomment.model.dao.QnaCommentDao;

public class QnaCommentService {
	
	//의존성 주입
	public QnaCommentDao qcDao = new QnaCommentDao();
	
	public QnaCommentService() {};

}
