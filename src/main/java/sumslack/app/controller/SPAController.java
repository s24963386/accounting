package sumslack.app.controller;

import java.util.Map;

import com.sumscope.tag.rest.annotation.URIAlias;
import com.sumscope.tag.rest.servlet.BaseController;
import com.sumscope.tag.sql.TagJDBCInstance;

@URIAlias("teams")
public class SPAController extends BaseController{
	
	public String html(String pagename) throws Exception
	{
		return "/spa/" + pagename + ".html";
	}
	public String jsp(String pagename) throws Exception
	{
		return "/spa/" + pagename + ".jsp";
	}
	public String ftl(String pagename) throws Exception
	{
		return "/spa/" + pagename + ".ftl";
	}
}
