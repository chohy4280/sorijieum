package qnacomment.model.dao;

import java.sql.*;

import static common.JDBCTemplate.*;

import qna.model.vo.Qna;
import qnacomment.model.vo.QnaComment;

public class QnaCommentDao {
	
	public QnaCommentDao() {}
		
	//답변 조회
	public QnaComment selectQnaComment(Connection conn, int qnano) {
		QnaComment qComm = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from qnacomment where qnano=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qnano);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				qComm = new QnaComment();
				qComm.setQnaNo(qnano);
				qComm.setQnaComWriter(rset.getString("qnacomwriter"));
				qComm.setQnaComDate(rset.getDate("qnacomdate"));
				qComm.setQnaComments(rset.getString("qnacomments"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qComm;
	}

	//답변 작성
	public int insertQnaComment(Connection conn, QnaComment qcomm) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into qnacomment values(?,?,?,sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qcomm.getQnaNo());
			pstmt.setString(2, qcomm.getQnaComWriter());
			pstmt.setString(3, qcomm.getQnaComments());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//답변 수정
	public int updateQnaComment(Connection conn, QnaComment qComm) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update qnacomment set qnacomments=?,qnacomwriter=?,qnacomdate=sysdate where qnano=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qComm.getQnaComments());
			pstmt.setString(2, qComm.getQnaComWriter());
			pstmt.setInt(3, qComm.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//답변 삭제 => 삭제 후 문의글의 답변유무 컬럼 값 변경해줘야함
	public int deleteQnaComment(Connection conn, int qnano) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from qnacomment where qnano=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qnano);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
