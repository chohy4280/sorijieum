package qna.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import member.model.vo.Member;
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
  
	// 관리자 Q&A 전체조회 리스트카운트
	public int getListCountAdmin(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from qna";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
				listCount = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	
	// 관리자 Q&A 전체조회용
  public ArrayList<Qna> selectAll(Connection conn, int startRow, int endRow){
	  ArrayList<Qna> list = new ArrayList<Qna>();
	  PreparedStatement pstmt = null;
	  ResultSet rset = null;
	  
	  String query = "select * from (select rownum rnum, qnano, qnastatus, qnatitle, qnawriter, qnadate, qnaviews from qna order by qnadate asc) where rnum between ? and ?";
	  try {
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		rset = pstmt.executeQuery();
		
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
		close(pstmt);
	}
    return list;
  }
  
  // 관리자 Q&A 검색용 리스트카운트
	public int getSearchListCountAdmin(Connection conn, String searchtype, String keyword, String qnastatus,
			String qnadate) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		 String query = null;
		 /*	  검색 경우의 수
		  	  1-1 검색조건 X, 답변여부 전체
		  	  	1-1.1 메인화면 새문의글 조회용
		 	  1-2 검색조건 X, 답변여부 O

		 	  2-1 검색조건 O, 답변여부 전체
		 	  2-2 검색조건 O, 답변여부 O*/
		 	  
		 	  if(keyword == null) {
		 		  if(qnastatus.equals("ALL")) {
		 			  if(qnadate != null) //1-1.1 메인화면 새문의글 조회용
		 				  query = "select count(*) from (select * from qna where qnadate = sysdate) where qnastatus in ('Y', 'N')";
		 			  else	// 1-1
		 			  query = "select count(*) from qna where qnastatus in ('Y', 'N')";
		 		  }else // 1-2
		 			  query = "select count(*) from qna where qnastatus = '" + qnastatus + "'";
		 	  }else {
		 		  if(qnastatus.equals("ALL")) // 2-1
		 			  query = "select count(*) from qna where " + searchtype + " like '%" + keyword + "%' and qnastatus in ('Y', 'N')";
		 		  else // 2-2
		 			  query = "select count(*) from qna where " + searchtype + " like '%" + keyword + "%' and qnastatus = '" + qnastatus + "'";
		 	  }
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next())
				listCount = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return  listCount;
	}

  // 관리자 Q&A 검색용
  public ArrayList<Qna> selectQnaSearch(Connection conn, String searchtype, String keyword, String qnastatus, String qnadate, int startRow, int endRow){
	  ArrayList<Qna> list = new ArrayList<Qna>();
	  PreparedStatement pstmt = null;
	  ResultSet rset = null;
	  
	  String query = null;
	  String sentence = "select * from (select rownum rnum, qnano, qnastatus, qnatitle, qnawriter, qnadate, qnaviews from (select * from qna";
/*	  검색 경우의 수
 	  1-1 검색조건 X, 답변여부 전체
 	  	1-1.1 메인화면 새문의글 조회용
	  1-2 검색조건 X, 답변여부 O

	  2-1 검색조건 O, 답변여부 전체
	  2-2 검색조건 O, 답변여부 O*/
	  
	  if(keyword == null) {
		  if(qnastatus.equals("ALL")) {
			  if(qnadate != null) //1-1.1 메인화면 새문의글 조회용
				  query = sentence+" where qnadate like sysdate and qnastatus in ('Y', 'N') order by qnadate asc)) where rnum between ? and ?";
			  else	// 1-1
			  query = sentence+" where qnastatus in ('Y', 'N') order by qnadate asc)) where rnum between ? and ?";
		  }else // 1-2
			  query = sentence+" where qnastatus = '" + qnastatus + "' order by qnadate asc)) where rnum between ? and ?";
	  }else {
		  if(qnastatus.equals("ALL")) // 2-1
			  query = sentence+" where " + searchtype + " like '%" + keyword + "%' and qnastatus in ('Y', 'N') order by qnadate asc)) where rnum between ? and ?";
		  else // 2-2
			  query = sentence+" where " + searchtype + " like '%" + keyword + "%' and qnastatus = '" + qnastatus + "' order by qnadate asc)) where rnum between ? and ?";
	  }
	  
	  try {
		  pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
		
		while(rset.next()) {
			Qna q = new Qna();
			q.setQnaTitle(rset.getString("qnatitle"));
			q.setQnaStatus(rset.getString("qnastatus"));
			q.setQnaWriter(rset.getString("qnawriter"));
			q.setQnaDate(rset.getDate("qnadate"));
			q.setQnaViews(rset.getInt("qnaviews"));
			
			list.add(q);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	  
    return list;
  }

  // 관리자 Q&A 새문의글(Sysdate) 조회용
  public ArrayList<Qna> selectAllSystdate(Connection conn){
    ArrayList<Qna> newQList = new ArrayList<Qna>();
    Statement stmt = null;
    ResultSet rset = null;
    
    String query = "select * from Qna where qnadate like sysdate";
    
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

  // 관리글 문의글 삭제용
	public int deleteQnaAdmin(Connection conn, String qnano) {
		int result = 0;
		Statement stmt = null;
		
		String query = "delete qna where qnano = " + qnano;
		
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}




}
