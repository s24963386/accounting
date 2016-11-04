package sumslack.app.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sumscope.tag.rest.TagRest;
import com.sumscope.tag.rest.servlet.AjaxServlet;

@TagRest(value="teams/**")
public class Home extends AjaxServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8814286860867527336L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		redirect(request,response,"/spa/home.jsp");
	}
	
	
}
