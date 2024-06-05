<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Usuários</title>
    </head>
    <body>
        <%
            String email;
            email = request.getParameter("email");
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "guigasoares12");
            st = conecta.prepareStatement("DELETE FROM usuario where email = ?;");
            st.setString(1, email);
            int resultado = st.executeUpdate();
            if (resultado == 0) {
                out.print("Este Usuário não existe");
            } else if (resultado == 1)  {
                out.print("Usuário Excluido");
            }
        %>   
    </body>
</html>
