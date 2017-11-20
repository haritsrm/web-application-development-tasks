<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    
    %>
<!DOCTYPE html>

                
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cruddie</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="shortcut icon" href="images/favicon.png">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#">Cruddie</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="database.jsp">Database</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="tentang.jsp">Tentang kami</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="jumbotron">
            <h1 class="display-4">Persentasi Mahasiswa</h1>
            <br>
            <a href="database.jsp" class="btn btn-primary">Check database!</a>
        </div>
        <br>
        <div class="container">
        <%
    try {
                String Host = "jdbc:mysql://localhost:3306/basisdata";
                com.mysql.jdbc.Statement statement = null;
                ResultSet rs = null;
                ResultSet rq = null;
                ResultSet rl = null;
                String nim="";          
                nim = request.getParameter("nim");
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection connection = DriverManager.getConnection(Host, "root", "");
                java.sql.Statement statementt = connection.createStatement();
                String Data1 = "select sum(case when jk='Laki-laki' then 1 else 0 end) as pria from biodata";
                String Data2 = "select sum(case when jk='Perempuan' then 1 else 0 end) as wanita from biodata";
                String Data3 = "select count(jk) as total from biodata";
                rl = statementt.executeQuery(Data3);
                while(rl.next()){
                    String jumS=rl.getString("total");
                    float jum=Integer.parseInt(jumS);
                    rs = statementt.executeQuery(Data1);
                    while(rs.next()){
                        String jumlS=rs.getString("pria");
                        float juml=Integer.parseInt(jumlS);
                        float laki=(juml/jum)*100;
                        %>
        <h4 align="center">Laki-laki</h4>
        <div class="progress">
            <div class="progress-bar bg-success" role="progressbar" style="width: <%=laki%>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <br>
                        <% 
                    }
                    rq = statementt.executeQuery(Data2);
                    while(rq.next()){
                        String jumpS=rq.getString("wanita");
                        float jump=Integer.parseInt(jumpS);
                        float pere=(jump/jum)*100;
                    %>
        <h4 align="center">Perempuan</h4>
        <div class="progress">
            <div class="progress-bar bg-info" role="progressbar" style="width: <%=pere%>%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
                    <%
                    }
                }
    rs.close();
    rq.close();
    rl.close();
    statementt.close();
    connection.close();
    }catch(Exception e){
    }
%>
        </div>
        <br>
        <footer class="mt-5">
                <p align="center" class="lead">Copyright &copy pengembanganaplikasiweb.java.kelompok</p>
        </footer>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>