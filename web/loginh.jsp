<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
    
     try
     {
        response.setContentType("text/html");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1232");
        con.commit();
        String username=request.getParameter("name");
        String password=request.getParameter("passwd");
        Statement st=con.createStatement();
        String query="select * from hospitalStaffRegister_table where name='"+username+"' and passwd='"+password+"'";
        ResultSet rs=st.executeQuery(query);
        if(rs.next())
        {
           response.sendRedirect("indexdph.html");
        }
        else
        {
            out.println("Sorry username or password error!");
        }

         }
         catch(Exception e) {out.println("Error:"+e.getMessage());}
        
     
     %>


