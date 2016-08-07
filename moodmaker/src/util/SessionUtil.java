package util;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



/**
 * <PRE>
 * Comment   : 세션 유틸
 * History   : Ver 1.0
 * </PRE>
 * 
 * @version : 1.0.0
 * @author  : 승희
 */
public class SessionUtil {
	
	private final static Logger logger = LoggerFactory.getLogger(SessionUtil.class);

	/**
	 * 세션값 세팅
	 * @param HttpServletRequest request
	 * @param String key
	 * @param Object value
	 * @return 
	 */
	public static void setProperty(HttpServletRequest request, String key, Object value) {
		HttpSession session = request.getSession();
		logger.debug("SetKey : " + key + ", SetValue : " + value);
		session.setAttribute(key, value);
	}
	
	/**
	 * 세션값 가져오기
	 * @param HttpServletRequest request
	 * @param String key
	 * @return Object
	 */
	public static Object getProperty(HttpServletRequest request, String key) {
		HttpSession session = request.getSession(false);	
		if(key != null)
		logger.debug("GetKey : " + key + ", GetValue : " + session.getAttribute(key));
		return session == null?null:session.getAttribute(key);
	}
	
	/**
	 * 세션 가져오기
	 * @param HttpServletRequest request
	 * @return HttpSession
	 */
	public static HttpSession getSession(HttpServletRequest request){
		HttpSession session = request.getSession(false);		
		return session;
	}

	/**
	 * 세션값 삭제
	 * @param HttpServletRequest request
	 * @param String key
	 * @return 
	 */
	public static void removeProperty(HttpServletRequest request, String key) {
		HttpSession session = request.getSession();
		logger.debug("Del Key :" + key + ", Del Value : " + session.getAttribute(key));
		session.removeAttribute(key);
	}

	/**
	 * 세션값 보기
	 * @param HttpServletRequest request
	 * @param String key
	 * @return 
	 */
	public static void viewSessionString(HttpServletRequest request) {		
		HttpSession session = request.getSession(false);
		Enumeration se = session.getAttributeNames();
		while(se.hasMoreElements()){
			String att = (String)se.nextElement();
			logger.debug(att+":"+session.getAttribute(att));
		}
	}
}