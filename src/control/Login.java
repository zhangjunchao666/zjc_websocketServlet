package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		// 跳转到doPost请求，默认是doGet
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		// 中文乱码
		request.setCharacterEncoding("utf-8");
		
		// 获取登录的用户名和密码进行认证
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("username：" + username);
        System.out.println("password：" + password);


        // 先获得session后取得sessionId
        HttpSession session = request.getSession();
        String sessionId = session.getId();
        System.out.println("sessionId：" + sessionId);

        // 进行页面的跳转
        request.getRequestDispatcher("/WEB-INF/jsp/websocketChatroom.jsp").forward(request,response);
		
		
		
		
	}

}
