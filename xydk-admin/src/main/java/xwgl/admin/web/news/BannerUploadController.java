package xwgl.admin.web.news;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import xwgl.common.web.AbstractFileUploadController;
@Controller
@RequestMapping("news/bannerupload")
public class BannerUploadController extends AbstractFileUploadController{
	
	@Value("${cmcc.path.uploadpath}")
	private String uploadpath;
	
	private final List<String>  allowTypes = new ArrayList<String>(){
			private static final long serialVersionUID = -7478928976664848255L;
			{
				 add("png");
				 add("jpg");
				 add("jpeg");
				 add("gif");
				 add("bmp");
			 }
		 };
		 
	@Override
	public List<String> getAllowTypes() {
		return allowTypes;
	}

	@Override
	public String getFileUploadPath() {
		return uploadpath+File.separator+"news/banner";
	}

	@Override
	public String getFileRelativePath() {
		return "upload"+File.separator+"news/banner";
	}

}
