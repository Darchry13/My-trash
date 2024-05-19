package userdata;

import java.io.*;
import java.sql.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserListController extends HttpServlet {
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
			PreparedStatement pre = null;
			String insertSQL = "insert into UserData values(?, ?, ?, ?, ?)";
			pre = con.prepareStatement(insertSQL);
			String name = request.getParameter("UserName");
			String password = request.getParameter("PassWord");
			String phonenumber = request.getParameter("PhoneNumber");
			String email = request.getParameter("Email");
			String sex = request.getParameter("Type");
			if(sex != null && sex.equals("Male"))	sex = "男";
			else if(sex != null && sex.equals("Female"))	sex = "女";
			pre.setString(1, name);
			pre.setString(2, password);
			pre.setString(3, phonenumber);
			pre.setString(4, email);
			pre.setString(5, sex);
			pre.execute();
			HttpSession session = request.getSession();
			Users theUsers = (Users)session.getAttribute("theUsers");
			theUsers.setUsername(name);
			theUsers.setPassword(password);
			theUsers.setPhonenumber(phonenumber);
			theUsers.setEmail(email);
			theUsers.setSex(sex);
			theUsers.setTag(1);
			con.close();
			response.sendRedirect("regOK.jsp");
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