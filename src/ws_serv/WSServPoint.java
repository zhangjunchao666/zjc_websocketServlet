package ws_serv;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 * TODO WebSocket服务
 * @copyright {@link www.hndfsj.com}
 * @author zhangjunchao@hndfsj.com
 * @version 2020年3月10日 下午2:14:34
 * @see ws_serv.WSServPoint
 */
@ServerEndpoint(value = "/chatroom")
public class WSServPoint {
	
	// 定义静态变量，把每一个session连接放到set中，进行消息群发准备
	private static Set<Session> set = new HashSet<Session>();

	// WebSocket打开
    @OnOpen
    public void onOpen(Session session) throws IOException {
        System.out.println("WebSocket连接建立成功！");
        // 将每一个session，放入set集合中，遍历，实现群发功能
        set.add(session);
        
    }

    // WebSocket关闭
    @OnClose
    public void onClose() {
        System.out.println("WebSocket连接已关闭！");
    }

    // WebSocket信息交互：接收前端传过来的message，然后进行业务剖析
    @OnMessage
    public void onMessage(String message,Session session) throws IOException {
      System.out.println("WebSocket信息接收："+message);
      
      
      // 用session中带的方法将信息推送到前台:单发
      // session.getBasicRemote().sendText(message);
      
      
      // 群发
      for (Session s : set) {
    	  s.getBasicRemote().sendText(message);
	}
          
      
    }

    // WebSocket出现异常
    @OnError
    public void onError(Throwable t) throws Throwable {
        System.out.println("WebSocket Error: " + t.toString());
    }
	
	
	
	

}
