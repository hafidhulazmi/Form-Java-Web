
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jdbc.Koneksi" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Pelanggan</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="icon" type="image/x-icon" href="img/cust.png">
    </head>
    <body>
        <nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand mx-5" href="index.jsp">Home</a>
            </div>
        </nav>
        <div class="mt-3">
            <p class="h2 text-center">
                Form Pelanggan
            </p>
        </div>
        <form method="post" action="tambahplg.jsp" class="mx-5 my-5">
            <div class="grid gap-3 mx-3 my-2">
                <label>Kode Pelanggan</label>
                <div class="col-8 mb-3">
                    <input class="me-4" type="number" class="form-control" name="kdplg" >
                    <input class="btn btn-secondary me-4" type="submit" value="Cari" name="cmdsimpan" style="width: 100px">
                </div>
                <label>Nama Pelanggan</label>
                <div class="col-8 mb-3">
                    <input type="text" class="form-control" name="nmplg" >
                </div>
                <label>Alamat</label>
                <div class="col-4 mb-3">
                    <textarea class="form-control" name="alamat" id="floatingTextarea2" style="height: 100px" ></textarea>
                </div>
                <label>No. Telepon</label>
                <div class="col-4 mb-3">
                    <input type="text" class="form-control" name="telepon" >
                </div>
                <div class="row mb-3">
                        <input class="btn btn-primary me-4" type="submit" value="Simpan" name="cmdsimpan" style="width: 100px">
                        <input class="btn btn-warning me-4" type="submit" value="Ubah" name="cmdsimpan" style="width: 100px">
                        <input class="btn btn-danger me-4" type="submit" value="Hapus" name="cmdsimpan" style="width: 100px">
                        <input class="btn btn-secondary me-4" type="submit" value="Batal" name="cmdsimpan" style="width: 100px">
                </div>
                
            </div>
        </form>
        <div class="mx-3">
        <table class="table text-center table-hover table-responsive table-striped table-bordered">
            <tr>
                <th>No.</th>
                <th>Kode Pelanggan</th>
                <th>Nama Pelanggan</th>
                <th>Alamat</th>
                <th>No. Telepon</th>
            </tr>
            <%
                try{
                    String sql="select * from pelanggan";
                    Connection conn;
                    conn= Koneksi.bukaKoneksi();
                    Statement st = conn.createStatement();
                    ResultSet rs = st.executeQuery(sql);
                    Integer i=1;
                    while (rs.next()) {
                    %>
            <tr>
                <td><% out.print(i); %></td>
                <td><% out.print(rs.getString("kdplg")); %></td>
                <td><% out.print(rs.getString("nmplg")); %></td>
                <td><% out.print(rs.getString("alamat")); %></td>
                <td><% out.print(rs.getString("telp")); %></td>
            </tr>                
                <%
                    i++;
                    }
                    st.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }            
              %>  
        </table>
        </div> 
    </body>
</html>
