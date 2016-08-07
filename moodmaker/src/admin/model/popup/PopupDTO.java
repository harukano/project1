package admin.model.popup;
/*
============================================================================
 -. 업  무  명 : 승희의 취업을 위한 프로젝트
 -. 프로그램명 : 무드메이커 Popup DTO - PC
 -. 기      능 : 무드메이커 관리자 페이지
============================================================================
    <프로그램 추가 및 변경사항>>
----------------------------------------------------------------------------
  성  명 : 일    자 :  내       용
----------------------------------------------------------------------------
  김승희 : 2016-07-13 : 신규
============================================================================
*/
public class PopupDTO {

	private int seq;		// 팝업 고유번호
	private String title;	// 팝업 제목
	private String context;
	private String strDate;	// 시작 날짜
	private String strTime;	// 시작 시간
	private String endDate;	// 종료 날짜
	private String endTime;	// 종료 시간
	private String useYn;	// 사용 여부
	private String widSize;	// 넓이
	private String heiSize;	// 높이
	private String widLoc;
	private String heiLoc;
	private String shortCutYn;
	private String shortCutLink;
	private String locType;
	private String popGrpYn;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	public String getStrTime() {
		return strTime;
	}
	public void setStrTime(String strTime) {
		this.strTime = strTime;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getWidSize() {
		return widSize;
	}
	public void setWidSize(String widSize) {
		this.widSize = widSize;
	}
	public String getHeiSize() {
		return heiSize;
	}
	public void setHeiSize(String heiSize) {
		this.heiSize = heiSize;
	}
	public String getWidLoc() {
		return widLoc;
	}
	public void setWidLoc(String widLoc) {
		this.widLoc = widLoc;
	}
	public String getHeiLoc() {
		return heiLoc;
	}
	public void setHeiLoc(String heiLoc) {
		this.heiLoc = heiLoc;
	}
	public String getShortCutYn() {
		return shortCutYn;
	}
	public void setShortCutYn(String shortCutYn) {
		this.shortCutYn = shortCutYn;
	}
	public String getShortCutLink() {
		return shortCutLink;
	}
	public void setShortCutLink(String shortCutLink) {
		this.shortCutLink = shortCutLink;
	}
	public String getLocType() {
		return locType;
	}
	public void setLocType(String locType) {
		this.locType = locType;
	}
	public String getPopGrpYn() {
		return popGrpYn;
	}
	public void setPopGrpYn(String popGrpYn) {
		this.popGrpYn = popGrpYn;
	}
	
	
}
