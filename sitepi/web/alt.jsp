<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Usuário</title>
    </head>
    <body>
        <%
            String email;
            email = request.getParameter("email");
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "guigasoares12");
            st = conecta.prepareStatement("SELECT * FROM usuario WHERE email = ?");
            st.setString(1, email);
            ResultSet resultado = st.executeQuery();
            if (!resultado.next()) {
                out.print("Usuário não encontrado");
            } else {
        %>
        <form method="post" action="alterar_usu.jsp">
                <p>
                    <label for="email">Email:</label>
                    <input type="text" name="email" id="email" maxlength="40" value="<%=resultado.getString("email")%>">
                </p>

                <p>
                    <label for="senha">Senha:</label>
                    <input type="text" name="senha" id="senha" maxlength="40" value="<%=resultado.getString("senha")%>">
                </p>

                <p>
                    <input class="botao" type="submit" value="Salvar Alterações">
                </p>
        </form>
        <%
            }
        %>    
    </body>
</html>
