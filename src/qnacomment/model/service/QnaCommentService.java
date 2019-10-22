package qnacomment.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;

import qnacomment.model.dao.QnaCommentDao;
import qnacomment.model.vo.QnaComment;

public class QnaCommentService {
	
	//의존성 주입
	public QnaCommentDao qcDao = new QnaCommentDao();
	
	public QnaCommentService() {};
	
	//답변 조회
	public QnaComment selectQnaComment(int qnano) {
		Connection conn = getConnection();
		QnaComment qComm = qcDao.selectQnaComment(conn, qnano);
		close(conn);
		return qComm;
	}

	//답변 작성
	public int insertQnaComment(QnaComment qcomm) {
		Connection conn = getConnection();
		int result = qcDao.insertQnaComment(conn, qcomm);
		if(result>0) 
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//답변 수정
	public int updateQnaComment(QnaComment qComm) {
		Connection conn = getConnection();
		int result = qcDao.updateQnaComment(conn, qComm);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//답변 삭제
	public int deleteQnaComment(int qnano) {
		Connection conn = getConnection();
		int result = qcDao.deleteQnaComment(conn, qnano);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
}
