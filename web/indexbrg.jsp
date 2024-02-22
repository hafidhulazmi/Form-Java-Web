
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
        <link rel="icon" type="image/x-icon" href="img/brg.png">
    </head>
    <body>
        <nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand mx-51" href="index.jsp">Home</a>
            </div>
        </nav>
        <div class="mt-3">
            <p class="h2 text-center">
                Form Barang
            </p>
        </div>
        <form method="post" action="tambahbrg.jsp" class="mx-5 my-5">
            <div class="grid gap-3 mx-3 my-2">
                <label>Kode Barang</label>
                <div class="col-8 mb-3">
                    <input class="me-4" type="number" class="form-control" name="kdbarang"  max="9999999999">
                    <input class="btn btn-secondary me-4" type="submit" value="Cari" name="cmdsimpan" style="width: 100px">
                </div>
                <label>Nama Barang</label>
                <div class="row mb-3">
                    <div class="col-4">
                        <input type="text" class="form-control" name="nmbarang""  maxlength="20">
                    </div>
                </div>
                <label>Harga</label>
                <div class="col-8 mb-3">
                    <input class="me-4" type="number" class="form-control" name="harga"  max="9999999999">
                </div>
                <label>Satuan</label>
                <div class="col-4 mb-3">
                    <select class="form-select" name="satuan" >
                        <option selected>Pilih Satuan</option>
                        <option value="Pcs">Pcs</option>
                        <option value="Lusin">Lusin</option>
                        <option value="Buah">Buah</option>
                    </select>
                </div>
                <label>Stok</label>
                <div class="col-8 mb-3">
                    <input class="me-4" type="number" class="form-control" name="stok"  max="999999">
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
                <th>Kode Barang</th>
                <th>Nama Barang</th>
                <th>Harga</th>
                <th>Satuan</th>
                <th>Stok</th>
            </tr>
            <%
                try{
                    String sql="select * from barang";
                    Connection conn;
                    conn= Koneksi.bukaKoneksi();
                    Statement st = conn.createStatement();
                    ResultSet rs = st.executeQuery(sql);
                    Integer i=1;
                    while (rs.next()) {
                    %>
            <tr>
                <td><% out.print(i); %></td>
                <td><% out.print(rs.getString("kdbarang")); %></td>
                <td><% out.print(rs.getString("nmbarang")); %></td>
                <td><% out.print(rs.getString("harga")); %></td>
                <td><% out.print(rs.getString("satuan")); %></td>
                <td><% out.print(rs.getString("stok")); %></td>
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
