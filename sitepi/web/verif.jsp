<%@page import="java.io.PrintWriter"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            st = conecta.prepareStatement("select * from usuario where email = ? AND senha = ?;");
            st.setString(1, email);
            st.setString(2, senha);
            ResultSet resultado = st.executeQuery();
            if(!resultado.next()){
                out.println("<html>");
                out.println("<head><title>Entrar na Conta</title></head>");
                out.println("<body>");
                out.println("<h1>Email/Senha Incorreto</h1>");
                out.println("<a href=\"conta.html\">Tente novamente</a>");
                out.println("</body>");
                out.println("</html>");
            }else{
                response.sendRedirect("index.html");
            }
            
        %>
    </body>
</html>
