package admin.model.films;

public class FilmsDTO {

	private int film_idx;				//영화 인덱스
	private String genre_code;			//영화 장르 코드
	private String film_poster;			//포스터 이미지
	private String film_name;			//영화제목
	private String film_release_date;	//상영시작일
	private String film_close_date;		//상영종료일
	private String film_director;		//영화감독
	private String film_cast;			//배우
	private String films_class;			//상연관 갯수인가.
	private String film_synopsys;		//영화줄거리
	private String remark;				//요건 모르겠다.
	private String status;				//이건 영화 상태값.
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getFilm_idx() {
		return film_idx;
	}
	public void setFilm_idx(int film_idx) {
		this.film_idx = film_idx;
	}
	public String getGenre_code() {
		return genre_code;
	}
	public void setGenre_code(String genre_code) {
		this.genre_code = genre_code;
	}
	public String getFilm_poster() {
		return film_poster;
	}
	public void setFilm_poster(String film_poster) {
		this.film_poster = film_poster;
	}
	public String getFilm_name() {
		return film_name;
	}
	public void setFilm_name(String film_name) {
		this.film_name = film_name;
	}
	public String getFilm_release_date() {
		return film_release_date;
	}
	public void setFilm_release_date(String film_release_date) {
		this.film_release_date = film_release_date;
	}
	public String getFilm_close_date() {
		return film_close_date;
	}
	public void setFilm_close_date(String film_close_date) {
		this.film_close_date = film_close_date;
	}
	public String getFilm_director() {
		return film_director;
	}
	public void setFilm_director(String film_director) {
		this.film_director = film_director;
	}
	public String getFilm_cast() {
		return film_cast;
	}
	public void setFilm_cast(String film_cast) {
		this.film_cast = film_cast;
	}
	public String getFilms_class() {
		return films_class;
	}
	public void setFilms_class(String films_class) {
		this.films_class = films_class;
	}
	public String getFilm_synopsys() {
		return film_synopsys;
	}
	public void setFilm_synopsys(String film_synopsys) {
		this.film_synopsys = film_synopsys;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
