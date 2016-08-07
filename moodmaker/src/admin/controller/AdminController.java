package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.model.films.FilmsDAO;
import admin.model.films.FilmsDTO;
import admin.model.popup.PopupDAO;
import admin.model.popup.PopupDTO;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import util.MAVUtil;
import util.PageUtil;
import util.ParamUtils;
import util.SessionUtil;
/*
============================================================================
 -. 업  무  명 : 승희의 취업을 위한 프로젝트
 -. 프로그램명 : 무드메이커 - PC
 -. 기      능 : 무드메이커 관리자 페이지
============================================================================
    <프로그램 추가 및 변경사항>>
----------------------------------------------------------------------------
  성  명 : 일    자 :  내       용
----------------------------------------------------------------------------
  김승희 : 2016-07-13 : 신규
============================================================================
*/

@Controller
public class AdminController {
	
	@Autowired
	private PopupDAO adminDao;
	@Autowired
	private FilmsDAO filmsDao;
	
	
	private final static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//메인화면 이동
	@RequestMapping("admin.jk")
	public ModelAndView main(HttpServletResponse response, HttpServletRequest request, Model model){
		ModelAndView view = new ModelAndView();
		view.setViewName("views/admin/main");
		logger.info("##########관리자 메인 화면 이동##########");
		return view;
	}
	
	//로그인 화면이동
	@RequestMapping("login.jk")
	public ModelAndView loginform() {
		ModelAndView view = new ModelAndView();
		view.setViewName("views/admin/login");
		logger.info("##########관리자 로그인 화면 이동##########");
		return view;
	}
	
	//로그인 체크여부
	@RequestMapping("loginchk.jk")
	public String loginchk(HttpServletResponse response, HttpServletRequest request, Model model,
							  @RequestParam(value="userId")  String userId,
							  @RequestParam(value="userPwd") String userPwd) {
		
		ModelAndView view = new ModelAndView();
		if("".equals(userId) || "".equals(userPwd)){
			String temp = "temp";
			userId = temp;
			userPwd= temp;
		}
		userId=userId.toUpperCase();
		userPwd=userPwd.toUpperCase();
		logger.debug("userId ::::::: " + userId);
		logger.debug("userPwd ::::::: " + userPwd);
		//로그인 성공시 메인페이지로 이동
		if(userId.equals("ADMIN") && userPwd.equals("ADMIN1234")){
			SessionUtil.setProperty(request , "ID"	, "ADMIN");
			SessionUtil.setProperty(request , "NAME", "관리자");
			logger.info("##########로그인 성공##########");
		}else{
		//실패시 다시 로그인페이지로 이동
		logger.info("##########로그인 실패##########");
		return MAVUtil.goMsgBack("로그인정보가 일치 하지 않습니다..", model);
		}
		
		return "redirect:/admin.jk";
	}
	
	//로그아웃
	@RequestMapping("logout.jk")
	public ModelAndView logout(HttpServletResponse response, HttpServletRequest request){
		
		ModelAndView view = new ModelAndView();
		SessionUtil.removeProperty(request, "ID");
		SessionUtil.removeProperty(request, "NAME");
		view.setViewName("views/admin/login");
		logger.info("##########로그아웃##########");
		return view;
	}
	
	//팝업등록화면 이동
	@RequestMapping("insertPopupForm.jk")
	public String insertPopup(){
		logger.info("##########팝업등록 화면 이동##########");
		return "views/admin/popup/insertPopup";
	}
	
	//팝업등록
	@RequestMapping("insertPopup.jk")
	public String insertPopup(HttpServletRequest request, HttpServletResponse response,
							  @RequestParam Map paramMap) throws Exception{
		
		int seq = adminDao.selectPopupSeq();
		String strTime = String.valueOf(paramMap.get("strHh")) + String.valueOf(paramMap.get("strMm"));
		String endTime = String.valueOf(paramMap.get("endHh")) + String.valueOf(paramMap.get("endMm"));
		
		
		paramMap.put("seq", seq);
		paramMap.put("strTime", strTime);
		paramMap.put("endTime", endTime);
		paramMap.remove("strHh");
		paramMap.remove("strMm");
		paramMap.remove("endHh");
		paramMap.remove("endMm");
		
		adminDao.insertPopup(paramMap);
		
		logger.info("##########팝업등록 로직 처리 완료##########");
		return "redirect:/listPopup.jk";
	}
	
