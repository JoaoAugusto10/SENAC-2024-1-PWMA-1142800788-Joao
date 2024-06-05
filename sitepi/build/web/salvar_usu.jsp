
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Criar conta</title>
    </head>
    <body>
        <%
            String email, senha;
            email = request.getParameter("email");
            senha = request.getParameter("senha");
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "guigasoares12");
            st = conecta.prepareStatement("INSERT INTO usuario VALUES(?,?)");
            st.setString(1, email);
            st.setString(2, senha);
            st.executeUpdate();
            response.sendRedirect("index.html");


        %>
    </body>
</html>
