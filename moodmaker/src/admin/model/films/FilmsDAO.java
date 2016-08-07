package admin.model.films;
/*
============================================================================
 -. 업  무  명 : 승희의 취업을 위한 프로젝트
 -. 프로그램명 : 관리자 페이지 DAO - PC
 -. 기      능 : 무드메이커 관리자 페이지
============================================================================
    <프로그램 추가 및 변경사항>>
----------------------------------------------------------------------------
  성  명 : 일    자 :  내       용
----------------------------------------------------------------------------
  김승희 : 2016-07-13 : 신규
============================================================================
*/

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class FilmsDAO extends SqlSessionDaoSupport{
	private final static Logger logger = LoggerFactory.getLogger(FilmsDAO.class);
	
	//영화목록 토탈 갯수
	public int filmslist_total()throws SQLException{
		logger.debug("SELECT_FILMS_TOTAl쿼리 실행");
		int total = getSqlSession().selectOne("film.SELECT_FILMS_TOTAl");
		return total;
	}
	
	//영화리스트 구해오는 쿼리
	public List<FilmsDTO> filmslist(Map<String, Object> inputMap)throws SQLException{
		logger.debug("SELECT_FILMS_LIST쿼리 실행");
		return getSqlSession().selectList("film.SELECT_FILMS_LIST", inputMap);
	}
	
	//영화장르 구해오기
	public List<Map<String, Object>> genre_List()throws SQLException{
		logger.debug("SELECT_LIST_GENRE쿼리 실행");
		return getSqlSession().selectList("film.SELECT_LIST_GENRE");
	}
	
	//영화등록 하기
	public void insertfilms(Map<String, Object> inputMap)throws SQLException{
		logger.debug("INSERT_FILMS쿼리 실행");
		getSqlSession().insert("film.INSERT_FILMS", inputMap);
	}
	
	//select_filmidx Max 구해오기
	public int select_filmidx()throws SQLException{
		logger.debug("SELECT_FILMIDX쿼리 실행");
		return getSqlSession().selectOne("film.SELECT_FILMIDX");
	}
	
	//영화상세화면
	public FilmsDTO updatefilmsform(int film_idx)throws SQLException{
		logger.debug("UPDATE_FILMS_FORM쿼리 실행");
		return (FilmsDTO)getSqlSession().selectOne("film.UPDATE_FILMS_FORM", film_idx);
	}
	
}
