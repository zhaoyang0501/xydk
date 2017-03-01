package xwgl.admin.web.views;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import xwgl.core.sys.entity.User;

public class UserExportXlsView extends AbstractXlsView {
	
	private String[] titles = { "用户名", "工号	", "真实姓名", "性别", "电话", "部门组织", "党员", "冻结" };
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Sheet sheet=workbook.createSheet("员工信息");
		createHead(sheet);
		createBody(sheet,(List<User>)model.get("users"));
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
	    response.setHeader("Content-disposition", "attachment;filename="+new String(((String)model.get("filename")).getBytes(),"iso-8859-1") +".xls" );  
	    OutputStream ouputStream = response.getOutputStream();   
        workbook.write(ouputStream);   
        ouputStream.flush();   
        ouputStream.close();   
	} 
	
	private void createBody(Sheet sheet, List<User> list) {
		int i=1;
		for(User user:list){
			Row row=sheet.createRow(i++);
			row.createCell(0).setCellValue(user.getUsername());
			row.createCell(1).setCellValue(user.getEmpid());
			row.createCell(2).setCellValue(user.getChinesename());
			row.createCell(3).setCellValue(user.getSex());
			row.createCell(4).setCellValue(user.getTel());
			row.createCell(5).setCellValue(user.getDeptment().getName());
			row.createCell(6).setCellValue(user.getParty()?"党员":"");
			row.createCell(7).setCellValue(user.getIsFreeze()?"冻结":"");
		}
	}

	private void createHead(Sheet sheet){
		Row headRow=sheet.createRow(0);
		for (int i = 0; i < titles.length; i++) {
			headRow.createCell(i).setCellValue(titles[i]);
		}
	}
}

