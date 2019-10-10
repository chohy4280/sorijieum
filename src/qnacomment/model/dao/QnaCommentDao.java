package qnacomment.model.dao;

import java.sql.Connection;

import qna.model.vo.Qna;
import qnacomment.model.vo.QnaComment;

public class QnaCommentDao {
	
	public QnaCommentDao() {}
		
	//
	public Qna selectQnaComment(Connection conn, int qnaNo) {
		return null;
	}

	//답변 작성
	public int insertQnaComment(Connection conn, QnaComment comment) {
		return 0;
	}
	
	//답변 수정
	public int updateQnaComment(Connection conn, QnaComment commnet) {
		return 0;
	}
	
	//답변 삭제
	public int deleteQnaComment(Connection conn, int qnaNo) {
		return 0;
	}

}