	//팝업리스트 화면
	@RequestMapping("listPopup.jk")
	public String listPopup(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		logger.info("##########팝업리스트 화면 이동##########");
		Map<String,Object> inputMap = new HashMap<String, Object>();
		List<Map<String,Object>> list = null;
		PageUtil pu = new PageUtil();
		
		
		String formName = ParamUtils.getParameter(request, "frm", "sForm");					//JSP 폼명
		String off 	= ParamUtils.getParameter(request,"offset",null);						//페이징 시작 인덱스
		String len	= ParamUtils.getParameter(request,"pageSize",null);						//페이지 데이터 갯수

		int offset = (off==null || "".equals(off))?0:Integer.parseInt(off);					//페이징 시작 인덱스
		int length = (len==null || "".equals(len))?15:Integer.parseInt(len);				//페이지 데이터 갯수
		
		
		int totalRecords = adminDao.selectPopupCount();
		
		if(totalRecords > 0){
			inputMap.put("offset", offset);
			inputMap.put("length", length);
			
			list = adminDao.selectPopupList(inputMap);
			
			pu.setOffset(offset);					//데이터의 인덱스
        	pu.setLength(length);					//페이지의 데이터 갯수
        	pu.setUrl("/listPopup.jk");	//URL
			pu.setSize(totalRecords);				//데이터 수
			pu.setFormName(formName);				//JSP 폼명
		}
		model.addAttribute("page", pu);
		model.addAttribute("result", list);

		return "/views/admin/popup/listPopup";
	}
	
	//팝업 수정화면
	@RequestMapping("updatePopupForm.jk")
	public ModelAndView modifyPopupForm(HttpServletRequest request, HttpServletResponse response, Model model,
			 				  @RequestParam(value="seq")  int seq)throws Exception{
		
		ModelAndView view = new ModelAndView();
		PopupDTO popDto = new PopupDTO();
		popDto = adminDao.updatePopupForm(seq);
		
		String sTime="";
		String strHh="";
		String strMm="";
		String eTime="";
		String endHh="";
		String endMm="";
		
		if(popDto.getStrTime() != null)
		{
		sTime = popDto.getStrTime();
		strHh = sTime.substring(0, 2);
		strMm = sTime.substring(2, 4);
		}
		if(popDto.getEndTime() != null)
		{
		eTime = popDto.getEndTime();
		endHh = eTime.substring(0, 2);
		endMm = eTime.substring(2, 4);	
		}
		
		model.addAttribute("strHh", strHh);
		model.addAttribute("strMm", strMm);
		model.addAttribute("endHh", endHh);
		model.addAttribute("endMm", endMm);
		model.addAttribute("list", popDto);
		view.setViewName("/views/admin/popup/updatePopupForm");
	
		return view;
	}
	
	//팝업 수정
	@RequestMapping("updatepopup.jk")
	public String modiftPopup(HttpServletRequest request, HttpServletResponse response,
			 				  @RequestParam Map paramMap)throws Exception{
		
		logger.info("##########팝업 수정##########");
		String strTime = String.valueOf(paramMap.get("strHh")) + String.valueOf(paramMap.get("strMm"));
		String endTime = String.valueOf(paramMap.get("endHh")) + String.valueOf(paramMap.get("endMm"));
		paramMap.put("strTime", strTime);
		paramMap.put("endTime", endTime);
		paramMap.remove("strHh");
		paramMap.remove("strMm");
		paramMap.remove("endHh");
		paramMap.remove("endMm");
		adminDao.updatePopupForm(paramMap);
		
		return "redirect:/listPopup.jk";
	}
	
	//팝업 삭제
	@RequestMapping("deletepopup.jk")
	public String deletePopup(HttpServletRequest reqeust, HttpServletResponse response,
							  @RequestParam(value="seq") int seq)throws Exception{
		
		adminDao.deletePopup(seq);
		logger.info("########## "+seq+"번 팝업 삭제 ##########");
		return "redirect:/listPopup.jk";
	}
	
	//영화 리스트 화면
	@RequestMapping("listFilms.jk")
	public ModelAndView listfilms(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		logger.info("##########영화 리스트 화면##########");
		Map<String,Object> inputMap = new HashMap<String, Object>();
		ModelAndView view = new ModelAndView();
		ArrayList<FilmsDTO> FilmsList = new ArrayList<FilmsDTO>();
		PageUtil pu = new PageUtil();
		
		String formName = ParamUtils.getParameter(request, "frm", "sForm");					//JSP 폼명
		String off 	= ParamUtils.getParameter(request,"offset",null);						//페이징 시작 인덱스
		String len	= ParamUtils.getParameter(request,"pageSize",null);						//페이지 데이터 갯수
		int offset = (off==null || "".equals(off))?0:Integer.parseInt(off);					//페이징 시작 인덱스
		int length = (len==null || "".equals(len))?15:Integer.parseInt(len);				//페이지 데이터 갯수
		
		int totalRecords = filmsDao.filmslist_total();
		
		if(totalRecords > 0){
			inputMap.put("offset", offset);
			inputMap.put("length", length);
			
			FilmsList = (ArrayList<FilmsDTO>)filmsDao.filmslist(inputMap);
			
			pu.setOffset(offset);					//데이터의 인덱스
        	pu.setLength(length);					//페이지의 데이터 갯수
        	pu.setUrl("/listFilms.jk");				//
			pu.setSize(totalRecords);				//데이터 수
			pu.setFormName(formName);				//JSP 폼명
		}
		
		String endDate ="";
		String state ="";
		String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		for (FilmsDTO filmsDTO : FilmsList) {
			endDate=filmsDTO.getFilm_close_date();
			if(endDate.compareTo(currentDate)<0){
				state="상영종료";
			}else{
			state="상영중";
			}
			filmsDTO.setStatus(state);
		}
		
		model.addAttribute("page", pu);
		model.addAttribute("list", FilmsList);
		view.setViewName("views/admin/films/listFilms");
		return view;
	}
	
