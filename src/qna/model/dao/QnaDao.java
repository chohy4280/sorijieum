package qna.model.dao;

import java.sql.*;
import java.util.ArrayList;

import qna.model.vo.Qna;

public class QnaDao {
	
	public QnaDao() {};
	
	
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
