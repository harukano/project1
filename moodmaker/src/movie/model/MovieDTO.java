package movie.model;

public class MovieDTO {
	private int film_idx;
	private String genre_code;
	private String film_poster;
	private String film_name;
	private String film_release_date;
	private String film_close_date;
	private String film_director;
	private String film_cast;
	private String film_class;
	private String film_synopsys;

	private String remark;

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

	public String getFilm_class() {
		return film_class;
	}

	public void setFilm_class(String film_class) {
		this.film_class = film_class;
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
