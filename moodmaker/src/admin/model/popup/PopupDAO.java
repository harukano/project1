package admin.model.popup;
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


public class PopupDAO extends SqlSessionDaoSupport{
	private final static Logger logger = LoggerFactory.getLogger(PopupDAO.class);
	
	//팝업등록된 갯수 구해오는 쿼리문.
	public int selectPopupSeq() throws SQLException {
		logger.debug("admin.SELECT_POPUP_SEQ 쿼리 실행");
		return (Integer)getSqlSession().selectOne("admin.SELECT_POPUP_SEQ");
	}
	
	//팝업등록 쿼리문.
	public void insertPopup(Map<String, Object> inputMap) throws SQLException{
		logger.debug("admin.INSERT_POPUP 쿼리 실행");
		getSqlSession().insert("admin.INSERT_POPUP", inputMap);
	}
	
	//팝업갯수 구해오는 쿼리문
	public int selectPopupCount()throws SQLException{
		logger.debug("admin.SELECT_POPUP_TOTAL 쿼리 실행");
		return (Integer)getSqlSession().selectOne("admin.SELECT_POPUP_TOTAL");
	}
	
	//팝업리스트 구해오는 쿼리문
	public List<Map<String, Object>> selectPopupList(Map<String, Object> inputMap) throws SQLException{
		
		return getSqlSession().selectList("admin.SELECT_POPUP_LIST", inputMap);
	}
	
	//팝업상세 화면
	public PopupDTO updatePopupForm(int seq)throws SQLException{
		
		return (PopupDTO) getSqlSession().selectOne("admin.UPDATE_POPUP_ONE", seq);
	}
	
	//팝업 수정
	public void updatePopupForm(Map<String, Object> inputMap)throws SQLException{
		getSqlSession().update("admin.UPDATE_POPUP", inputMap);
	}
	
	//팝업 삭제
	public void deletePopup(int seq)throws SQLException{
		getSqlSession().delete("admin.DELETE_POPUP", seq);
	}
	
	//메인페이지에서 팝업 리스트 불러오기
	public List<PopupDTO> listPopup()throws SQLException{
		return getSqlSession().selectList("admin.LIST_POUP");
	}
	
	//화면에 진짜 팝업 뛰어주기
	public List<PopupDTO> popup(int seq)throws SQLException{
		logger.debug("TEST:::::");
		return getSqlSession().selectOne("admin.UPDATE_POPUP_ONE", seq);
	}


}
