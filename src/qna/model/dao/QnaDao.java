package qna.model.dao;

import java.sql.Connection;
import java.util.ArrayList;

import qna.model.vo.Qna;

public class QnaDao {
	
	public QnaDao() {};
	
	//목록
	public ArrayList<Qna> selectQnaList(Connection conn){
		return null;
	}
	
	//한개
	public Qna selectQnaOne(Connection conn, int qnaNo) {
		return null;
	}
	
	//글 등록
	public int insertQna(Connection conn, Qna qna) {
		return 0;
	}
	
	//글 수정
	public int updateQna(Connection conn, Qna qna) {
		return 0;
	}
	
	//글 삭제
	public int deleteQna(Connection conn, int qnaNo) {
		return 0;
	}
	
	//제목으로 검색
	public ArrayList<Qna> selectTitleSearch(Connection conn, String keyword) {
		return null;
	}
	
	//작성자로 검색
	public ArrayList<Qna> selectWriterSearch(Connection conn, String keyword) {
		return null;
	}

}
