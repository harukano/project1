package util;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;


/*
 * Copyright (c) 2008 L&J System Co. All Rights Reserved.
 * 
 * @author :ddakker@naver.com
 * 
 * @date :2008. 04. 23
 *
 */
public class ParamUtils {
	
	 /**
	  * request printParameter
      * @param request
      * @return
      */
    public static String printParameter(HttpServletRequest request){
		
    	
    	
    	
		String paramsMsg = "\n";
		
		paramsMsg += "==================== printParameter S ====================" + "\n";
		
		paramsMsg += "==== IP : " + request.getRemoteAddr() + "\n";
		paramsMsg += "==== URL : " + request.getRequestURI() + "\n";
		
		Map map = request.getParameterMap();
		
		if( map != null ){
		
			Set set = map.keySet();
			Iterator it = set.iterator();
			while( it.hasNext() ){
				String key	 = (String)it.next();
				String value = "";
				
				if( map.get(key) instanceof String[]) {
					String [] tempStr = (String[]) map.get(key);
					for( String temp : tempStr ){
						value += (value.length()==0?"":",") + temp;
					}
				}else{
					value = map.get(key).toString();
				}
				
				paramsMsg += "==== " + key + " : " + value + "\n";
				
			}
		}
		
		paramsMsg += "==================== printParameter E ====================" + "\n";
		
		
		return paramsMsg;
	}
    
    /**
     * getParameter
     * @param request
     * @param param		key null
     * @return
     */
    public static String getParameter(HttpServletRequest request, String param) {
    	
    	return getParameter(request, param, null);
    }
    
    /**
     * getParameter null 일 경우 defaultValuewlwjd
     * @param request
     * @param param			key 
     * @param defaultValue	null 
     * @return
     */
    public static String getParameter(HttpServletRequest request, String param, String defaultValue) {
    	
    	String str = request.getParameter(param);
    	
    	return str==null || "".equals(str)?defaultValue:str;
    }
    
    /**
     * getParameterInt
     * @param request
     * @param param		value -1
     * @return
     */
    public static int getParameterInt(HttpServletRequest request, String param) {
    	return getParameterInt(request, param, -1);
    }
    
    /**
     * XSS 대응
     * @param request
     * @param param			key 
     * @param defaultValue	null 
     * @return
     */
    public static String getParameterXSS(HttpServletRequest request, String param, String defaultValue) {
    	
    	String str = request.getParameter(param);
    	
    	return str==null || "".equals(str)?defaultValue:getCleanXSS(str);
    }
    
    /**
     * getParameterInt
     * @param request
     * @param param		value
     * @return			
     */
    public static int getParameterInt(HttpServletRequest request, String param, int defaultValue) {
    	
    	int returnValue = 0;
    	String str = request.getParameter(param);
    	
    	str = str==null?"":str.trim();
    	
    	if( str.equals("") ){
    		returnValue = defaultValue;
    	}else{
    		returnValue = Integer.parseInt( str ); 
    	}
    	
    	return returnValue;
    }
    
    /**
     * getParameterLong ( long )
     * @param request
     * @param param		value
     * @return
     */
    public static long getParameterLong(HttpServletRequest request, String param) {
    	return getParameterLong(request, param, 0L);
    }
    
    /**
     * getParameterLong
     * @param request
     * @param param		value
     * @return			
     */
    public static long getParameterLong(HttpServletRequest request, String param, long defaultValue) {
    	
    	long returnValue = 0L;
    	String str = request.getParameter(param);
    	
    	str = str==null?"":str.trim();
    	
    	if( str.equals("") ){
    		returnValue = defaultValue;
    	}else{
    		returnValue = Long.parseLong( str ); 
    	}
    	
    	return returnValue;
    }
    
    /**
     * getParameterBool true ( boolean )
     * @param request
     * @param param
     * @return
     */
    public static boolean getParameterBool(HttpServletRequest request, String param) {
    	
    	boolean returnValue = false;
    	String str = request.getParameter(param);
    	
    	str = str==null?"":str.trim();
    	
    	if( str.equals("true") ){
    		returnValue = true;
    	}
    	
    	return returnValue;
    }
 
    /**
     * getParameterComma true ( boolean )
     * @param request
     * @param param
     * @return String[]
     */
    public static String[] getParameterComma(HttpServletRequest request, String param, String regex) {
    	String value = getParameter(request, param, "");
    	if( value.trim().length() == 0 ){
    		return new String[0];
    	}else{    	
    		return value.split(regex);
    	}
    }
    
    /*
	 *XSS 대응
	 */
	public static String getCleanXSS(String value) {
		if("".equals(StringUtils.trimToEmpty(value)))return "";
		
		//크로스 싸이트 스크립팅 방지
		value = value.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		value = value.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
		value = value.replaceAll("'", "&#39;");
		value = value.replaceAll("eval\\((.*)\\)", "");
		value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		
		//url 을 파라미터로 보낸경우 대소문자 변경하지 않음.
		if(value.contains(".nh") || value.contains(".jsp")){
			return value;
		}
			
		String value_str= value.toLowerCase();
		if(value_str.contains("script")){
			value = value_str;
			value = value.replaceAll("script", "_");
		} 
		if(value_str.contains("object")){
			value = value_str;
			value = value.replaceAll("object", "_");
		} 
		if(value_str.contains("applet")){
			value = value_str;
			value = value.replaceAll("applet", "_");
		} 
		if(value_str.contains("embed")){
			value = value_str;
			value = value.replaceAll("embed", "_");
		} 
		if(value_str.contains("form")){
			value = value_str;
			value = value.replaceAll("form", "_");
		} 
		if(value_str.contains("iframe")){
			value = value_str;
			value = value.replaceAll("iframe", "_");
		}

		// sql 인젝션 공격 방지 (특수 구문 필터링)
		String value_low= value.toLowerCase();
		if(value_low.contains("select") || value_low.contains("insert") || value_low.contains("drop") || value_low.contains("update") || value_low.contains("delete") || value_low.contains("join") || value_low.contains("from") || value_low.contains("where") )
		{
			value = value_low;
			value = value.replaceAll("select", "q-select");
			value = value.replaceAll("insert", "q-insert");
			value = value.replaceAll("drop", "q-drop");
			value = value.replaceAll("update", "q-update");
			value = value.replaceAll("delete", "q-delete");
			value = value.replaceAll("and", "q-and");
			value = value.replaceAll("or", "q-or");
			value = value.replaceAll("join", "q-join");
			value = value.replaceAll("from", "q-from");
			value = value.replaceAll("where", "q-where");
		}
		return value;
	}
    
}
