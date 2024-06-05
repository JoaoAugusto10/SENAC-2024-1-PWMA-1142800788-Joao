<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Usuários</title>
    </head>
    <body>
        <%
           Connection conecta;
           PreparedStatement st;
           Class.forName("com.mysql.cj.jdbc.Driver");
           conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "guigasoares12");
           st = conecta.prepareStatement("SELECT * FROM usuario;");
           ResultSet rs = st.executeQuery();
           %>
            <table border="1">
                 <tr>
                     <th>Email</th><th>Senha</th><th>Exclusão</th><th>Alteração</th>
                 </tr>
           <%
           while(rs.next()){
           %>   
                 
                 <tr>
                     <td><%=rs.getString("email")%></td>
                     <td><%=rs.getString("senha")%></td>
                     <td><a href="excusu.jsp?email=<%=rs.getString("email")%>">Excluir</a></td>
                     <td><a href="alt.jsp?email=<%=rs.getString("email")%>">Alterar</a></td>
                 </tr>
             <%
            }
            %>
            </table>
            <%
        %>    
    </body>
</html>
