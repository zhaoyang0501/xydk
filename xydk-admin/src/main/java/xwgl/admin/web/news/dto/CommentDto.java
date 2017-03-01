package xwgl.admin.web.news.dto;

import java.util.Date;

import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonFormat;

import xwgl.core.news.entity.Comment;
import xwgl.core.news.entity.News;
import xwgl.core.sys.entity.User;

public class CommentDto {
	
	private Long id;
	
	private String body;
	
	private User user;
	
	private News news;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8") 
	private Date createDate;

	

	public CommentDto() {
		super();
	}
	public CommentDto(Comment comment) {
		this.id=comment.getId();
		this.createDate=comment.getCreateDate();
		this.body=comment.getBody();
		this.news=comment.getNews();
		this.user=comment.getUser();
	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8") 
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}
