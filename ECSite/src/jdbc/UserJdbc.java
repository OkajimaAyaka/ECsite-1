package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.UserBean;

public class UserJdbc {

	public void  insert(UserBean ub) {



		String url = "jdbc:mysql://localhost/ec_site_db?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&"
				+ "useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&"
				+ "serverTimezone=UTC";
		String id = "root";
		String pw = "1qaz2wSX?";

		//↓try内に書くとfinallyで使用できないため外に書く
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");		//ドライバのロードとインスタンス化を行う


			conn = DriverManager.getConnection(url,id,pw);		//接続

			stmt = conn.createStatement();		//connectionオブジェクトのcreateStatementメソッドを実行　引数なし、戻り値はjava.sql.Statementオブジェクト

			String query = "insert into user(user_id,password,email_address,postal_code,address,user_name)"+"values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);



			pstmt.setString(1,ub.getUser_id());
			pstmt.setString(2,ub.getPassword());
			pstmt.setString(3,ub.getEmail_address());
			pstmt.setInt(4,ub.getPostal_code());
			pstmt.setString(5,ub.getAddress());
			pstmt.setString(6,ub.getUser_name());
			pstmt.executeUpdate();

			 conn.commit();		//コミットを発行しデータベースを確定させる

		}catch(ClassNotFoundException ex){
			//例外処理
			ex.printStackTrace();

		}catch(SQLException ex){
			//例外処理

			ex.printStackTrace();

		}finally{		//必ず実行する処理

			try{
				if (stmt!=null)stmt.close();
				if (rs!=null) rs.close();				//接続したのとは逆順で解除する
				if (stmt!=null) stmt.close();
				if (conn!=null) conn.close();
			}catch(Exception ex){
			}
}
	}
}