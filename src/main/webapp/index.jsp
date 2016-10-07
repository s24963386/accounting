<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sn" uri="http://www.sumscope.com/taglib"%>
<html>
<head>
	<style type="text/css">
		li{margin:5px;}
	</style>
</head>
<body>
<p>Play&Enjoy It,<strong>JSPTagEx</strong> &nbsp;&nbsp; <a href="<sn:webroot/>/tag/logout">退出</a></p>
<h2>基础功能：</h2>
<ol>
<li>
	mvc例子：<br/>
	无别名：<a href="<sn:webroot />/restful/testController/gotoJSP.html">testController/gotoJSP.html</a><br/>
	类URI别名：<a href="<sn:webroot />/restful/a/rest1.html">a/rest1.html</a><br/>
	类和函数别名：<a href="<sn:webroot />/restful/a/b.html">a/b.html</a><br/>
	函数别名：<a href="<sn:webroot />/restful/testcontroller/d.html">testcontroller/d.html</a><br/>	
	另外一个Controller包下：<a href="<sn:webroot />/restful2/other/d.html">other/d.html</a><br/>	
	<hr/>
	测试重载函数1：<a href="<sn:webroot />/restful/testController/testparam.html?p1=abc">testController/testparam.html?p1=abc</a><br/>
	测试重载函数2：<a href="<sn:webroot />/restful/testController/testparam.html?p1=abc&p2=中国人">testController/testparam.html?p1=abc&p2=中国人</a><br/>
	测试重载函数3(参数可随意跌倒)：<a href="<sn:webroot />/restful/testController/testparam.html?p1=abc&p3=中国人&p2=p1value">testController/testparam.html?p1=abc&p3=中国人&p1=p1value</a><br/>
</li>
<li>
	Restful支持：<a href="<sn:webroot />/tag/logout">/tag/logout[resources/tag.rest.xml新增配置]</a>,<a href="<sn:webroot />/test/a">test/a[或基于注解 @TagRest(value="test/a")]</a>
</li>
<li>
	处理freemarker：<a href="<sn:webroot />/restful/testController/gotoFtl.html">testController/gotoFtl.html</a>
</li>
<li>数据集演示
    <ol>
    	<li>页面里直接使用数据集：<br/>
		按用户名模糊查询:<input name="user" id="user" type="text" /><input type="button" value="search" onclick="doQuery()"/><br/>
		<sn:dataset name="ds1">select * from base_user where username like {param.username}</sn:dataset>
		<sn:repeat varStatus="sts" var="item" items="${ds1 }">
			${sts.index+1 } ${item.username } - ${item.truename }<br/>
		</sn:repeat></li>
		<li>
			脚本SQL：<br/>
			按用户名模糊查询:
			<select id="islock">
				<option value="all">不限</option>
				<option value="0">正常</option>
				<option value="1">锁定</option>
			</select>
			<input type="button" value="search" onclick="doQuery2()"/><br/>
			<br/>
			<sn:dataset name="dsscript" datasetRel="tag.test" bizRel="sqlScript" /> 
			<sn:repeat varStatus="sts" var="item" items="${dsscript }">
				${sts.index+1 } ${item.username } ${item.islock=='0'?"正常状态":"锁定状态" }<br/>
			</sn:repeat>
		</li>
		<li>
			引用后台定义的数据集并使用了缓存策略testCache:<br/>
			<sn:dataset name="ds2" datasetRel="tag.test" bizRel="sql1" />
			<sn:repeat varStatus="sts" var="item" items="${ds2 }">
				${sts.index+1 } ${item.username } - ${item.truename }<br/>
			</sn:repeat>
		</li>
		<li>
			数据集是java类并且使用了testCache,特别注意items的写法:<br/>
			<sn:dataset name="ds_java" datasetRel="tag.test" bizRel="javabiz" />
			<sn:repeat varStatus="sts" var="item" items="${ds_java.users }">
				${sts.index+1 } ${item.menu_title }<br/>
			</sn:repeat>
		</li>
    </ol>
	
</li>
<li>AOP演示：
	<ol>
		<li>Controller中的方法拦截：
		<pre>
		@Inject(value=TestMethodAnnoInterceptor.class)
		public String restd() throws Exception
		{
			request.setAttribute("test", "actionKey :d的"+TestOtherController.class.getName());
			return "/test.jsp";
		}
		</pre>
		</li>
		<li>
			Controller的全局拦截,只需在web.xml的TagDispatchServlet中配置init-param即可
			<pre>
		  	&lt;init-param&gt;
		 		&lt;param-name>interceptor&lt;/param-name&gt;
		 		&lt;param-value>com.company.interceptor.ControllerInterceptor&lt;/param-value&gt;
		 	&lt;/init-param&gt;
			</pre>
			</p>
			
		</li>
	</ol>
</li>

<li>
	权限标签：<br/>
	<sn:authorize ifAnyGranted="reguser">不能被访问到的资源</sn:authorize>
	<sn:authorize ifAnyGranted="1">能被访问到的资源</sn:authorize>
</li>
<li>
	带else的判断语句:
	<sn:choose>
		<sn:when test="${sessionScope.username.equals('test1') }">test1登录着</sn:when>
		<sn:else>不是test1登录着</sn:else>
	</sn:choose>
</li>
<li>Logging:基于最新的Log2j 2版本，请查看后台输出，具体配置log4j2.xml</li>
<li>
	引用app.xml定义的全局变量：<sn:gv var="export.dir.tmp"/>
</li>
<li>
	调用全局函数：${sn:uuid()}
</li>
<li>
	导出测试：<sn:export bizRel="sql1" datasetRel="tag.test" expType="excel" title="导出测试">
		[
   			{name:"app_id",label:"应用ID"},
   			{label:"个人基本信息",cols:[
   				{name:"username",label:"用户名"},
   				{name:"truename",label:"姓名"}
   			]},
   			{name:"islock",label:"锁定状态"}
   		]
	</sn:export>
	<sn:export bizRel="javabiz" datasetRel="tag.test" expType="excel" title="导出java结果集">
		[
   			{name:"menu_title",label:"菜单名"},
   			{name:"menu_desc",label:"菜单备注"}
   		]
	</sn:export>
</li>
</ol>
<p></p>
<h2>插件体系</h2>
<ol>
<li>
	Websocket插件：
</li>
<li>
	全文检索，安装步骤：
	<ul>
		<li>将search-xxx.zip插件包放到plugins目录下</li>
		<li>打开zip文件包，在classes目录下的search.xml中设置索引管理</li>
		<li>调用查询接口：http://localhost:8080/tagdemo/plugin/search/search.html?queryCol=xxx&queryWhere=xxx:yyy</li>
	</ul>
</li>
<li>其他插件，方法雷同</li>
</ol>
<script type="text/javascript">
	function doQuery()
	{
		var user = document.getElementById("user").value;
		location.href = "?username="+encodeURIComponent("%")+user+encodeURIComponent("%");
	}
	function doQuery2()
	{
		var islock = document.getElementById("islock").value;
		location.href = "?islock="+islock;
	}
</script>
</body>
</html>
