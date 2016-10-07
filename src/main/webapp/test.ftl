<html>
<body>
<h2>Hello,${username} </h2>
<p>
<ol>
	<#list users as user>
		<li>${user.username}</li>	
	</#list>
</ol>	
</p>
</body>
</html>
