package xwgl.web.controller.front;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import xwgl.core.news.service.NewsService;
import xwgl.core.project.entity.FrontUser;
import xwgl.core.project.entity.Publish;
import xwgl.core.project.service.FrontUserService;
import xwgl.core.project.service.PublishService;
import xwgl.core.sys.entity.User;
import xwgl.core.sys.service.UserService;
/***
 * 前台，首页各种连接登陆等
 * @author qq:263608237
 *
 */
@Controller
@RequestMapping("/")
public class FrontController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FrontUserService frontUserService;
	
	@Autowired
	private NewsService newsService;
	
	
	@Autowired
	private PublishService publishService;
	@InitBinder  
	protected void initBinder(HttpServletRequest request,   ServletRequestDataBinder binder) throws Exception {   
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true)); 
	} 
	
	@RequestMapping("news")
	public String news(Model model) {
		model.addAttribute("news",newsService.findAll());
		return "news";
	}
	@RequestMapping(value="search",method=RequestMethod.GET)
	public String search(Model model) {
		model.addAttribute("publishs",this.publishService.findAll());
		return "search";
	}
	@RequestMapping(value="search",method=RequestMethod.POST)
	public String search(Model model,String title) {
		model.addAttribute("publishs",this.publishService.findAll(1, 20, title,"title").getContent());
		return "search";
	}
	
	@RequestMapping(value="publish",method=RequestMethod.GET)
	public String publish(Model model) {
		return "publish";
	}
	@RequestMapping(value="publish",method=RequestMethod.POST)
	public String publish(Model model,Publish publish,HttpSession httpSession) {
		FrontUser user=(FrontUser)httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登录!");
			return "login";
		}
		publish.setUser(user);
		model.addAttribute("tip","发布成功!");
		publishService.save(publish);
		return "publish";
	}
	
	@RequestMapping("viewnews")
	public String news(Model model,Long id) {
		model.addAttribute("bean",this.newsService.find(id));
		return "viewnews";
	}
	
	@RequestMapping("viewpublish")
	public String viewpublish(Model model,Long id) {
		model.addAttribute("bean",this.publishService.find(id));
		return "viewpublish";
	}
	
	/***
	 * 跳转到首页
	 * @param model
	 * @return
	 */
	@RequestMapping("index")
	public String index(Model model) {
		return "index";
	}
	/***
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("mypublish")
	public String order(Model model,HttpSession httpSession) {
		FrontUser user=(FrontUser)httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登录!");
			return "login";
		}
		model.addAttribute("publishs",publishService.findByUser(user));
		return "mypublish";
	}
	
	
	/***
	 * 关于我们
	 * @return
	 */
	@RequestMapping("about")
	public String about() {
		return "about";
	}
	/***
	 * 注册连接
	 * @return
	 */
	@RequestMapping("center")
	public String center() {
		return "center";
	}
	
	/***
	 * 注册连接
	 * @return
	 */
	@RequestMapping("register")
	public String register() {
		return "register";
	}
	/***
	 * 点击注册
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("doregister")
	public String register(FrontUser user,Model model) {
		user.setCreateDate(new Date());
		model.addAttribute("tip","注册成功请登录！");
		frontUserService.save(user);
		return "login";
	}
	/***
	 * 登陆连接
	 * @return
	 */
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	/***
	 * 退出操作清空缓存等操作
	 * @param httpSession
	 * @param model
	 * @return
	 */
	@RequestMapping("loginout")
	public String loginout(HttpSession httpSession,Model model) {
		httpSession.removeAttribute("user");
		return "index";
	}
	
	
	
	/***
	 * 执行登陆动作
	 * @param user
	 * @param httpSession
	 * @param model
	 * @return
	 */
	@RequestMapping("dologin")
	public String dologin(User user,HttpSession httpSession,Model model,String code) {
		String oldcode = (String)httpSession.getAttribute("code");
		if(!oldcode.equals(code.toUpperCase())){
			httpSession.removeAttribute("user");
    		model.addAttribute("tip","登陆失败 验证码不正确!");
    		return "login";
		}
		
		FrontUser loginuser=frontUserService.login(user.getUsername(), user.getPassword());
    	if(loginuser!=null){
    		httpSession.setAttribute("user", loginuser);
            return "index"; 
    	}
    	else{
    		httpSession.removeAttribute("user");
    		model.addAttribute("tip","登陆失败 不存在此用户名或密码!");
    		return "login";
    	}
	}
	
}

