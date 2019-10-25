package qna.model.dao;

import static common.JDBCTemplate.*;

import java.sql.*;

import java.util.ArrayList;

import member.model.vo.Member;
import qna.model.vo.Qna;

public class QnaDao {
	
	public QnaDao() {};
	
	//목록 전체 개수 조회
	public int getListCount(Connection conn) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select count(*) from qna where qnatop='N'";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	
	//고정글 리스트
	public ArrayList<Qna> selectQnaTopList(Connection conn) {
		ArrayList<Qna> toplist = new ArrayList<Qna>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from qna where qnatop='Y'";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Qna qna = new Qna();
				qna.setQnaNo(rset.getInt("qnano"));
				qna.setQnaTitle(rset.getString("qnatitle"));
				qna.setQnaWriter(rset.getString("qnawriter"));
				qna.setQnaDate(rset.getDate("qnadate"));
				qna.setQnaViews(rset.getInt("qnaviews"));
				qna.setQnaStatus(rset.getString("qnastatus"));
				qna.setQnaTop(rset.getString("qnatop"));
				toplist.add(qna);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return toplist;
	}

	//목록
	public ArrayList<Qna> selectQnaList(Connection conn, int startnum, int endnum){
		ArrayList<Qna> list = new ArrayList<Qna>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum,qnano,qnatitle,qnawriter,qnadate,qnastatus,qnaviews,qnatop "+
						"from (select * from qna where qnatop='N' order by qnano desc)) where rnum>=? and rnum<=?";
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna qna = new Qna();
				qna.setQnaNo(rset.getInt("qnano"));
				qna.setQnaTitle(rset.getString("qnatitle"));
				qna.setQnaWriter(rset.getString("qnawriter"));
				qna.setQnaDate(rset.getDate("qnadate"));
				qna.setQnaViews(rset.getInt("qnaviews"));
				qna.setQnaStatus(rset.getString("qnastatus"));
				qna.setQnaTop(rset.getString("qnatop"));
				
				list.add(qna);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	//한개
	public Qna selectQnaOne(Connection conn, int qnano) {
		Qna qna = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from qna where qnano=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qnano);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				qna = new Qna();
				qna.setQnaNo(qnano);
				qna.setQnaTitle(rset.getString("qnatitle"));
				qna.setQnaWriter(rset.getString("qnawriter"));
				qna.setQnaContent(rset.getString("qnacontent"));
				qna.setQnaDate(rset.getDate("qnadate"));
				qna.setQnaViews(rset.getInt("qnaviews"));
				qna.setQnaStatus(rset.getString("qnastatus"));
				qna.setQnaOfile(rset.getString("qnaofile"));
				qna.setQnaRfile(rset.getString("qnarfile"));
				qna.setQnaTop(rset.getString("qnatop"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qna;
	}
	
	//조회수 증가
	public int updateViews(Connection conn,int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update qna set qnaviews=qnaviews+1 where qnano=? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//삭제시 답변유무 변경
	public int deleteQnaCommYN(Connection conn, int qnano) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update qna set qnastatus='N' where qnano=?";
		
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
	
	//답변 등록시 답변유무 변경
	public int insertQnaCommYN(Connection conn, int qnano) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update qna set qnastatus='Y' where qnano=?";
		
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
	
	//글 등록
	public int insertQna(Connection conn, Qna qna) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into qna values(seq_qnano.nextval,?,?,?,sysdate,default,default,default,default,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qna.getQnaTitle());
			pstmt.setString(2, qna.getQnaWriter());
			pstmt.setString(3, qna.getQnaContent());
			pstmt.setString(4, qna.getQnaTop());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//글 수정
	public int updateQna(Connection conn, Qna qna) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update qna set qnatitle=?,qnacontent=?,qnadate=sysdate where qnano=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qna.getQnaTitle());
			pstmt.setString(2, qna.getQnaContent());
			pstmt.setInt(3, qna.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//글 삭제
	public int deleteQna(Connection conn, int qnano) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from qna where qnano=?";
		
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
	
	//Q&A 글 검색
	public ArrayList<Qna> searchQna(Connection conn, String type, String keyword) {
		ArrayList<Qna> list = new ArrayList<Qna>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from qna where ";
		if(type.equals("title")) 
			query += "qnatitle like ? ";
		else if(type.equals("writer")) 
			query += "qnawriter like ? ";
		query += "order by qnano desc";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna qna = new Qna();
				qna.setQnaNo(rset.getInt("qnano"));
				qna.setQnaTitle(rset.getString("qnatitle"));
				qna.setQnaWriter(rset.getString("qnawriter"));
				qna.setQnaContent(rset.getString("qnacontent"));
				qna.setQnaDate(rset.getDate("qnadate"));
				qna.setQnaViews(rset.getInt("qnaviews"));
				qna.setQnaStatus(rset.getString("qnastatus"));
				qna.setQnaOfile(rset.getString("qnaofile"));
				qna.setQnaRfile(rset.getString("qnarfile"));
				qna.setQnaTop(rset.getString("qnatop"));
				
				list.add(qna);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
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
	  
	  String query = "select * from (select rownum rnum, qnano, qnastatus, qnatitle, qnawriter, qnadate, qnaviews from (select * from qna order by qnadate desc)) where rnum between ? and ?";
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
		 	  
		 	  if(keyword == null || keyword=="") {
		 		  if(qnastatus.equals("ALL")) {
		 			  if(qnadate.equals("sysdate")) //1-1.1 메인화면 새문의글 조회용
		 				  query = "select count(*) from (select * from qna where qnadate like sysdate) where qnastatus in ('Y', 'N')";
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
	  
	  if(keyword == null || keyword=="") {
		  if(qnastatus.equals("ALL")) {
			  if(qnadate.equals("sysdate")) //1-1.1 메인화면 새문의글 조회용
				  query = sentence+" where qnadate like sysdate and qnastatus in ('Y', 'N') order by qnadate desc)) where rnum between ? and ?";
			  else	// 1-1
			  query = sentence+" where qnastatus in ('Y', 'N') order by qnadate desc)) where rnum between ? and ?";
		  }else // 1-2
			  query = sentence+" where qnastatus = '" + qnastatus + "' order by qnadate desc)) where rnum between ? and ?";
	  }else {
		  if(qnastatus.equals("ALL")) // 2-1
			  query = sentence+" where " + searchtype + " like '%" + keyword + "%' and qnastatus in ('Y', 'N') order by qnadate desc)) where rnum between ? and ?";
		  else // 2-2
			  query = sentence+" where " + searchtype + " like '%" + keyword + "%' and qnastatus = '" + qnastatus + "' order by qnadate desc)) where rnum between ? and ?";
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
			q.setQnaNo(rset.getInt("qnano"));
			
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
