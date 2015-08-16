<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String sql = "SELECT * FROM tbl_user"; 		
		Connection conn = null;          			
		Statement st = null;						
		ResultSet rs = null;						
		
		try {
			Class.forName("com.mysql.jdbc.Driver");                      

			conn = (Connection) DriverManager
		.getConnection("jdbc:mysql://localhost:3306/jsp_db","root","");

			st =  (Statement) conn.createStatement();
			rs = st.executeQuery(sql);

			while( rs.next()){
				System.out.print(rs.getInt("id")+" ");
				System.out.print(rs.getString("name")+" ");
				System.out.print(rs.getString("password")+" ");
				System.out.print(rs.getString("email")+" ");
				System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {	
				rs.close();
			} catch (Exception e2) {
			}
			
			try {
				st.close();
			} catch (Exception e3) {
			} 
				
			try {
				conn.close();
			} catch (Exception e4) {
			} 
		}
%>		
</body>
</html>