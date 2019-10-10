package qnacomment.model.service;

import qna.model.vo.Qna;
import qnacomment.model.dao.QnaCommentDao;
import qnacomment.model.vo.QnaComment;

public class QnaCommentService {
	
	//의존성 주입
	public QnaCommentDao qcDao = new QnaCommentDao();
	
	public QnaCommentService() {};
	
	//
	public Qna selectQnaComment(int qnaNo) {
		return null;
	}

	//답변 작성
	public int insertQnaComment(QnaComment comment) {
		return 0;
	}
	
	//답변 수정
	public int updateQnaComment(QnaComment commnet) {
		return 0;
	}
	
	//답변 삭제
	public int deleteQnaComment(int qnaNo) {
		return 0;
	}
	
}
