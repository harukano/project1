package util;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Description:
 * Copyright: Copyright (c) 2005
 * Company: BCS
 * @author Alex
 * @version 1.0
 */
public class PageUtil {
	
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	private int bottomIndex = 5;

	private int offset; // start records

	private int size; // totalRecordsCount

	private int length; // pagesize

	private String url;// mapping url
	
	private String pageHeader = ""; //

	private List list;
	
	private String formName;
	

	public PageUtil() {

	}
	
	public PageUtil(int offset, int size, int length, String url,
			String pageHeader, String formName) {
		this.offset = offset;
		this.size = size;
		this.length = length;
		this.url = url;
		this.pageHeader = pageHeader;
		this.formName = formName;
	}
	/**
	 * get Page Navigation with image 
	 * @return
	 */
	public String getPageImageNavi() {
		String pageNavigation = "";
		if (size > length && length > 0) {		//size 총글수, length = 10;				
			
			if (pageHeader != null && pageHeader.length() > 0) {
				pageNavigation = pageHeader + " : ";
			}
			// not first page "<<" and "<" display
			if (offset > 0) {
				pageNavigation += 
						"<span class='prev'>"
						+ "<img src='/views/admin/img/paging/paging_first.gif' title='처음으로' style='cursor:hand;width:13; height:13; border:0;cursor:pointer;' align='absmiddle' onclick='javascript:pageSubmit(\"" + url + "\", " + formName +",0, " + length + ");'/>&nbsp;"	
						+ "<img src='/views/admin/img/paging/paging_prev.gif' title='이전으로' style='cursor:hand;width:13; height:13; border:0;cursor:pointer;' "
						+ " align='absmiddle' onclick='javascript:pageSubmit(\"" + url + "\", " + formName + ", " +  (offset - length) + ", " + length + ");' />"
						+ "</span>";
			}
			int startOffset;
			int radius = (bottomIndex / 2) * length;  //ex) bottomIndex = 5, length = 10 이라면 계산은 20이 나온다. int계산이어서 나머지는 버려버린다.
		
			if (offset < radius || this.pageCount() <= bottomIndex) {
				startOffset = 0;
			} else if (offset < size - radius) {
				startOffset = offset - radius;
			} else {
				startOffset = (size / length - bottomIndex) * length;
			}
			for (int i = startOffset; i < size
					&& i < startOffset + bottomIndex * length; i += length) {				
				if (i == offset) {
					pageNavigation += "<em class='on' title='현재 선택된 목록'>" + (i / length + 1) + "</em>\n";
				} else {
					pageNavigation +=
						"<a onclick='javascript:pageSubmit(\"" + url + "\", " + formName + ", " + i + "," + length + ");' style='cursor:pointer;'>"
						+ (i / length + 1) + "</a>\n";					
				}
			}			
			
			if (offset < size - length) {
				pageNavigation +=
						"<span class='next'>"
						+ "<img src='/views/admin/img/paging/paging_next.gif' title='다음으로' style='cursor:pointer;width:13; height:13; border:0;' align='absmiddle' onclick='javascript:pageSubmit(\"" + url + "\", " + formName + ", " + (offset + length) +", " + length + ");' />&nbsp;"	
						+ "<img src='/views/admin/img/paging/paging_last.gif' title='마지막으로' style='cursor:pointer;width:13; height:13; border:0;' "
						+ " align='absmiddle' onclick='javascript:pageSubmit(\"" + url + "\", " + formName + ", " + lastPageOffset() + ", " + length + ");' />"
						+ "</span>";
			}
		} 
		 
		return pageNavigation;

	}
	
	/**
	 * 
	 * @param offset
	 * @param size
	 * @param length
	 * @param url
	 * @param pageHeader
	 * @return String
	 */
	public String getPageNavigation() {
		// return navigation
		String pageNavigation = "";
		if (size > length) {
			String pref;
			if (url.indexOf("?") > -1) {
				pref = "&";
			} else {
				pref = "?";
			}
			if (pageHeader != null && pageHeader.length() > 0) {
				pageNavigation = pageHeader + " : ";
			}
			// not first page "<<" and "<" display
			if (offset > 0) {
				pageNavigation += "<a href='" + url + pref
						+ "offset=0'>[<<]</a>\n" + "<a href='" + url + pref
						+ "offset=" + (offset - length) + "'>[<]</a>\n";
			}
			int startOffset;
			int radius = bottomIndex / 2 * length;
			if (offset < radius || this.pageCount() <= bottomIndex) {
				startOffset = 0;
			} else if (offset < size - radius) {
				startOffset = offset - radius;
			} else {
				startOffset = (size / length - bottomIndex) * length;
			}
			for (int i = startOffset; i < size
					&& i < startOffset + bottomIndex * length; i += length) {
				if (i == offset) {
					pageNavigation += "<b>" + (i / length + 1) + "</b>\n";
				} else {
					pageNavigation += "<a href='" + url + pref + "offset=" + i
							+ "'>" + (i / length + 1) + "</a>\n";
				}
			}
			if (offset < size - length) {
				pageNavigation += "<a href='" + url + pref + "offset="
						+ (offset + length) + "'>[>]</a>\n" + "<a href='" + url
						+ pref + "offset=" + lastPageOffset() + "'>[>>]</a>\n";
			}
			
			return pageNavigation;
		} else {
			return "";
		}
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	/**
	 * 
	 * @param size
	 * @param length
	 * @return int
	 */
	public int pageCount() {
		int pagecount = 0;
		if (size % length == 0) {
			pagecount = size / length;
		} else {
			pagecount = size / length + 1;
		}
		return pagecount;
	}

	/**
	 * 
	 * @param size
	 * @param length
	 * @return int
	 */
	public int lastPageSize() {
		int lastpagesize = 0;
		if (size % length == 0) {
			lastpagesize = length;
		} else {
			lastpagesize = size % length;
		}
		return lastpagesize;
	}

	/**
	 * 
	 * @param size
	 * @param length
	 * @return int
	 */
	public int lastPageOffset() {
		return size - lastPageSize();
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPageHeader() {
		return pageHeader;
	}

	public void setPageHeader(String pageHeader) {
		this.pageHeader = pageHeader;
	}

	public int getBottomIndex() {
		return bottomIndex;
	}

	public void setBottomIndex(int bottomIndex) {
		this.bottomIndex = bottomIndex;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

}// class end;
