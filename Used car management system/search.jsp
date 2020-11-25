<%-- 
    Document   : search
    Created on : 6 Oct, 2019, 7:07:11 PM
    Author     : JANE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
 <%@page import= "java.sql.*"%>
<%
String s=request.getParameter("search");
String ids=request.getParameter("pidd");
Connection c;
Statement st;
ResultSet rs;
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
if(ids!=null)
{
rs=st.executeQuery("SELECT * FROM products where product_id='"+ids+"'");
}
else{
rs=st.executeQuery("SELECT * FROM products where product_name='"+s+"' and product_id not in(select product_id from orders)"); 
}
while(rs.next())
{
    int id=rs.getInt("product_id");
    String pdesc=rs.getString("product_description");
    String pname=rs.getString("username");
    String product_name=rs.getString("product_name");
    String rate=rs.getString("price");
%>
<div class="card" style="display:inline-block"> 
    <img src="<%=id%>.jpg" alt="car" style="width:100%">
  <h1><%out.print(product_name);%></h1>
  <p class="price">Rs.<%out.print(rate);%></p>
  <p><%out.print(pdesc);%><br> by <%out.print(pname);%> </p>
  <% if(ids==null){ %>
  <p><button>Buy</button></p>
  <% }%>
</div>
<% }
rs.close();
st.close();
c.close();
}
catch(Exception e1){ out.println(e1);}

%>
  <a href="index.jsp" > Go to home page</a>
    </body>
</html>
