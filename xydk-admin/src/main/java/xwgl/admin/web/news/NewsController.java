package xwgl.admin.web.news;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import xwgl.common.dto.json.ListResponse;
import xwgl.common.dto.json.Response;
import xwgl.common.dto.json.SuccessResponse;
import xwgl.common.web.AbstractBaseCURDController;
import xwgl.core.news.entity.Comment;
import xwgl.core.news.entity.News;
import xwgl.core.news.service.NewsService;

@Controller
@RequestMapping("news/news")
public class NewsController extends AbstractBaseCURDController<News,Long>  {

	@Override
	public NewsService getSimpleCurdService() {
		return (NewsService)super.getSimpleCurdService();
	}
	
	@Override
	public String getBasePath() {
		return "news/news";
	}
	
	@Override
	@RequestMapping("index")
	public String index(Model model) {
		return this.getBasePath()+"/index";
	}
	
	/***
	 * 显示所有评论
	 * @param model
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="comments/{id}",method=RequestMethod.GET)
	public Response comments(Model model,@PathVariable Long id) {
		return new ListResponse<Comment>(this.getSimpleCurdService().find(id).getComments());
	}
	
	/***
	 * 删除某条评论
	 * @param model
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="deleteComments/{id}",method=RequestMethod.GET)
	public Response deleteComments(Model model,@PathVariable Long id) {
		this.getSimpleCurdService().deleteComment(id);
		return new SuccessResponse("评论删除成功");
	}
	@RequestMapping("update/{id}")
	public String update(Model model,@PathVariable Long id) {
		model.addAttribute("news",getSimpleCurdService().find(id));
		model.addAttribute("categorys",getSimpleCurdService().findAllCategory());
		return "news/create/index";
	}
}
