package xwgl.core.news.repository;

import java.util.List;

import xwgl.common.repository.SimpleCurdRepository;
import xwgl.core.news.entity.Comment;
import xwgl.core.sys.entity.User;
public interface NewsCommentRespository  extends SimpleCurdRepository<Comment ,Long>{
	
	public List<Comment> findByUser(User user);
}
