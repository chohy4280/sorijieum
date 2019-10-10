package quit.model.service;

import java.util.ArrayList;

import quit.model.dao.QuitDao;
import quit.model.vo.Quit;

public class QuitService {
	
	//의존성 주입
	public QuitDao qDao = new QuitDao();
	
	public QuitService() {}
	
	
	//관리자 서비스****************************************
	// 관리자 탈퇴회원 전체 조회용
	public ArrayList<Quit> selectAll(){
		return null;
	}
	
	// 관리자 탈퇴화원 검색 조회용
	public ArrayList<Quit> selectQuitMemberSearch(String membertype, String userid, String quittype){
		return null;
	}

}
