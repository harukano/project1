package common.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.popup.PopupDAO;
import admin.model.popup.PopupDTO;
import registration.model.RegistrationDTO;
import util.SessionUtil;
import common.model.CommonDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class CommonController {

	private final static Logger logger = LoggerFactory.getLogger(CommonController.class);
	@Autowired
	private CommonDAO commonDAO;

	@Autowired
	private PopupDAO adminDao;

	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	@RequestMapping("index.do")
	public ModelAndView index(Model model) {

		// 팝업리스트 가져오깅 start
		ArrayList<PopupDTO> popupList = new ArrayList<PopupDTO>();
		try {
			popupList = (ArrayList<PopupDTO>) adminDao.listPopup();
			logger.debug("popupList size :::: " + popupList.size());
			// 스크립트에 정보를 넘겨줘야 하는대.. 태그로 인식함.. 일단 리플레이스 시킴
			for (PopupDTO popupDTO : popupList) {
				String content = popupDTO.getContext();
				content = content.trim();
				content = content.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
				content = content.replaceAll("'", "&#39;");
				popupDTO.setContext(content);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.error("에러발생 ::: " + e.toString());
		}
		model.addAttribute("popupList", popupList);
		// 팝업리스트 가져오깅 end

		ModelAndView view = new ModelAndView();
		view.setViewName("views/common/main");

		return view;
	}

	// 팝업뛰으는거 하나만 추가할께여~
	@RequestMapping("popup.jk")
	public ModelAndView popup(@RequestParam("seq") int seq, Model model) throws SQLException {

		ModelAndView view = new ModelAndView();
		logger.info("#########팝업 시작##########");

		PopupDTO popDto = new PopupDTO();
		popDto = adminDao.updatePopupForm(seq);

		model.addAttribute("popup", popDto);
		view.setViewName("/views/common/popup");

		return view;
	}

	@RequestMapping("login.do")
	public ModelAndView login(@RequestParam("login_email") String email,
			@RequestParam("login_password") String password, HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		HashMap<String, String> para = new HashMap<String, String>();
		RegistrationDTO dto = null;
		para.put("email", email);
		para.put("password", password);

		// membership_point_session,membership_another_name_session,membership_email_session
		try {
			dto = commonDAO.toLogin(para);
		} catch (SQLException e) {
			System.out.println("login : " + e.getMessage());
		}
		if (dto != null) {
			SessionUtil.setProperty(request, "membership_point", dto.getMembership_point());
			SessionUtil.setProperty(request, "membership_another_name", dto.getMembership_another_name());
			SessionUtil.setProperty(request, "membership_email", dto.getMembership_email());
		} else {

		}
		view.setViewName("views/common/main");
		return view;
	}

	@RequestMapping("logout.do")
	public String toLogout(HttpSession session) {
		session.removeAttribute("membership_point");
		session.removeAttribute("membership_another_name");
		session.removeAttribute("membership_email");
		return "redirect:index.do";

	}

	@RequestMapping("community.do")
	public ModelAndView community() {
		return new ModelAndView("views/community/write_article");
	}

	@RequestMapping("about.do")
	public ModelAndView about() {
		return new ModelAndView("views/about/about");
	}

	@RequestMapping("lostpassword.do")
	public ModelAndView lostPassword() {
		return new ModelAndView("views/registration/lostpassword");
	}

}
