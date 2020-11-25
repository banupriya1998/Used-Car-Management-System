<%-- 
    Document   : purchase
    Created on : 10 Oct, 2019, 11:34:56 PM
    Author     : JANE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase</title>
        <style>
            .whole
            {
               background-color: #248bad; 
               text-align:center;
               height: 590px;
               width: 1335px;
               margin: 10px 2px;
               color:#fdfefe;
            }
        </style>
    </head>
    <body>
               <div class="whole">
                <%@page import= "java.sql.*"%>
        <%
              String id=request.getParameter("pid");
Connection c;
Statement st;
ResultSet rs,rs1;
 String seller=null;
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
rs=st.executeQuery("SELECT * FROM products where product_id='"+id+"'");
while(rs.next())
{  seller=rs.getString("username"); 
}

rs1=st.executeQuery("SELECT * FROM orders");
while(rs1.next())
{ size++; }
int sizes=size+1;
st.executeUpdate("INSERT INTO orders(order_id,product_id,seller,buyer,order_status) VALUES('"+sizes+"','"+id+"','"+seller+"','"+session.getAttribute("username")+"','Confirmed')");

st.close();
c.close();
}
catch(Exception e1){}
       %>
       <% if(request.getParameter("pay")== null) { %>
        <h2>Payment Details:</h2>
        <form method="post">
         <input type="radio" name="payment" value="Netbanking"> NET BANKING <br>
         <input type="radio" name="payment" value="creditcard"> CREDIT CARD<br>
         <input type="radio" name="payment" value="debitcard"> DEBIT CARD<br>
         <input type="radio" name="payment" value="cod"> CASH ON DELIVERY <br>
         <input type="submit" name="pay" value="Pay"> <br>        
        </form>
        <%} else {%>

 
             <br><br><br><br><br>     
                    <h1> Payment Successful!!</h1>
             <br><br><br><br><br>     
             <a href="index.jsp" style="color:#fdfefe;"> Go to home page</a>
             <br> <br>
             <a href="orders.jsp" style="color:#fdfefe;"> check your orders</a>
      
<%}%>
</div>
    </body>
</html>
