package likebook.model.service;

import likebook.model.dao.LikeBookDao;
import static common.JDBCTemplate.*;

public class LikeBookService {
	
	//의존성 주입
	public LikeBookDao lbDao = new LikeBookDao();
	
	public LikeBookService() {}

}
