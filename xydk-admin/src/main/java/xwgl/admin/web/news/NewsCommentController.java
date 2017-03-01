package xwgl.admin.web.news;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import xwgl.admin.web.news.dto.CommentDto;
import xwgl.common.dto.json.DataTableResponse;
import xwgl.common.dto.json.Response;
import xwgl.common.web.AbstractBaseCURDController;
import xwgl.core.news.entity.Comment;
import xwgl.core.news.service.NewsCommentService;

@Controller
@RequestMapping("news/comment")
public class NewsCommentController extends AbstractBaseCURDController<Comment,Long>  {

	@Override
	public NewsCommentService getSimpleCurdService() {
		return (NewsCommentService)super.getSimpleCurdService();
	}
	
	@Override
	public String getBasePath() {
		return "news/comment";
	}
	
	@RequestMapping("listall")
	@ResponseBody
	public Response listall(Integer start, Integer length, String startDate,String endDate) throws ParseException {
		int pageNumber = (int) (start / length) + 1;
		int pageSize = length;
		
		Date start_= StringUtils.isEmpty(startDate)?null:DateUtils.parseDate(startDate, "yyyy-MM-dd");
		Date end_= StringUtils.isEmpty(endDate)?null:DateUtils.parseDate(endDate, "yyyy-MM-dd");
		
		Page<Comment> m = getSimpleCurdService().findAll(pageNumber, pageSize, start_,end_);
		return new DataTableResponse<CommentDto>( converCommentDto(m.getContent()),(int) m.getTotalElements() );
	}
	
	private List<CommentDto> converCommentDto(List<Comment> list){
		List<CommentDto> dtos = new ArrayList<CommentDto>();
		for(Comment bean:list){
			dtos.add(new CommentDto(bean));
		}
		return dtos;
	}
	
	@Override
	@RequestMapping("index")
	public String index(Model model) {
		return this.getBasePath()+"/index";
	}
	
	
}
