package registration.model;

import java.sql.SQLException;
import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class RegistrationDAO extends SqlSessionDaoSupport {
	public int checkEmail(String email) throws SQLException {
		int result = 0;
		result = getSqlSession().selectOne("checkedemail", email);
		return result;
	}

	public void insertMember(RegistrationDTO dto) throws SQLException {
		getSqlSession().insert("registmember", dto);
	}

	public int checkName(String name) throws SQLException {
		int result = 0;
		result = getSqlSession().selectOne("checkedname", name);
		return result;
	}

	public int checkallEmail(HashMap<String, String> para) throws SQLException {
		int result = 0;
		result = getSqlSession().selectOne("checkedallemail", para);
		return result;
	}

	public void resetPassword(RegistrationDTO dto) throws SQLException {
		getSqlSession().update("resetpassword", dto);
	}

}
