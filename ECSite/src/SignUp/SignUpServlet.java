package SignUp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import jdbc.UserJdbc;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {


	//セッション管理
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if(session==null) {
			System.out.println("セッション×");
			return;
		}
		System.out.println("セッション継続中");

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");


		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String emailAddress = request.getParameter("emailAddress");
		String pCode = request.getParameter("postalCode");
		String address = request.getParameter("address");
		String userName = request.getParameter("userName");

		if(userId=="" || password=="" || emailAddress=="" || pCode=="" || address=="" || userName=="") {
			request.setAttribute("message", "未入力の項目があります");
			request.getRequestDispatcher("/jsp/SignUp.jsp").forward(request, response);
			return;

		}else if(pCode.length()!=7){
			request.setAttribute("message", "郵便番号はハイフンなし半角数字7桁で入力してください");
			request.getRequestDispatcher("/jsp/SignUp.jsp").forward(request, response);
			return;

		}else if(userId.length()>=20||password.length()>=20||emailAddress.length()>=40||address.length()>=20||userName.length()>=100){
			request.setAttribute("message", "文字数オーバーです");
			request.getRequestDispatcher("/jsp/SignUp.jsp").forward(request, response);
			return;

		}
		else if(userId.matches("^[a-zA-Z0-9]+$")||password.matches("^[a-zA-Z0-9]+$")||emailAddress.matches("^[a-zA-Z0-9]+$")){
			request.setAttribute("message", "ID,メールアドレス、パスワードは半角英数字のみ入力してください");
			request.getRequestDispatcher("/jsp/SignUp.jsp").forward(request, response);
			return;


		}
		else {

			int postalCode = Integer.parseInt(pCode);
			UserBean ub = new UserBean(userId, password, emailAddress, postalCode, address, userName);

			UserJdbc uj = new UserJdbc();
			uj.insert(ub);


			RequestDispatcher rd = request.getRequestDispatcher("/jsp/MyPage.jsp");
			rd.forward(request, response);
		}


		}





	}

