<%-- 
    Document   : sales
    Created on : 11 Oct, 2019, 12:54:46 AM
    Author     : JANE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Page</title>
<style>

table{
  border: 1px solid black;
  border-collapse: collapse;
   width: 100%;    
  background-color: #d1f1f1;

}
th, td {
  padding: 15px;
  text-align: left;
}
button {
  background: none!important;
  border: none;
  padding: 0!important;
  font-family: arial, sans-serif;
  color: #069;
  text-decoration: underline;
  cursor: pointer;
}

</style>
    </head>
    <body style="text-align:center;">
              <%
    if(session.getAttribute("username")==null){
 %>
 <a href="login.html">Please login first!</a>
 <% } else {%>
        <div class="tab">
        <h1>Check your Sales!</h1>
          <table>
            <caption>Cars waiting for a new Owner😊</caption>
  <tr>
    <th>Product</th> 
  </tr>
 
 <%@page import= "java.sql.*"%>
<%
 Connection c;
 Statement st;
 ResultSet rs,rs1;
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

rs1=st.executeQuery("SELECT * from products where username='"+session.getAttribute("username")+"'");
while(rs1.next())
{
String pname=rs1.getString("product_name");
String pid=rs1.getString("product_id");
%>
  
  
<tr>
    <td>
        <form action="search.jsp" method="get">
            <input type="hidden" name="pidd" value="<%=pid%>">
        <button><%=pname%></button>
       
        </form>
    </td>
  </tr>
  </table>
<%

}

rs1.close();
%>
       <table>

     <caption>Cars Sold🎉</caption>
     <tr>
    <th>Product</th> 
    <th>Customer</th>
    <th>Order Status</th>
    <th>Date</th>
    <th>Time</th>
     <th>Update Status</th>
  </tr>
<%
rs=st.executeQuery("SELECT o.*,time(o.time),DATE_FORMAT(date(o.time),'%d/%m/%y'),product_name,product_id FROM orders o natural join products p where o.seller='"+session.getAttribute("username")+"'");
while(rs.next())
{
String pname=rs.getString("product_name");
String pid=rs.getString("product_id");
String buyer=rs.getString("buyer");
String status=rs.getString("order_status");
String dat=rs.getString("DATE_FORMAT(date(o.time),'%d/%m/%y')");
String time=rs.getString("time(o.time)");
%>
 
  
 <tr>
    <td>
        <form action="search.jsp" method="get">
            <input type="hidden" name="pidd" value="<%=pid%>">
        <button><%=pname%></button>
       
        </form>
    </td>
    <td><%=buyer%></td>
    <td><%=status%></td>
    <td><%=dat%></td>
    <td><%=time%></td>
    <td>  <form action="update.jsp" method="get">
            <input type="hidden" name="pidd" value="<%=pid%>">
        <button>update</button>
       
        </form>
    <td>
  </tr>
 
   
<%

}
rs.close();

st.close();
c.close();
}
catch(Exception e1){ out.println(e1);}}
%>
 </table>
  </div>
 
  <br><br>
<a href="index.jsp"> Go to home page </a>
</body>
</html>
