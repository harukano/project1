package registration.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import registration.model.RegistrationDAO;
import registration.model.RegistrationDTO;
import util.Test_logger;

@Controller
public class RegistrationController {
	@Autowired
	private RegistrationDAO registrationDAO;
	private final static Logger logger = LoggerFactory.getLogger(RegistrationController.class);

	public void setRegistrationDAO(RegistrationDAO registrationDAO) {
		this.registrationDAO = registrationDAO;
	}

	@RequestMapping(value = "registration.do", method = RequestMethod.GET)
	public ModelAndView toRegistration() {
		ModelAndView view = new ModelAndView();
		view.setViewName("views/registration/registration");
		return view;
	}

	@RequestMapping(value = "registration.do", method = RequestMethod.POST)
	public ModelAndView insertMember(RegistrationDTO dto) {
		ModelAndView view = new ModelAndView();

		try {
			registrationDAO.insertMember(dto);
		} catch (SQLException e) {
			System.out.println("insertMember : " + e.getMessage());
		}
		view.setViewName("views/common/comfirm");
		return view;
	}

	@RequestMapping(value = "emailcheck.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> checkEmail(@RequestParam("membership_email") String email) {
		Map<String, String> map = new HashMap<String, String>();
		int result = 0;

		try {
			result = registrationDAO.checkEmail(email);
		} catch (SQLException e) {
			System.out.println("checked email : " + e.getMessage());
		}

		if (result == 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}

		return map;
	}

	@RequestMapping(value = "namecheck.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> checkName(@RequestParam("membership_another_name") String name) {
		Map<String, String> map = new HashMap<String, String>();
		int result = 0;

		try {
			result = registrationDAO.checkName(name);
		} catch (SQLException e) {
			System.out.println("checked nickname : " + e.getMessage());
		}

		if (result == 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}

		return map;
	}

	@RequestMapping(value = "allmailcheck.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> checklossEmail(@RequestParam HashMap<String, String> para) {
		Map<String, String> map = new HashMap<String, String>();

		int result = 0;

		try {
			result = registrationDAO.checkallEmail(para);
		} catch (SQLException e) {
			System.out.println("checked email : " + e.getMessage());
		}

		if (result == 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}

		return map;
	}

	@RequestMapping(value = "resetpasswordform.do", method = RequestMethod.POST)
	public ModelAndView toResetpassForm(@RequestParam("membership_email") String email) {
		ModelAndView view = new ModelAndView();

		view.addObject("membership_email", email);
		view.setViewName("views/registration/resetpassword");
		return view;
	}

	@RequestMapping(value = "resetpassword.do", method = RequestMethod.POST)
	public ModelAndView toResetpass(RegistrationDTO dto) {
		ModelAndView view = new ModelAndView();
		try {
			registrationDAO.resetPassword(dto);
		} catch (SQLException e) {
			System.out.println("reset password : " + e.getMessage());
		}

		view.setViewName("views/common/main");
		return view;
	}
}
