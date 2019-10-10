package quit.model.service;

import quit.model.dao.QuitDao;
import static common.JDBCTemplate.*;

public class QuitService {
	
	//의존성 주입
	public QuitDao qDao = new QuitDao();
	
	public QuitService() {}

}
