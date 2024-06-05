<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Usuários</title>
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
            st = conecta.prepareStatement("UPDATE usuario SET email = ?, senha = ? WHERE email = ?");
            st.setString(1, email);
            st.setString(2, senha);
            st.setString(3, email);
            st.executeUpdate();
            out.print("Usuário Alterado");
        %>    
    </body>
</html>
