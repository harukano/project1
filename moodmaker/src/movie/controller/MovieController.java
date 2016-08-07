package movie.controller;

import movie.model.MovieDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MovieController {
	@Autowired
	private MovieDAO moviedao;

	public void setMoviedao(MovieDAO moviedao) {
		this.moviedao = moviedao;
	}
}
