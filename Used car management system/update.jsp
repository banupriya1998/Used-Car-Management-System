<%-- 
    Document   : update
    Created on : 14 Oct, 2019, 4:01:01 PM
    Author     : JANE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update status</title>
        <style>
            .upd
            {
               background-color: #248bad; 
               text-align:center;
               height: 590px;
               width: 1335px;         
               margin: 10px 2px;
            }
        </style>
    </head>
    <body>
        <div class="upd">
   
    <%@page import= "java.sql.*"%>
<%
    
    String pid=request.getParameter("pidd");
    if(request.getParameter("update")==null)
    {
%>
        <div>
            <form method="post">
         <input type="radio" name="status" value="Confirmed"> Confirmed <br>
         <input type="radio" name="status" value="Shipped"> Shipped <br>
         <input type="radio" name="status" value="Delivered"> Delivered <br>
         <input type="submit" name="update" value="update"> <br>        
        </form>
        </div>
<%}
    if(request.getParameter("update")!=null)
    {
 String bt=request.getParameter("status");
 Connection c;
 PreparedStatement st;
try
{
Class.forName("com.mysql.jdbc.Driver");
}
catch(Exception e)
{out.println(e);}
try
{
c=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root","");

st=c.prepareStatement("update orders set order_status=? where product_id='"+pid+"'");
st.setString(1,bt);
st.executeUpdate();
st.close();
c.close();
}
catch(Exception e1){ out.println(e1);}}
%>
<h1 style="color:#fdfefe;"> Updated successfully!! </h1>
<br><br>
<br><br>
<br>
<a href="index.jsp" style="color:#fdfefe;"> Go to home page </a>
<br>
<br>
<br>
<a href="sales.jsp" style="color:#fdfefe;"> Return to Sales page </a>
</div>
    </body>
</html>

