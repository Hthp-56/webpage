<%-- 
    Document   : logout
    Created on : Nov 7, 2019, 3:12:09 PM
    Author     : user
--%>


<% 
    session.invalidate();
 %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout </title>
    </head>
    <body>
        <h1>Log-Out!</h1>
        <%
         // New location to be redirected
         String site = new String("index.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
        %>
    </body>
</html>
