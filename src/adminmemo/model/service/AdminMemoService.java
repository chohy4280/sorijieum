package adminmemo.model.service;

import java.util.ArrayList;

import adminmemo.model.dao.AdminMemoDao;
import adminmemo.model.vo.AdminMemo;


public class AdminMemoService {
	//의존성 주입
	public AdminMemoDao admemoDao = new AdminMemoDao();
	
	public AdminMemoService() {}
	
	
	// 관리자 서비스 *********************************************
	// 관리자 메모 전체보기
	public ArrayList<AdminMemo> selectAll(){
		return null;
	}
	
	// 관리자 메모 등록용
	public int insertAdminMemo(AdminMemo admemo) {
		return 0;
	}
	
	// 관리자 메모 삭제용
	public int deleteAdminMemo(int memono) {
		return 0;
	}
	
}
