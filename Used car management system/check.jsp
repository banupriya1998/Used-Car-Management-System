<%@page import= "java.sql.*"%>
<%
   String act=request.getParameter("action");
   String user=request.getParameter("username");
   String pass=request.getParameter("password");  
   String mail=request.getParameter("mail");
   String cont=request.getParameter("contact");
   String address=request.getParameter("address");
  
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
if(act.equals("login"))//for login 
{
rs=st.executeQuery("SELECT * FROM login WHERE username='"+user+"' AND passwd='"+pass+"'");
if(rs.next())
{
out.println("logged");
session.setAttribute("username",user);
response.sendRedirect("index.jsp");
}
else{out.println("wrong username/password");}
rs.close();
}
else // for registration
{
  st.executeUpdate("INSERT INTO login(username,mailid,passwd,contact_no,address) VALUES('"+user+"','"+mail+"','"+pass+"','"+cont+"','"+address+"')");
 response.sendRedirect("login.html");
}
st.close();
c.close();
}
catch(Exception e1){ out.println(e1);}
%>

