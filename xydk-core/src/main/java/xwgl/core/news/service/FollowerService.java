package xwgl.core.news.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xwgl.common.service.SimpleCurdService;
import xwgl.core.news.entity.Follower;
import xwgl.core.news.repository.FollowerRespository;
import xwgl.core.sys.entity.User;
@Service
public class FollowerService extends SimpleCurdService<Follower, Long> {
	
	public static final int PAGE_SIZE=10;
	
	@Autowired
	private FollowerRespository followerRespository;
	
	public void  deleteFollower(User f,User u){
		followerRespository.deleteByFollower(f, u);
	}
	
	public List<Follower> findByUser(Long userid){
		User user = new User(userid);
		return followerRespository.findByUser(user);
	}
}
