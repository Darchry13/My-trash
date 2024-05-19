package userdata;

import java.io.*;
import java.sql.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset = utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		Connection con = null;
		try {
			Context context = new InitialContext();
			Context contextNeeded = (Context)context.lookup("java:comp/env");
			DataSource ds = (DataSource)contextNeeded.lookup("Data");
			con = ds.getConnection();
			Statement sql = con.createStatement();
			ResultSet rs = sql.executeQuery("select * from UserData");
			String name = request.getParameter("UserName");
			String password = request.getParameter("PassWord");
			HttpSession session = request.getSession();
			Users theUsers = (Users)session.getAttribute("theUsers");
			theUsers.setTag(0);
			while(rs.next()) {
				String registerName = rs.getString(1);
				String registerPassword = rs.getString(2);
				if(name.equals(registerName)) {
					if(password.equals(registerPassword)) {
						theUsers.setUsername(name);
						theUsers.setPassword(password);
						theUsers.setPhonenumber(rs.getString(3));
						theUsers.setEmail(rs.getString(4));
						theUsers.setSex(rs.getString(5));
						theUsers.setTag(1);
						break;
					}
					else theUsers.setTag(-1);
				}
			}
			con.close();
			if(theUsers.tag == 1) response.sendRedirect("checkOK.jsp");
			else response.sendRedirect("Login.jsp");
		} catch(Exception e) {
			out.println(e);
			try {
				con.close();
			} catch(SQLException exp) {
				out.println(exp);
			}
		}
	}

}