<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="/spa/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/spa/css/style.css">
	<script type="text/javascript" src="/spa/js/LAB.min.js"></script>
</head>
<body>
<div id='loading'>正在加载</div>
<header>
		<nav class="top-nav navbar clearfix">
			<div class="project">
				<h3>
					<span class="cur">Team1</span>
					<span class="icon icon-sort-down"></span>
				</h3>
				<ul class="group hide">
					<li>Test</li>
				</ul>
			</div>
			<ul class="menu">
				<li class="cur"><a href="teams/home">Home</a></li><span class="thread"></span>
				<li><a href="teams/page1">Page1</a></li><span class="thread"></span>
				<li><a href="teams/page2">Page2</a></li><span class="thread"></span>
			</ul>
			<ul class="pull-right tools-menu">
		    <li><span class="icon icon-search"></span></li>
		    <li><span class="icon icon-cog"></span></li>
		  </ul>
		</nav>
</header>
<div id="container" style="margin:100px 100px;font-size: 18px;font-weight:bold;color:red;"></div>
<footer>
	<p> SPA &copy; JSPTagEx</p>
</footer>
<script type="text/javascript" src="/spa/js/app.js?v=1213"></script>
</body>
</html>
