package qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.vo.Member;

import static common.JDBCTemplate.*;

import qna.model.dao.QnaDao;
import qna.model.vo.Qna;

public class QnaService {
	
	//의존성 주입
	public QnaDao qDao = new QnaDao();
	
	public QnaService() {}
	
	//전체 목록 개수 조회
	public int getListCount() {
		Connection conn = getConnection();
		int result = qDao.getListCount(conn);
		close(conn);
		return result;
	}
	
	//고정글 리스트 
	public ArrayList<Qna> selectQnaTopList() {
		Connection conn = getConnection();
		ArrayList<Qna> toplist = qDao.selectQnaTopList(conn);
		close(conn);
		return toplist;
	}
	
	//목록
	public ArrayList<Qna> selectQnaList(int startnum, int endnum){
		Connection conn = getConnection();
		ArrayList<Qna> list = qDao.selectQnaList(conn, startnum, endnum);
		close(conn);
		return list;
	}
	
	//한개
	public Qna selectQnaOne(int qnano) {
		Connection conn = getConnection();
		Qna qna = qDao.selectQnaOne(conn, qnano);
		close(conn);
		return qna;
	}
	
	//조회수 증가
	public void updateViews(int no) {
		Connection conn = getConnection();
		int result = qDao.updateViews(conn,no);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
	}
	
	//삭제시 답변 유무 변경
	public void deleteQnaCommYN(int qnano) {
		Connection conn = getConnection();
		int result = qDao.deleteQnaCommYN(conn, qnano);
		if(result>0) 
			commit(conn);
		else
			rollback(conn);
		close(conn);
	}
	
	//등록시 답변 유무 변경
	public void insertQnaCommYN(int qnano) {
		Connection conn = getConnection();
		int result = qDao.insertQnaCommYN(conn, qnano);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
	}
		
	//글 등록
	public int insertQna(Qna qna) {
		Connection conn = getConnection();
		int result = qDao.insertQna(conn, qna);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//글 수정
	public int updateQna(Qna qna) {
		Connection conn = getConnection();
		int result = qDao.updateQna(conn, qna);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//글 삭제
	public int deleteQna(int qnano) {
		Connection conn = getConnection();
		int result = qDao.deleteQna(conn, qnano);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//Q&A 검색
	public ArrayList<Qna> searchQna(String type, String keyword) {
		Connection conn = getConnection();
		ArrayList<Qna> list = qDao.searchQna(conn,type,keyword);
		close(conn);
		return list;
	}
	
	//상세보기페이지 이전글번호
	public int getLastNo(int qnano) {
		Connection conn = getConnection();
		int lastno = qDao.getLastNo(conn,qnano);
		close(conn);
		return lastno;
	}
	
	//상세보기페이지 다음글번호
	public int getNextNo(int qnano) {
		Connection conn = getConnection();
		int lastno = qDao.getNextNo(conn,qnano);
		close(conn);
		return lastno;
	}

	//마이페이지 내 문의 알림용
	public ArrayList<Qna> selectQnaAlarmList(String userid) {
		Connection conn = getConnection();
		ArrayList<Qna> list = qDao.selectQnaAlarmList(conn,userid);
		close(conn);
		return list;
	}
	
	//마이페이지 내 문의 리스트 조회
	public ArrayList<Qna> selectMyQnaList(String userid) {
		Connection conn = getConnection();
		ArrayList<Qna> list = qDao.selectMyQnaList(conn,userid);
		close(conn);
		return list;
	}

	//마이페이지 내 문의 알림 삭제
	public int deleteAlarm(int qnano) {
		Connection conn = getConnection();
		int result = qDao.deleteAlarm(conn,qnano);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}
	
	//상단 알림 개수 조회용
	public int getAlarmCount(String userid) {
		Connection conn = getConnection();
		int result = qDao.getAlarmCount(conn,userid);
		close(conn);
		return result;
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
