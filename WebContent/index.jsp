<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="login" method="post">
			<table>
				<tr>
					<td>用户名</td>
					<td>
						<input type="text" id="username" name="username" placeholder="请输入用户名" />
					</td>
				</tr>
				<tr>
					<td>密码</td>
					<td>
						<input type="password" id="password" name="password" placeholder="请输入密码" />
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" id="login">登录</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>