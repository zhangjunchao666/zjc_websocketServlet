<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	var ws;
	var ws_url = "ws://192.168.10.224:8080/zjc_websocketServlet/chatroom"
	
	/* 进入此页面，触发此函数：建立WebSocket连接  */
	$(function () {
		ws_connect();
		$("#send").click(function () {
			ws_sendMsg();
		})
	});
	
	function ws_connect() {
		
		if ('WebSocket' in window) {
			ws = new WebSocket(ws_url);
        } else if ('MozWebSocket' in window) {
        	ws = new MozWebSocket(ws_url);
        } else {
            console.log('Error：此浏览器不支持WebSocket');
            return;
        }

		ws.onopen = function () {
            console.log('Info: 浏览器WebSocket连接打开');
           
        };

        ws.onclose = function () {
            console.log('Info: 浏览器WebSocket关闭');
            
        };

        /* WebSocket信息交互 */
        ws.onmessage = function (message) {
        	/* 接收后端返回的信息 */
            console.log(message.data);
        	var getMsgContent = message.data;
        	/* 将聊天内容显示到聊天记录框中 */
        	$("#record").append("<tr><td>"+getMsgContent+"</td></tr>")
            
           
        };
	};
	/* 浏览器WebSocket发送消息 */
	function ws_sendMsg() {
		/* 获取输入框中的信息 */
		var sendMsgContent = $("#msg").val();
		/* 调用WebSocket对象发送 */
		ws.send(sendMsgContent);
		/* 清空输入框 */
		sendMsgContent = $("#msg").val("");
	};
	/* 浏览器WebSocket发送图片 */
	function ws_sendImg() {
		
	};
</script>
</head>
<body>
	<table style="border: 1px solid #00F;">
		<tbody>
			<tr>
				<td colspan="2" align="center">
					<h3>测试WebSocket页面之模仿聊天室</h3>
				</td>
			</tr>
			<tr>
				<td width="500px" height="300px" style="border: 1px solid #00F; vertical-align: top;"id="content" name="content">
					<div style="background-color: white;">
						<table id='tbRecord'>
							<tbody id="record" style="display: block;height: 300px;width: 500px;overflow: auto;" />
						</table>
					</div>
				</td>
				<td width="100px" style="border: 1px solid #00F;vertical-align: top;">
					<div style="overflow: auto;">
						<table id="tbuserList">
							<tbody id='userList' style="display: block;height: 300px;overflow: auto;"></tbody>
						</table>
					</div>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="center">
					<input id='msg' name='msg' style="width: 100%" placeholder="输入信息" />
				</td>
			</tr>
			<tr>
				<td colspan="1" align="center">
					<button style="margin: 0 30px 0 30px" id='send' name='send'>send</button>
					<input type="file" id='img' style="width: 200px; height: 30px"/>
					<button id="uploadImg" name="uploadImg">uploadImg</button>
					<button style="margin: 0 30px" id="disconnect" name="disconnect">Disconnect</button>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>























