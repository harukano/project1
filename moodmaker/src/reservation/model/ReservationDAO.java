package reservation.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ReservationDAO extends SqlSessionDaoSupport {

	public List<RunningInfoBean> getMovieList() throws SQLException {
		List<RunningInfoBean> list = getSqlSession().selectList("getRunningMovies");
		return list;
	}

	public HashMap<String, String> getRunningDays() throws SQLException {
		HashMap<String, String> map = getSqlSession().selectOne("getRunningDay");
		return map;
	}

	public List<RunningInfoBean> getInfoforDay(String fortheday) throws SQLException {
		List<RunningInfoBean> list = getSqlSession().selectList("getInfoforDay", fortheday);
		return list;
	}

	public List<RunningInfoBean> getRunningInfo(HashMap<String, String> para) throws SQLException {
		List<RunningInfoBean> list = getSqlSession().selectList("getRunningInfo", para);
		return list;
	}

	public List<HashMap> getSeatslist(String para) throws SQLException {
		List<HashMap> list = getSqlSession().selectList("getSeatslist", para);
		return list;
	}

	public void reserveSeats(HashMap<String, String> para) throws SQLException {
		getSqlSession().insert("reserveseats", para);
	}

}
