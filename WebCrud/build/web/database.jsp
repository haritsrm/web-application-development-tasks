<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <title>Cruddie</title>
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
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="database.jsp">Database</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="tentang.jsp">Tentang kami</a>
                        </li>
                    </ul>
                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="text" placeholder="NIM" aria-label="NIM" name="nim"/>
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="but" id="but">Search</button>
                      </form>
                </div>
            </nav>
        </header>
        <div class="jumbotron">
            <h1 class="display-4">Welcome to Our Database!</h1>
            <p class="lead">Form ini akan menampilkan daftar biodata mahasiswa.</p>
            <hr class="my-4">
            <p>Untuk menambahkan data silahkan klik button dibawah ini.</p>
            <p class="lead">
              <a class="btn btn-primary btn-lg" href="tambah.jsp" role="button">Tambah data</a>
            </p>
        </div>
        <div id="con">
            <%
            try {
                String Host = "jdbc:mysql://localhost:3306/basisdata";
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                ResultSet rq = null;
                String nim="";          
                nim = request.getParameter("nim");
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(Host, "root", "");
                statement = connection.createStatement();
                String Data = "select * from biodata";
                String Search = "select * from biodata where nim like '"+request.getParameter("nim")+"'";
                if(request.getParameter("nim")==null || request.getParameter("nim")==""){
                rs = statement.executeQuery(Data);
            %>
            <table class="table table-hover table-light table-responsive">
                <tr>
                    <th>NIM</th>
                    <th>Nama</th>
                    <th>Tanggal Lahir</th>
                    <th>Jenis Kelamin</th>
                    <th>Alamat</th>
                    <th>Perintah</th>
                </tr>
                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("nim")%></td>
                    <td><%=rs.getString("nama")%></td>
                    <td><%=rs.getString("tglLahir")%></td>
                    <td><%=rs.getString("jk")%></td>
                    <td><%=rs.getString("alamat")%></td>                  
                    <td><a class="btn btn-info btn-sm" href="update.jsp?u=<%=rs.getString("nim")%>" >edit</a><a class="btn btn-warning btn-sm" href="delete.jsp?d=<%=rs.getString("nim")%>" > hapus</a></td>
                </tr>
                <%   }
                    rs.close();
                    }else if(request.getParameter("nim")!=""){
                    rq = statement.executeQuery(Search);
                %>
            <table class="table table-hover table-light table-responsive">
                <tr>
                    <th>NIM</th>
                    <th>Nama</th>
                    <th>Tanggal Lahir</th>
                    <th>Jenis Kelamin</th>
                    <th>Alamat</th>
                    <th>Perintah</th>
                </tr>
                <%
                    while (rq.next()){
                        %>
                <tr>
                    <td><%=rq.getString("nim")%></td>
                    <td><%=rq.getString("nama")%></td>
                    <td><%=rq.getString("tglLahir")%></td>
                    <td><%=rq.getString("jk")%></td>
                    <td><%=rq.getString("alamat")%></td>                  
                    <td><a class="btn btn-info btn-sm" href="update.jsp?u=<%=rq.getString("nim")%>" >edit</a><a class="btn btn-warning btn-sm" href="delete.jsp?d=<%=rq.getString("nim")%>" > hapus</a></td>
                </tr>
                <%
                    }
                rq.close();
                }
                %>
            </table>
            <%
                
                
                statement.close();
                connection.close();
            } catch (Exception ex) {
                out.println("Not Found");
            }
            %>
        </div>
        <footer class="mt-5">
                <p align="center" class="lead">Copyright &copy pengembanganaplikasiweb.java.kelompok</p>
        </footer>
        <script src="js/bootstrap.min.js"></script>        
    </body>
</html>
