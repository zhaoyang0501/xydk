package xwgl.common.web;

import org.springframework.ui.Model;

import xwgl.common.dto.json.Response;
import xwgl.common.entity.BaseEntity;

public interface BaseCURDController<M extends BaseEntity<?>, ID>  {
	
	
	public String index(Model model) ;
	
	public Response save(M m);
	
	public Response update(M m);
	
	public Response delete(ID id);
	
	public Response get(ID id);
	
	public Response list(Integer start, Integer length, String value,String columnname);
}
