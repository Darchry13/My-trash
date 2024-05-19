package userdata;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserDataController extends HttpServlet {
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
			DataSource date = (DataSource)contextNeeded.lookup("Data");
			con = date.getConnection();
			Statement sql = con.createStatement();
			ResultSet rs = sql.executeQuery("select * from UserData");
			HttpSession session = request.getSession();
			UserList lst = (UserList)session.getAttribute("lst");
			if(lst.userlist == null)
				lst.userlist = new ArrayList<Users>();
			else lst.userlist.clear();
			while(rs.next()) {
				Users theUsers = new Users();
				theUsers.setUsername(rs.getString(1));
				theUsers.setPassword(rs.getString(2));
				theUsers.setPhonenumber(rs.getString(3));
				theUsers.setEmail(rs.getString(4));
				theUsers.setSex(rs.getString(5));
				theUsers.setTag(1);
				lst.setUserlist(theUsers);
			}
			con.close();
			response.sendRedirect("userlist.jsp");
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