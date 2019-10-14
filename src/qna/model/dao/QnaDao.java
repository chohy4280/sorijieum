package qna.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	  ArrayList<Qna> list = new ArrayList<Qna>();
	  Statement stmt = null;
	  ResultSet rset = null;
	  
	  String query = "select * from qna order by qnadate asc";
	  try {
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		
		while(rset.next()) {
			Qna q = new Qna();
			
			q.setQnaNo(rset.getInt("qnano"));
			q.setQnaTitle(rset.getString("qnatitle"));
			q.setQnaWriter(rset.getString("qnawriter"));
			q.setQnaStatus(rset.getString("qnastatus"));
			q.setQnaDate(rset.getDate("qnadate"));
			q.setQnaViews(rset.getInt("qnaviews"));
			
			list.add(q);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(stmt);
	}
    return list;
  }

  // 관리자 Q&A 검색용
  public ArrayList<Qna> selectQnaSearch(Connection conn, String searchtype, String keyword, String answerstatus){
    return null;
  }

  // 관리자 Q&A 새문의글(Sysdate) 조회용
  public ArrayList<Qna> selectAllSystdate(Connection conn){
    ArrayList<Qna> newQList = new ArrayList<Qna>();
    Statement stmt = null;
    ResultSet rset = null;
    
    String query = "select * from Qna where qnadate = sysdate";
    
    try {
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		
		while(rset.next()) {
			Qna q = new Qna();
			
			q.setQnaNo(rset.getInt("qnano"));
			newQList.add(q);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(stmt);
	}
    return newQList;
  }

  // 관리자 Q&A 미답변 목록 전체 조회용
  public ArrayList<Qna> selectAllUnanswer(Connection conn){
	  ArrayList<Qna> uaQList = new ArrayList<Qna>();
	    Statement stmt = null;
	    ResultSet rset = null;
	    
	    String query = "select * from Qna where qnastatus = 'N'";
	    
	    try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Qna q = new Qna();
				
				q.setQnaNo(rset.getInt("qnano"));
				
				uaQList.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
	    return uaQList;
  }

}
