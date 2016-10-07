package sumslack.app.other.controller;

import com.sumscope.tag.rest.annotation.URIAlias;
import com.sumscope.tag.rest.servlet.BaseController;

@URIAlias(value="other")
public class TestOtherController extends BaseController{
	@URIAlias(value="d")
	public String restd() throws Exception
	{
		
		request.setAttribute("test", "actionKey :d的"+TestOtherController.class.getName());
		return "/test.jsp";
	}
}
