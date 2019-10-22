package qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import qna.model.dao.QnaDao;
import qna.model.vo.Qna;

public class QnaService {
	
	//의존성 주입
	public QnaDao qDao = new QnaDao();
	
	public QnaService() {}
	
	//목록
	public ArrayList<Qna> selectQnaList(){
		return null;
	}
	
	//한개
	public Qna selectQnaOne(int qnaNo) {
		return null;
	}
	
	//글 등록
	public int insertQna(Qna qna) {
		return 0;
	}
	
	//글 수정
	public int updateQna(Qna qna) {
		return 0;
	}
	
	//글 삭제
	public int deleteQna(int qnaNo) {
		return 0;
	}
	
	//제목으로 검색
	public ArrayList<Qna> selectTitleSearch(String keyword) {
		return null;
	}
	
	//작성자로 검색
	public ArrayList<Qna> selectWriterSearch(String keyword) {
		return null;
	}

	//관리자 서비스****************************************
	
	// 관리자 Q&A 전체조회 리스트 카운트용
	public int getListCountAdmin() {
		Connection conn = getConnection();
		int listCount = qDao.getListCountAdmin(conn);
		close(conn);
		return listCount;
	}
	// 관리자 Q&A 전체조회용
	public ArrayList<Qna> selectAll(int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<Qna> list = qDao.selectAll(conn, startRow, endRow);
		close(conn);
		return list;
	}
	
	
	// 관리자 Q&A 검색조회 리스트카운트
	public int getSearchListCountAdmin(String searchtype, String keyword, String qnastatus, String qnadate) {
		Connection conn = getConnection();
		int listCount = qDao.getSearchListCountAdmin(conn, searchtype, keyword, qnastatus, qnadate);
		close(conn);
		return listCount;
	}

	
	// 관리자 Q&A 검색용
	public ArrayList<Qna> selectQnaSearch(String searchtype, String keyword, String qnastatus, String qnadate, int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<Qna> list = qDao.selectQnaSearch(conn, searchtype, keyword, qnastatus, qnadate, startRow, endRow);
		close(conn);
		return list;
	}
	
	// 관리자 Q&A 새문의글(Sysdate) 조회용
	public ArrayList<Qna> selectAllSystdate(){
		Connection conn = getConnection();
		ArrayList<Qna> newQList = qDao.selectAllSystdate(conn);
		close(conn);
		return newQList;
	}
	
	// 관리자 Q&A 미답변 목록 전체 조회용
	public ArrayList<Qna> selectAllUnanswer(){
		Connection conn = getConnection();
		ArrayList<Qna> uaQList = qDao.selectAllUnanswer(conn);
		close(conn);
		return uaQList;
	}

	// 관리자 문의글 삭제용
	public int deleteQnaAdmin(String qnano) {
		Connection conn = getConnection();
		int result = qDao.deleteQnaAdmin(conn, qnano);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}





}
