package xwgl.admin.web.news;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import xwgl.common.dto.json.FailedResponse;
import xwgl.common.dto.json.Response;
import xwgl.common.dto.json.SuccessResponse;
import xwgl.core.news.entity.Comment;
import xwgl.core.news.entity.Follower;
import xwgl.core.news.entity.News;
import xwgl.core.news.entity.NewsCategory;
import xwgl.core.news.service.FollowerService;
import xwgl.core.news.service.NewsService;
import xwgl.core.sys.entity.User;
import xwgl.core.sys.service.UserService;

@Controller
@RequestMapping("web")
public class FrontController {
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FollowerService followerService;
	
	@RequestMapping("index")
	public String index(Model model){
		List<NewsCategory> categorys = newsService.findAllCategory();
		
		Map<Long,List<News>> map = new HashMap<Long,List<News>>();
		for(NewsCategory category:categorys){
			map.put(category.getId(), newsService.findByCategory(category));
		}
		
		model.addAttribute("map",map);
		model.addAttribute("categorys",categorys);
		model.addAttribute("news",newsService.findAll());
		return "web/news";
	}
	
	@RequestMapping("replay")
	public String replay(Model model){
		return "web/replay";
	}
	
	
	@RequestMapping("login")
	public String login(Model model){
		return "web/login";
	}
	@RequestMapping("loginout")
	public String loginout(HttpSession httpSession,Model model) {
		httpSession.setAttribute("user", null);
		model.addAttribute("tip","注销成功，请重新登录！");
		return "web/login";
	}
	@RequestMapping("userprofile/{id}")
	public String login(Model model,@PathVariable Long id){
		User user = userService.find(id);
		model.addAttribute("user",user);
		model.addAttribute("comments",newsService.findCommentByUser(user));
		return "web/userprofile";
	}
	
	
	@RequestMapping("myfollower")
	public String myfollower(Model model,HttpSession httpSession){
		User user=(User) httpSession.getAttribute("user");
		
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "web/login";
		}
		
		model.addAttribute("followers",followerService.findByUser(user.getId()));
		return "web/myfollower";
	}
	
	@RequestMapping("password")
	public String password(Model model,HttpSession httpSession){
		User user=(User) httpSession.getAttribute("user");
		
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "web/login";
		}
		
		model.addAttribute("followers",followerService.findByUser(user.getId()));
		return "web/password";
	}
	
	
	@RequestMapping("updateuser")
	public String updateuser(Model model,HttpSession httpSession){
		User user=(User) httpSession.getAttribute("user");
		
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "web/login";
		}
		
		model.addAttribute("user",user);
		return "web/updateuser";
	}
	
	
	
	@RequestMapping("doupdateuser")
	public String doupdateuser(Model model,HttpSession httpSession,User user){
		User newuser=(User) httpSession.getAttribute("user");
		
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "web/login";
		}
		
		newuser.setTel(user.getTel());
		newuser.setEmail(user.getEmail());
		newuser.setRemark(user.getRemark());
		userService.save(newuser);
		model.addAttribute("tip","个人资料修改成功！");
		model.addAttribute("user",user);
		return "web/updateuser";
	}
	
	
	
	@RequestMapping("dopassword")
	public String dopassword(Model model,HttpSession httpSession,String password1,String password2){
		User user=(User) httpSession.getAttribute("user");
		
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "web/login";
		}
		
		if(StringUtils.isBlank(password1)||StringUtils.isBlank(password2)){
			model.addAttribute("tip","密码不能为空！");
			return "web/password";
		}
		
		if(!password1.equals(password2)){
			model.addAttribute("tip","两次密码不一致！");
			return "web/password";
		}
		
		user.setPassword(DigestUtils.md5Hex(password1));
		userService.save(user);
		model.addAttribute("tip","密码修改成功，请重新登录！");
		return "web/login";
	}
	
	
	@RequestMapping("profile")
	public String profile(Model model,HttpSession httpSession){
		User user=(User) httpSession.getAttribute("user");
		
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "web/login";
		}
		
		model.addAttribute("followers",followerService.findByUser(user.getId()));
		return "web/profile";
	}
	
	
	@RequestMapping("addfollower")
	@ResponseBody
	public Response addfollower(Long id,Model model,HttpSession httpSession){
		User user=(User) httpSession.getAttribute("user");
		
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return new FailedResponse("关注失败,请登录!");
		}
		
		User f = userService.find(id);
		Follower follower = new Follower();
		follower.setUser(user);
		follower.setFollower(f);
		follower.setCreateDate(new Date());
		
		followerService.deleteFollower(f, user);
		followerService.save(follower);
		return new SuccessResponse();
	}
	
	
	@RequestMapping("unfollower")
	@ResponseBody
	public Response unfollower(Long id,Model model,HttpSession httpSession){
		User user=(User) httpSession.getAttribute("user");
		
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return new FailedResponse("关注失败,请登录!");
		}
		
		User f = userService.find(id);
		Follower follower = new Follower();
		follower.setUser(user);
		follower.setFollower(f);
		follower.setCreateDate(new Date());
		
		followerService.deleteFollower(f, user);
		return new SuccessResponse("取消关注成功！");
	}
	
	@RequestMapping("dologin")
	public String dologin(User user,HttpSession httpSession,Model model) {
		User loginuser=userService.login(user.getUsername(), user.getPassword());
    	if(loginuser!=null){
    		httpSession.setAttribute("user", loginuser);
    		model.addAttribute("user",loginuser);
            return "web/center"; 
    	}
    	else{
    		httpSession.removeAttribute("user");
    		model.addAttribute("tip","登陆失败 不存在此用户名或密码!");
    		return "web/login";
    	}
	}
	
	
	
	@RequestMapping("register")
	public String register(Model model) {
		return "web/register";
	}
	
	@RequestMapping("comment")
	public String register(Long aid,String body,HttpSession httpSession,Model model,final RedirectAttributes redirectAttributes) {
		User user=(User) httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "web/login";
		}
		Comment comment = new Comment();
		comment.setBody(body);
		comment.setNews(newsService.find(aid));
		comment.setUser(user);
		comment.setCreateDate(new Date());
		newsService.saveComment(comment);
		redirectAttributes.addFlashAttribute("tip", "评论发布成功！");
		return "redirect:/newsdetail/"+aid;
	}
	
	
	@RequestMapping("doregister")
	public String register(User user,Model model) {
		user.setCreateDate(new Date());
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		model.addAttribute("tip","注册成功请登录！");
		userService.save(user);
		return "web/login";
	}
	
	@RequestMapping("center")
	public String center(Model model,HttpSession httpSession) {
		User user=(User) httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "web/login";
		}
		model.addAttribute("user",user);
		return "web/center";
	}
	
}
