package sumslack.app.controller;

import com.sumscope.tag.rest.annotation.URIAlias;
import com.sumscope.tag.rest.servlet.BaseController;

@URIAlias(value="a")
public class TestAnnoController extends BaseController{
	public String rest1() throws Exception
	{
		request.setAttribute("test", "test试的");
		return "/test.jsp";
	}
	@URIAlias(value="b")
	public String rest2()
	{
		request.setAttribute("test", "rest2rest2的");
		return "/test.jsp";
	}
}
