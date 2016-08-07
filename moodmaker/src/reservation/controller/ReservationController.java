package reservation.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import reservation.model.ReservationDAO;
import reservation.model.RunningInfoBean;

@Controller
public class ReservationController {
	@Autowired
	private ReservationDAO reservationDAO;
	private final static Logger logger = LoggerFactory.getLogger(ReservationController.class);

	public void setReservationDAO(ReservationDAO reservationDAO) {
		this.reservationDAO = reservationDAO;
	}

	@RequestMapping("reservation.do")
	public ModelAndView step1() {
		ModelAndView view = new ModelAndView();

		view.setViewName("views/reservation/reservation");

		return view;
	}

	@RequestMapping(value = "movielist.do", method = RequestMethod.POST)
	public @ResponseBody List<RunningInfoBean> getMovieList(/* @RequestParam("test") int test */) {
		// ModelAndView view = new ModelAndView();
		List<RunningInfoBean> list = null;

		try {
			list = reservationDAO.getMovieList();
		} catch (SQLException e) {
			System.out.println("reservation : " + e.getMessage());
		}
		return list;
	}

	@RequestMapping(value = "movielistforday.do", method = RequestMethod.POST)
	public @ResponseBody List<RunningInfoBean> getMovieListforDay(
			@RequestParam("fortheday") String fortheday) {
		// ModelAndView view = new ModelAndView();
		List<RunningInfoBean> list = null;

		try {
			logger.debug(fortheday + "%");
			list = reservationDAO.getInfoforDay(fortheday + "%");
		} catch (SQLException e) {
			System.out.println("reservation : " + e.getMessage());
		}
		return list;
	}

	@RequestMapping(value = "runninginfo.do", method = RequestMethod.POST)
	public @ResponseBody List<RunningInfoBean> getRunningInfo(@RequestParam HashMap<String, String> para) {
		List<RunningInfoBean> list = null;
		String inDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		String inTime = new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date());

		para.put("end_show_time", para.get("start_show_time") + " 23:59:00");

		if (inDate.equals(para.get("start_show_time"))) {
			para.put("start_show_time", para.get("start_show_time") + " " + inTime);
		} else {
			para.put("start_show_time", para.get("start_show_time") + " 00:00:00");
		}

		logger.debug(para.get("end_show_time"));
		logger.debug(para.get("start_show_time"));
		logger.debug(para.get("film_idx"));
		logger.debug(para.get("branch_code"));
		try {
			list = reservationDAO.getRunningInfo(para);
		} catch (SQLException e) {
			logger.error("getRunningInfo");
			System.out.println("getRunningInfo : " + e.getMessage());
		}

		return list;

	}

	@RequestMapping(value = "daylist.do", method = RequestMethod.POST)
	public @ResponseBody ArrayList<HashMap> getDayList() {
		// ModelAndView view = new ModelAndView();
		HashMap<String, String> map = new HashMap<String, String>();
		ArrayList<HashMap> list = new ArrayList<HashMap>();
		try {
			map = reservationDAO.getRunningDays();
		} catch (SQLException e) {
			System.out.println("day-reservation : " + e.getMessage());
		}
		int cha = Integer.parseInt(map.get("cha"));
		Calendar cal = Calendar.getInstance();
		for (int i = 0; i <= cha; i++) {
			HashMap<String, String> map1 = new HashMap<String, String>();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
			String mweek = "";
			switch (dayofweek) {
			case 1:
				mweek = "일";
				break;
			case 2:
				mweek = "월";
				break;
			case 3:
				mweek = "화";
				break;
			case 4:
				mweek = "수";
				break;
			case 5:
				mweek = "목";
				break;
			case 6:
				mweek = "금";
				break;
			case 7:
				mweek = "토";
				break;
			}
			cal.add(Calendar.DAY_OF_MONTH, 1);

			map1.put("year", String.valueOf(year));
			if (month < 10) {
				map1.put("month", "0" + String.valueOf(month));
			} else {
				map1.put("month", String.valueOf(month));
			}
			if (day < 10) {
				map1.put("day", "0" + String.valueOf(day));
			} else {
				map1.put("day", String.valueOf(day));
			}
			map1.put("dayofweek", mweek);

			list.add(map1);
		}

		return list;
	}

	// 좌석정보 seats list
	@RequestMapping(value = "seatslist.do", method = RequestMethod.POST)
	public @ResponseBody List<HashMap> getSeatslist(@RequestParam("info") String para) {
		HashMap<String, String> map = new HashMap<String, String>();
		List<HashMap> list = new ArrayList<HashMap>();
		try {
			list = reservationDAO.getSeatslist(para);
			// System.out.println(list.size());
		} catch (SQLException e) {
			logger.debug("getSeatslist: " + e.getMessage());
		}

		return list;
	}

	@RequestMapping(value = "procreserve.do", method = RequestMethod.POST)
	public ModelAndView reserveProc(HttpServletRequest request,
			@RequestParam("running_idx") String running_idx,
			@RequestParam("membership_email") String membership_email,
			@RequestParam("seat_number") String seat_number, @RequestParam("sale_price") String sale_price) {
		ModelAndView view = new ModelAndView();
		HashMap<String, String> para = new HashMap<String, String>();
		String[] list = seat_number.split(" ");

		para.put("running_idx", running_idx);
		para.put("membership_email", membership_email);
		para.put("sale_price", sale_price);

		for (String str : list) {
			para.put("seat_number", str);
			try {
				reservationDAO.reserveSeats(para);
			} catch (Exception e) {
				logger.debug("reserveProc: " + e.getMessage());
			}
		}
		view.setViewName("views/common/main");

		return view;
	}

	@RequestMapping(value = "paypal.do")
	public ModelAndView paypalform() {
		ModelAndView view = new ModelAndView();
		view.setViewName("views/reservation/iamport");
		return view;
	}
}
