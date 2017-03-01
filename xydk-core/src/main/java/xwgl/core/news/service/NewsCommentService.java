package xwgl.core.news.service;

import java.util.Date;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import xwgl.common.service.SimpleCurdService;
import xwgl.core.news.entity.Comment;
@Service
public class NewsCommentService extends SimpleCurdService<Comment, Long> {
	public Page<Comment> findAll(final int pageNumber, final int pageSize,final Date start,final Date end){
        PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "createDate"));
        Specification<Comment> spec = new Specification<Comment>() {
             public Predicate toPredicate(Root<Comment> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (start!=null) {
                  predicate.getExpressions().add(cb.greaterThanOrEqualTo(root.get("createDate").as(Date.class), start));
             }
             
             if (end!=null) {
            	 predicate.getExpressions().add(cb.lessThanOrEqualTo(root.get("createDate").as(Date.class), start));
             }
             
             return predicate;
             }
        };
        Page<Comment> result = (Page<Comment>) simpleCurdRepository.findAll(spec, pageRequest);
        return result;
  } 
}