	//영화 등록 화면
	@RequestMapping("insertFilmsForm.jk")
	public ModelAndView insertfilmsform(HttpServletRequest request, HttpServletResponse response,
										Model model)throws Exception{
		ModelAndView view = new ModelAndView();
		List<Map<String, Object>> genre_list = 	filmsDao.genre_List();	
		
		model.addAttribute("genre", genre_list);
		view.setViewName("views/admin/films/insertFilms");
		return view;
	}
	
	//영화 등록
	@RequestMapping("insertFilm.jk")
	public String inserfilm(HttpServletRequest request, HttpServletResponse response,
						    @RequestParam Map param)throws Exception{
		logger.info("##########영화 등록##########");
		MultipartRequest multi = null;
		int fileMaxSize = 10*1024*1024; //파일최대사이즈 10MB로 설정
		String savePath = request.getRealPath("/upload").replaceAll("\\\\", "/");
		
		String film_poster="";
		try{
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
			logger.debug("############파일정상 업로드#############");
			String genre_code 		 = multi.getParameter("genre_code");
			String film_name  		 = multi.getParameter("film_name");
			String film_release_date = multi.getParameter("film_release_date");
			String film_close_date	 = multi.getParameter("film_close_date");
			String film_director	 = multi.getParameter("film_director");
			String film_cast		 = multi.getParameter("film_cast");
			String films_class		 = multi.getParameter("films_class");
			String film_synopsys	 = multi.getParameter("film_synopsys");
			param.put("genre_code", genre_code);
			param.put("film_name", film_name);
			param.put("film_release_date",film_release_date);
			param.put("film_close_date",film_close_date);
			param.put("film_director", film_director);
			param.put("film_cast",film_cast);
			param.put("films_class",films_class);
			param.put("film_synopsys",film_synopsys);
			
			//request : request객체
			//savePath : 저장될 서버 경로
			//fileMaxSize : 파일최대크기
			//"UTF-8" : 파일인코딩 방식
			//new DefaultFileRenameAPolicy() : 같은 이름 파일명 방지
		}catch(Exception e){
			if(e.getMessage().indexOf("exceeds limit") > -1){
				//파일사이즈 초과되었을 경우
			}
			logger.error("##########파일 사이즈 초과########");
		}
		
		File file =multi.getFile("film_poster");
		if(file == null)
		{
			param.put("film_poster", "");
		}else{
			film_poster = "/upload/"+file.getName();
			logger.debug("파일명::::::::::" + film_poster);
			param.put("film_poster", film_poster);
		}

		//film_idx 구해오기
		int film_idx = filmsDao.select_filmidx();
		param.put("film_idx", film_idx);
	
		filmsDao.insertfilms(param);
		return "redirect:/listFilms.jk";
	}
	
	//영화수정화면 이동
	@RequestMapping("updateFilmsForm.jk")
	public ModelAndView updatefilmsform(HttpServletRequest request, HttpServletResponse response,
										@RequestParam(value="seq") int film_idx, Model model  )throws Exception{
		ModelAndView view = new ModelAndView();
		FilmsDTO filmsdto = filmsDao.updatefilmsform(film_idx);
		List<Map<String, Object>> genre_list = 	filmsDao.genre_List();	
		String filename = "";
		if(filmsdto.getFilm_poster() != null || filmsdto.getFilm_poster() != ""){
			filename = filmsdto.getFilm_poster();
			filename = filename.substring(filename.lastIndexOf("/")+1, filename.length());
		}
		logger.debug("filename ::::: " + filename);
		model.addAttribute("filename", filename);
		model.addAttribute("genre", genre_list);
		model.addAttribute("filmlist", filmsdto);
		view.setViewName("views/admin/films/updateFilmsForm");
		return view;
	}
	
	//영화수정
	@RequestMapping("updateFilms.jk")
	public String updatefilms(HttpServletRequest request, HttpServletResponse response,
							  @RequestParam Map param)throws Exception{
		logger.info("##########영화 수정##########");
		MultipartRequest multi = null;
		int fileMaxSize = 10*1024*1024; //파일최대사이즈 10MB로 설정
		String savePath = request.getRealPath("/upload").replaceAll("\\\\", "/");
		logger.debug("파일저장경로 ::::::::::: " + savePath);
		String org_full_filename = "";
		String org_filename = "";
		try{
			
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
			org_full_filename = multi.getParameter("film_org_poster");
			int startidx = org_full_filename.lastIndexOf("/");
			org_filename=org_full_filename.substring(startidx+1, org_filename.length());
			
		}catch(Exception e){
			if(e.getMessage().indexOf("exceeds limit") > -1){
				//파일사이즈 초과되었을 경우
			}
			logger.error("##########파일 사이즈 초과########");
		}
		File file =multi.getFile("film_poster");
		if(file == null){
			param.put("film_poster", org_full_filename);
		}else{
			param.put("film_poster", file.getName());
			File file2 = new File( savePath + org_filename );
			file2.delete();
		}
		return "redirect:listFilms.jk";
	}
	

}
