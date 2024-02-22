<%-- 
    Document   : simpan
    Created on : Oct 25, 2023, 10:02:15 AM
    Author     : hafid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jdbc.Koneksi" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Barang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="icon" type="image/x-icon" href="img/brg.png">
    </head>
    <body>
        <%
            String kdbarang=request.getParameter("kdbarang");
            String nmbarang=request.getParameter("nmbarang");
            String harga=request.getParameter("harga");
            String satuan=request.getParameter("satuan");
            String stok=request.getParameter("stok");
            String dapat=request.getParameter("cmdsimpan");
            if (dapat.toString().equals("Simpan")) {
                try {
                    Connection conn;
                    conn = Koneksi.bukaKoneksi();
                    Statement st = conn.createStatement();
                    String sql="insert into barang(kdbarang, nmbarang, harga, satuan, stok)"
                    + " values('"+kdbarang+"', '"+nmbarang+"', '"+harga+"', '"+satuan+"', '"+stok+"')"; 
                    st.executeUpdate(sql);
                    conn.close();
                    RequestDispatcher rd=request.getRequestDispatcher("indexbrg.jsp");  
                    rd.include(request, response);
                    %>
                    
                    <%
                } catch (Exception e) {
                    out.print(e);
                }
            }else if (dapat.toString().equals("Cari")) {
                try {
                    Connection conn;
                    conn= Koneksi.bukaKoneksi();
                    Statement st = conn.createStatement();
                    String sql="select * from barang where kdbarang='"+kdbarang+"'"; 
                    ResultSet rs = st.executeQuery(sql);
                    if(rs.next()){
                    String satuancari = rs.getString("satuan");
        %>
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
                    <input class="me-4" type="number" class="form-control" name="kdbarang" value="<% out.print(rs.getString("kdbarang")); %>">
                    <input class="btn btn-secondary me-4" type="submit" value="Cari" name="cmdsimpan" style="width: 100px">
                </div>
                <label>Nama Barang</label>
                <div class="col-8 mb-3">
                    <input type="text" class="form-control" name="nmbarang" value="<% out.print(rs.getString("nmbarang")); %>">
                </div>
                <label>Harga</label>
                <div class="col-8 mb-3">
                    <input class="me-4" type="number" class="form-control" name="harga" value="<% out.print(rs.getString("harga")); %>">
                </div>
                <label>Satuan</label>
                <div class="col-4 mb-3">
                    <select class="form-select" name="satuan">
                        <option>Pilih Satuan</option>
                        <option
                            <% 
                                if(satuancari.equals("Pcs")){
                                %>selected<%
                                } 
                            %>
                            value="Pcs">Pcs</option>
                        <option
                            <% 
                                if(satuancari.equals("Lusin")){
                                %>selected<%
                                } 
                            %>
                            value="Lusin">Lusin</option>
                        <option 
                            <% 
                                if(satuancari.equals("Buah")){
                                %>selected<%
                                } 
                            %>
                            value="Buah">Buah</option>
                    </select>
                </div>
                <label>Stok</label>
                <div class="col-8 mb-3">
                    <input class="me-4" type="number" class="form-control" name="stok" value="<% out.print(rs.getString("stok")); %>">
                </div>
                <div class="row mb-3">
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
                    String sql1="select * from barang";
                    Statement st1 = conn.createStatement();
                    ResultSet rs1 = st1.executeQuery(sql);
                    Integer i=1;
                    while (rs1.next()) {
                    %>
            <tr>
                <td><% out.print(i); %></td>
                <td><% out.print(rs1.getString("kdbarang")); %></td>
                <td><% out.print(rs1.getString("nmbarang")); %></td>
                <td><% out.print(rs1.getString("harga")); %></td>
                <td><% out.print(rs1.getString("satuan")); %></td>
                <td><% out.print(rs1.getString("stok")); %></td>
            </tr>                
                <%
                    i++;
                    }
                    st1.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }            
              %>  
        </table>
        </div> 
        <%
                    }
                } catch (Exception e) {
                    out.print(e);
                }
            }else if (dapat.toString().equals("Ubah")) {
                try {
                    String sql1="update barang set ";
                    if(kdbarang!=null){
                    sql1=sql1+"nmbarang='"+nmbarang+"' ";
                    sql1=sql1+", harga='"+harga+"'";
                    sql1=sql1+", satuan='"+satuan+"'";
                    sql1=sql1+", stok='"+stok+"'";
                    sql1=sql1+" where kdbarang='"+kdbarang+"'";
                    Connection conn;
                    conn= Koneksi.bukaKoneksi();
                    Statement st = conn.createStatement();
                    st.executeUpdate(sql1);
                    conn.close();
                    %>
                    
                    <%
                    RequestDispatcher rd=request.getRequestDispatcher("indexbrg.jsp");  
                    rd.include(request, response);
                    }else{
                        %>
                        
                                                    <%
                        RequestDispatcher rd=request.getRequestDispatcher("indexbrg.jsp");  
                        rd.include(request, response);
                    }
                } catch (Exception e) {
                    out.print(e);
                }
            }else if (dapat.toString().equals("Hapus")) {
                try {
                    Connection conn;
                    conn= Koneksi.bukaKoneksi();
                    Statement st = conn.createStatement();
                    String sql1="delete from barang where kdbarang='"+kdbarang+"'"; 
                    st.executeUpdate(sql1);
                    conn.close();
                    RequestDispatcher rd=request.getRequestDispatcher("indexbrg.jsp");  
                    rd.include(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }else if (dapat.toString().equals("Batal")) {
                try {
                    RequestDispatcher rd=request.getRequestDispatcher("indexbrg.jsp");  
                    rd.include(request, response);  
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
