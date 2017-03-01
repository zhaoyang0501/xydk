package xwgl.admin.web.publish;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import xwgl.common.web.AbstractBaseCURDController;
import xwgl.core.project.entity.Publish;
import xwgl.core.project.service.PublishService;

@Controller
@RequestMapping("project/publish")
public class PublishController extends AbstractBaseCURDController< Publish,Long>  {

	@Override
	public  PublishService getSimpleCurdService() {
		return ( PublishService)super.getSimpleCurdService();
	}
	
	@Override
	public String getBasePath() {
		return "project/publish";
	}
	
	@Override
	@RequestMapping("index")
	public String index(Model model) {
		return this.getBasePath()+"/index";
	}
	
}
