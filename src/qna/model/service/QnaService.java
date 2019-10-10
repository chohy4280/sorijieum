package qna.model.service;

import java.util.ArrayList;

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
		return null;
	}
	
	// 관리자 Q&A 검색용
	public ArrayList<Qna> selectQnaSearch(String searchtype, String keyword, String answerstatus){
		return null;
	}
	
	// 관리자 Q&A 새문의글(Sysdate) 조회용
	public ArrayList<Qna> selectAllSystdate(){
		return null;
	}
	
	// 관리자 Q&A 미답변 목록 전체 조회용
	public ArrayList<Qna> selectAllUnanswer(){
		return null;
	}
}
