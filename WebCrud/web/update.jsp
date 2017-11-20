<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cruddie</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="shortcut icon" href="images/favicon.png">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		
                <script>
                $(document).ready(function(){
                            $("#simpan").click(function(){
                                    alert("Data berhasil diubah!");
                            });
                        });
                </script>
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
            <h1 class="display-4">Edit Data</h1>
            <p class="lead">Form ini untuk merubah data mahasiswa yang telah diinputkan.</p>
            <hr class="my-4">
        </div>
        <div id="con2">
            <form action="" method="post">
                 <%
                try {
                    String Host = "jdbc:mysql://localhost:3306/basisdata";
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(Host, "root", "");
                    statement = connection.createStatement();
                    String u=request.getParameter("u");
                    int num=Integer.parseInt(u);
                    String Data = "select * from biodata where nim='"+num+"'";
                    rs = statement.executeQuery(Data);
                    while (rs.next()) {
                %>
                <div class="container" id="con2">
                    <form action="" method="post">
                        <div class="form-group row">
                            <label></label><input type="hidden" name="nim" value='<%=rs.getString("nim")%>'/>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Nama</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" placeholder="Nama" name="nama" value='<%=rs.getString("nama")%>'>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Tanggal lahir</label>
                            <div class="col-sm-10">
                              <input type="date" class="form-control" placeholder="YYYY-MM-DD" name="tglLahir" value='<%=rs.getString("tglLahir")%>'>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Jenis kelamin</label>
                            
                              <%
                                  if (rs.getString("jk").equals("Laki-laki")){
                                      %>
                            <div class="col-sm-10">
                                <label>
                                    <input id="option1" type="radio" name="jk" value="Laki-laki" checked=""> Laki-laki
                                </label>
                                <label>
                                    <input id="option2" type="radio" name="jk" value="Perempuan"> Perempuan
                                </label>
                            </div>
                                              <%
                                  }else if (rs.getString("jk").equals("Perempuan")){
                                  %>
                            <div class="col-sm-10">
                                <label>
                                    <input id="option1" type="radio" name="jk" value="Laki-laki"> Laki-laki
                                </label>
                                <label>
                                    <input id="option2" type="radio" name="jk" value="Perempuan" checked=""> Perempuan
                                </label>
                            </div>
                                  <%
}
                                    %>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Alamat</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" placeholder="Alamat" name="alamat" value='<%=rs.getString("alamat")%>'>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label"></label>
                            <div class="col-sm-10">
                                <input id="simpan" class="btn btn-success" type="submit" name="submit" value="Ubah"/>
                                <a class="col-sm-1 mt-2" href="database.jsp">Kembali</a>
                            </div>
                        </div>
                    </form>
                </div>
                <%   }
                    rs.close();
                    statement.close();
                    connection.close();
                } catch (Exception ex) {
                    out.println("Can't connect to database.");
                }
                %>
            </form>
        </div>
        <footer class="mt-5">
                <p align="center" class="lead">Copyright &copy pengembanganaplikasiweb.java.kelompok</p>
        </footer>
    </body>
</html>
<%


String a=request.getParameter("nim");
String b=request.getParameter("nama");
String c=request.getParameter("tglLahir");
String d=request.getParameter("jk");
String e=request.getParameter("alamat");

//membuat variabel untuk nampung alamat untuk akses database nantinya.

String url="jdbc:mysql://localhost:3306/basisdata";

//membuat koneksi ke database dengan jdbc

Connection conn=null;
PreparedStatement ps=null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

int updateQuery=0;


//untuk mengecek textbox name, city, dan phone tidak kosong

if(a!=null && b!=null && c!=null && d!=null && e!=null){


    if(a!="" && b!="" && c!="" && d!="" && e!=""){
         try{
        conn=DriverManager.getConnection(url,"root","");
        String query="update biodata set nama=?,tglLahir=?,jk=?,alamat=? where nim='"+a+"'";
        ps=conn.prepareStatement(query);
        ps.setString(1,b);
        ps.setString(2,c);
        ps.setString(3,d);
        ps.setString(4,e);
        updateQuery=ps.executeUpdate();
        if(updateQuery!=0){
            response.sendRedirect("database.jsp");
        }

    }catch(Exception ex){
        out.println("Koneksi bermasalah");
        
 
    }finally{
        ps.close();
        conn.close();
    }


    }
}

   
%>

