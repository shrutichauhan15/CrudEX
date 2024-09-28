package RegisterServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email"); 
		
		String password = request.getParameter("password");
		
		
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		try {
			//load the JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Establish the connection
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase","root", "root");
			
			//Prepare the SQL query with place holders
			String sql= "SELECT * FROM users WHERE email = ? AND password = ?";
			
			//Create the PreparedStatement object
			pstmt =conn.prepareStatement(sql);
			
			//Set the values for the place holders 
			
			pstmt.setString(1, email );
			pstmt.setString(2, password);
			//execute the query
			
			rs= pstmt.executeQuery();
			
			//process the result set
			
			if(rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("username", rs.getString("username"));
				System.out.println("You are logged in successfully");
				response.sendRedirect("Welcome.jsp");
			} else {
				response.sendRedirect("index.html");
			}
			
			
			
		}
			
		
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try { if (rs != null)rs.close(); } catch (SQLException e) { e.printStackTrace();
		}try { if (pstmt != null)pstmt.close(); } catch (SQLException e) { e.printStackTrace();
		}try { if (conn != null)conn.close(); } catch (SQLException e) { e.printStackTrace();
		}
		}
	}

}
