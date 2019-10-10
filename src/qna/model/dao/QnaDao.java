package qna.model.dao;

import java.sql.*;
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
  
  
	// 관리자용 dao************************************************************************************************
  // 관리자 Q&A 전체조회용
  public ArrayList<Qna> selectAll(Connection conn){
    return null;
  }

  // 관리자 Q&A 검색용
  public ArrayList<Qna> selectQnaSearch(Connection conn, String searchtype, String keyword, String answerstatus){
    return null;
  }

  // 관리자 Q&A 새문의글(Sysdate) 조회용
  public ArrayList<Qna> selectAllSystdate(Connection conn){
    return null;
  }

  // 관리자 Q&A 미답변 목록 전체 조회용
  public ArrayList<Qna> selectAllUnanswer(Connection conn){
    return null;
  }

}
