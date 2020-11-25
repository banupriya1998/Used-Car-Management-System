<%-- 
    Document   : logout
    Created on : 6 Oct, 2019, 9:42:05 PM
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
          <% session.invalidate(); 
             response.sendRedirect("index.jsp");
          %>
    </body>
</html>
