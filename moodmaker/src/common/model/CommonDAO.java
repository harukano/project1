package common.model;

import java.sql.SQLException;
import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import registration.model.RegistrationDTO;

public class CommonDAO extends SqlSessionDaoSupport {
	public RegistrationDTO toLogin(HashMap<String, String> para) throws SQLException {
		RegistrationDTO dto = getSqlSession().selectOne("login", para);
		return dto;
	}

}
