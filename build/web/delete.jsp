<%
if(session.getAttribute("phone") == null){
    String site = new String("index.jsp");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);         
}
%>

<%@page import="java.util.Map"%>
<%@ page import="java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="Jpack.DbConfig" %>
<%@ page import="Jpack.UserTypes" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    if( request.getParameterMap().containsKey("delete_user_id") ){
        
        String id = request.getParameter("delete_user_id");
        String active = request.getParameter("active");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            String sql = "DELETE FROM `users` WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            int deleteCount = pstmt.executeUpdate();

            if(deleteCount > 0){
                %>
                <script>alert('Account Successfully Deleted!'); window.location.href = "user-account.jsp?active=<%out.print(active);%>" ;</script>;
                <%
            }
            else{ %>
                <script>alert('Fail to Deleted Account!'); window.location.href = "user-account.jsp?active=<%out.print(active);%>"</script>;
                <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
    }
    else if( request.getParameterMap().containsKey("delete_product_id") ){
        
        String id = request.getParameter("delete_product_id");
        String active = request.getParameter("active");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            String sql = "DELETE FROM `products` WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            int deleteCount = pstmt.executeUpdate();

            if(deleteCount > 0){
                %>
                <script>alert('Product Successfully Deleted!'); window.location.href = "user-account.jsp?active=<%out.print(active);%>" ;</script>;
                <%
            }
            else{ %>
                <script>alert('Fail to Deleted Product!'); window.location.href = "user-account.jsp?active=<%out.print(active);%>"</script>;
                <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
    }


%>

