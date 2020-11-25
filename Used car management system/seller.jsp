<%-- 
    Document   : upload
    Created on : 8 Oct, 2019, 1:22:29 PM
    Author     : JANE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import= "java.sql.*"%>
   <%
    if(session.getAttribute("username")==null){
 %>
 <a href="login.html">Please login first!</a>
 <% } else { %>
     <%
    String name=request.getParameter("pname");
     String dsc=request.getParameter("pdsc");
      String price=request.getParameter("pprice");
Connection c;
Statement st;
ResultSet rs;
int size=0;
try
{
Class.forName("com.mysql.jdbc.Driver");
}
catch(Exception e)
{out.println(e);}
try
{
c=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root","");

st=c.createStatement();
rs=st.executeQuery("SELECT * FROM products");
while(rs.next())
{ size++; }
int sizes=size+1;
st.executeUpdate("INSERT INTO products(product_id,username,product_name,product_description,price) VALUES('"+sizes+"','"+session.getAttribute("username")+"','"+name+"','"+dsc+"','"+price+"')");
st.close();
c.close();
response.sendRedirect("upload.html");
}
catch(Exception e1){ out.println(e1);} }
%>


    </body>
</html>
