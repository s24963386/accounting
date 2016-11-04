package sumslack.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sumscope.tag.rest.annotation.Get;
import com.sumscope.tag.rest.annotation.Post;
import com.sumscope.tag.rest.annotation.URIAlias;
import com.sumscope.tag.rest.servlet.BaseController;
import com.sumscope.tag.sql.TagJDBCInstance;

public class TestController extends BaseController{
	public String gotoJSP() throws Exception
	{
		Map map = TagJDBCInstance.getInstance().queryOne("select 1", null);
		request.setAttribute("map", map);
		return "/test.jsp";
	}
	public String gotoFtl() throws Exception
	{
		List list = TagJDBCInstance.getInstance().queryList("select * from base_user", null);
		request.setAttribute("users", list);
		return "/test.ftl";
	}
	@URIAlias(value="d")
	public String restd() throws Exception
	{
		request.setAttribute("test", "actionKey :d的");
		return "/test.jsp";
	}
	public String testparam(String p1)
	{
		request.setAttribute("p1", p1);
		return "/test.jsp";
	}
	public String testparam(String p1,String p2)
	{
		request.setAttribute("p1", p1);
		request.setAttribute("p2", p2);
		return "/test.jsp";
	}
	//测试重载函数
	public String testparam(String p1,String p2,String p3)
	{
		request.setAttribute("p1", p1);
		request.setAttribute("p2", p2);
		request.setAttribute("p3", p3);
		return "/test.jsp";
	}

}
