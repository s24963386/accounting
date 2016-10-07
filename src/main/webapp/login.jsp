<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.sumscope.tag.TagConst" %>
<%@ taglib prefix="sn" uri="http://www.sumscope.com/taglib"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<title>Login</title>
	</head>
	<body>
		<div id="wrapper_login">
			<div id="menu">
				<div id="left"></div>
				<div id="right"></div>
				<h2>Pls Login:</h2>
				<div class="clear"></div>		
			</div>
			<div id="desc">
				<div class="body">
					<div class="col w10 last bottomlast">
						<form action="tag/login">
							<p>
								<label for="username">Username:</label>
								<input type="text" name="username" id="username" value="" size="40" class="text" />
								<br />
							</p>
							<p>
								<label for="password">Password:</label>
								<input type="password" name="passwd" id="passwd" value="" size="40" class="text" />
								<br />
							</p>
							<p class="last">
								<input type="submit" value="Login" class="novisible" />
								<a href="javascript:document.forms[0].submit()" class="button form_submit"><small class="icon play"></small><span>Login</span></a>
								<br />
							</p>
							<div class="clear"></div>
						</form>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<div id="body_footer">
					<div id="bottom_left"><div id="bottom_right"></div></div>
				</div>
			</div>		
		</div>
	</body>
</html>