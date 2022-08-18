<%@page import="java.util.Map"%>
<%@ page import="java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="Jpack.DbConfig" %>
<%@ page import="Jpack.UserTypes" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
if(session.getAttribute("phone") == null){
    String site = new String("index.jsp");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);         
}


if(request.getParameterMap().containsKey("id_sold") ){

    String id = (String)request.getParameter("id_sold");

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);   
       
        String sql = "UPDATE `products` SET `status`=? WHERE id=?" ;
        PreparedStatement pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, "SOLD");
        pstmt.setString(2, id);
        int updateCount = pstmt.executeUpdate();
        if(updateCount > 0){
%>
            <script>alert('Status sold update successfully!'); window.location.href = "user-account.jsp?active=manage_crops" ;</script>;
<%
        }
        else{ 
%>
            <script>alert('Fail to update status!');</script>;
<%
        }    
     }catch(Exception e){
        out.print(e.toString());
     }
}










%>