package xwgl.core.news.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import xwgl.common.repository.SimpleCurdRepository;
import xwgl.core.news.entity.Follower;
import xwgl.core.sys.entity.User;

public interface FollowerRespository  extends SimpleCurdRepository<Follower ,Long>{
	
	public List<Follower>  findByUser(User user);
	
	
	@Transactional @Modifying @Query("delete from  Follower u where u.follower=?1  and u.user=?2")
    public void deleteByFollower(User f,User u);
	
}
