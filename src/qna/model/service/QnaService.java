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
	// 관리자 Q&A 전체조회용
	public ArrayList<Qna> selectAll(){
		Connection conn = getConnection();
		ArrayList<Qna> list = qDao.selectAll(conn);
		close(conn);
		return list;
	}
	
	// 관리자 Q&A 검색용
	public ArrayList<Qna> selectQnaSearch(String searchtype, String keyword, String qnastatus){
		Connection conn = getConnection();
		ArrayList<Qna> list = qDao.selectQnaSearch(conn, searchtype, keyword, qnastatus);
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
}
