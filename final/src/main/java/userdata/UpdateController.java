package userdata;

import java.io.*;
import java.sql.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.http.*;

public class UpdateController extends HttpServlet {
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
			HttpSession session = request.getSession();
			Users theUsers=(Users)session.getAttribute("theUsers");
			int panduan=theUsers.getCaozuo();
			if(panduan==1) {
				String updateSQL = "update UserData set name = ?, password = ?, phonenumber = ?, email = ?, sex = ? where name = ?";
				pre = con.prepareStatement(updateSQL);
				String name = request.getParameter("UserName");
				String password = request.getParameter("PassWord");
				String phonenumber = request.getParameter("PhoneNumber");
				String email = request.getParameter("Email");
				String sex = request.getParameter("Type");
				if(sex != null && sex.equals("Male"))	sex = "男";
				else	if(sex != null && sex.equals("Female"))	sex = "女";
				String firstName = request.getParameter("firstUsername");
				pre.setString(1, name);
				pre.setString(2, password);
				pre.setString(3, phonenumber);
				pre.setString(4, email);
				pre.setString(5, sex);
				pre.setString(6, firstName);
			}
			else if(panduan==2){
				String deleteSQL = "delete from UserData where name = ?";
				pre = con.prepareStatement(deleteSQL);
				String name = request.getParameter("UserName");
				pre.setString(1, name);
			}
			pre.execute();
			con.close();
			response.sendRedirect("search");
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