<%-- 
    Document   : index
    Created on : 6 Oct, 2019, 9:14:41 PM
    Author     : JANE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <style>

.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 700px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
.topnav {
  overflow: hidden;
  background-color: #FDFEFE;
}

.topnav a {
  float: left;
  color: #1A84AB;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav form {
  float: left;
  color: #1A84AB;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;

}


.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CA8AF;
  color: white;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.price {
  color: grey;
  font-size: 22px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card button:hover {
  opacity: 0.7;
}

</style>
    </head>
    <body>
         
 <div class="topnav">
  <a class="active" href="index.html">Home</a>
  <a href="seller.html">Sell on Carbay</a>
  <form method="POST" action="search.jsp">
  <input type="text" name="search" style="float:left" placeholder="Search by brand"/>
  <button style="display:inline-block; float: right;
  padding: 6px;
  margin-top: 0px;
 height:22px;
 text-align:left">
 Search 
</button>
  </form>
  <% if(session.getAttribute("username")==null){ %>
  <a href="login.html" style="float:right">Login</a>
  <%} else {%>
  <a href="logout.jsp" style="float:right">Logout</a>
  <%}%>
  <a href="signup.html" style="float:right">Sign up</a>
  <a href="orders.jsp" style="float:right">My orders</a>
  <a href="sales.jsp" style="float:right">My sales</a>

</div>
   
        <%if(session.getAttribute("username")!=null){ %>
        <h2 style="color:#248bad;" align="center"> Hi </h2>
       <% out.print(" <h2> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp"
               + "&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp"
               + "&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp"
               + "&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp &nbsp"
               +session.getAttribute("username")+"</h2>");} %>
      
   
 <h2  style="color:#248bad;" align="center">WELCOME TO CAR BAY!!!</h2>
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="car1.jpg" style="width:100%">
  <div class="text"><h1>It's a win win deal.. go for it!!!</h1></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="car2.jpeg" style="width:100%">
  <div class="text">
      <h1>Buy a car within your affordable budget</h1> </div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="car3.jpg" style="width:100%">
  <div class="text">
  <h1>Sell your car for the best Price</h1> </div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
<%@page import= "java.sql.*"%>
<%
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

rs=st.executeQuery("SELECT * FROM products where product_id not in(select product_id from orders) and username<>'"+session.getAttribute("username")+"'");
while(rs.next())
{
    String id=rs.getString("product_id");
    String pdesc=rs.getString("product_description");
    String pname=rs.getString("username");
    String product_name=rs.getString("product_name");
    String rate=rs.getString("price");
    size++;
%>
<div class="card" style="display:inline-block"> 
    <img src="<%=id%>.jpg" alt="car" style="width:100%">
  <h1><%out.print(product_name);%></h1>
  <p class="price">Rs.<%out.print(rate);%></p>
  <p><%out.print(pdesc);%><br> by <%out.print(pname);%> </p>
  <form action="purchase.jsp"  method="post">
      <input type="hidden" name="pid" value="<%=id%>"/>
      <p><button> Buy </button></p>
  </form>
</div>
<% }
rs.close();
st.close();
c.close();
}
catch(Exception e1){ out.println(e1);}
%>
 
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1;}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); 
}
</script>
</body>
</html>


