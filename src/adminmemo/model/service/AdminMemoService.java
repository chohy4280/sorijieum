package adminmemo.model.service;

import adminmemo.model.vo.AdminMemo;
import static common.JDBCTemplate.*;

public class AdminMemoService {
	//의존성 주입
	public AdminMemo admemoDao = new AdminMemo();
	
	public AdminMemoService() {}
}
