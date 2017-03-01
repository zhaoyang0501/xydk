package xwgl.core.news.entity;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import xwgl.common.entity.BaseEntity;
import xwgl.core.sys.entity.User;
@Entity
@Table(name = "t_news_follower")
public class Follower extends BaseEntity<Long>{
	
	@ManyToOne
	private User user;
	
	@ManyToOne
	private User follower;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getFollower() {
		return follower;
	}

	public void setFollower(User follower) {
		this.follower = follower;
	}
	
	
}
