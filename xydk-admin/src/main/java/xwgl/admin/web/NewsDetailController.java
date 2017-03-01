package xwgl.admin.web;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import xwgl.core.news.entity.News;
import xwgl.core.news.service.NewsService;
@Controller
public class NewsDetailController {
	
	@Autowired
	NewsService newsService;
	
	@RequestMapping(value = "/newsdetail/{id}", method = RequestMethod.GET)
	public String  news(HttpSession session,Model model,@PathVariable Long id) {
		model.addAttribute("news",newsService.find(id));
		List<News> news = newsService.findAll();
		Collections.shuffle(news);
		model.addAttribute("newss", news);
		return "newsdetail";
	}
}
