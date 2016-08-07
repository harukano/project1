package util;

import org.springframework.ui.Model;

public class MAVUtil {

	/**
	 * 메시지 alert 처리
	 * 
	 * 메시지 alert 처리 후 자바스트립트로 페이지 이동
	 *  
	 * @param  errMsg String
	 * @param  goPage String
	 * @param  model Model 
	 * @return String
	 * @since 2016.07.14
	 */	
	public static String goMsgPage(String errMsg, String goPage, Model model) {
		model.addAttribute("errMsg", errMsg);
		model.addAttribute("goPage", goPage);
		return "/views/exception/goMsgPage";
	}
	
	/**
	 * 메시지 alert 처리
	 * 
	 * 메시지 alert 처리 후 자바스트립트로 history.back() 이동
	 *  
	 * @param  errMsg String
	 * @param  model Model 
	 * @return String
	 * @since 2016.07.14
	 */	
	public static String goMsgBack(String errMsg, Model model) {
		model.addAttribute("errMsg", errMsg);
		model.addAttribute("goPage", "back");
		return "/views/exception/goMsgPage";
	}
}
