<%-- 
    Document   : upload
    Created on : 9 Oct, 2019, 9:59:48 PM
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
       <%@ page import="com.oreilly.servlet.MultipartRequest" %>  
 <%@ page import="java.io.*"%>
 <%@ page import="java.util.*" %>
 
<%  
MultipartRequest m = new MultipartRequest(request, "C:/Users/Jane/Documents/NetBeansProjects/car dealer/web");  
String filenam=m.getParameter("name");//recieve fname

Enumeration files = m.getFileNames();
while(files.hasMoreElements())
{
    String upload=(String)files.nextElement();

    File filename=new File(m.getOriginalFileName(upload));
    File newfile = new File("img");   
    filename.renameTo(newfile);
}
out.print("successfully uploaded"+m.getOriginalFileName(filenam));  
  response.sendRedirect("index.jsp");
%>
    </body>
</html>
