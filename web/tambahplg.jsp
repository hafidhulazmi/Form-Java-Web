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
        <title>Input Pelanggan</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="icon" type="image/x-icon" href="img/cust.png">
    </head>
    <body>
        <%
            String kdplg=request.getParameter("kdplg");
            String nmplg=request.getParameter("nmplg");
            String alamat=request.getParameter("alamat");
            String telp=request.getParameter("telepon");
            String dapat=request.getParameter("cmdsimpan");
            if (dapat.toString().equals("Simpan")) {
                try {
                    Connection conn;
                    conn = Koneksi.bukaKoneksi();
                    Statement st = conn.createStatement();
                    String sql="insert into pelanggan(kdplg, nmplg, alamat, telp)"
                    + " values('"+kdplg+"', '"+nmplg+"', '"+alamat+"', '"+telp+"')"; 
                    st.executeUpdate(sql);
                    conn.close();
                    RequestDispatcher rd=request.getRequestDispatcher("indexplg.jsp");  
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
                    String sql="select * from pelanggan where kdplg='"+kdplg+"'"; 
                    ResultSet rs = st.executeQuery(sql);
                    if(rs.next()){
        %>
        <nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand mx-51" href="index.jsp">Home</a>
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
                    <input class="me-4" type="number" class="form-control" name="kdplg" value="<% out.print(rs.getString("kdplg")); %>">
                    <input class="btn btn-secondary me-4" type="submit" value="Cari" name="cmdsimpan" style="width: 100px">
                </div>
                <label>Nama Pelanggan</label>
                <div class="col-8 mb-3">
                    <input type="text" class="form-control" name="nmplg" value="<% out.print(rs.getString("nmplg")); %>">
                </div>
                <label>Alamat</label>
                <div class="col-4 mb-3">
                    <textarea class="form-control" name="alamat" id="floatingTextarea2" style="height: 100px"><% out.print(rs.getString("alamat")); %></textarea>
                </div>
                <label>No. Telepon</label>
                <div class="col-4 mb-3">
                    <input type="text" class="form-control" name="telepon" value="<% out.print(rs.getString("telp")); %>">
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
                <th>Kode Pelanggan</th>
                <th>Nama Pelanggan</th>
                <th>Alamat</th>
                <th>No. Telepon</th>
            </tr>
            <%
                try{
                    String sql1="select * from pelanggan";
                    Statement st1 = conn.createStatement();
                    ResultSet rs1 = st1.executeQuery(sql);
                    Integer i=1;
                    while (rs1.next()) {
                    %>
            <tr>
                <td><% out.print(i); %></td>
                <td><% out.print(rs1.getString("kdplg")); %></td>
                <td><% out.print(rs1.getString("nmplg")); %></td>
                <td><% out.print(rs1.getString("alamat")); %></td>
                <td><% out.print(rs1.getString("telp")); %></td>
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
                    String sql1="update pelanggan set ";
                    if(kdplg!=null){
                    sql1=sql1+"nmplg='"+nmplg+"' ";
                    sql1=sql1+", alamat='"+alamat+"'";
                    sql1=sql1+", telp='"+telp+"'";
                    sql1=sql1+" where kdplg='"+kdplg+"'";
                    Connection conn;
                    conn= Koneksi.bukaKoneksi();
                    Statement st = conn.createStatement();
                    st.executeUpdate(sql1);
                    conn.close();
                    %>
                    
                    <%
                    RequestDispatcher rd=request.getRequestDispatcher("indexplg.jsp");  
                    rd.include(request, response);
                    }else{
                        %>
                        
                                                    <%
                        RequestDispatcher rd=request.getRequestDispatcher("indexplg.jsp");  
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
                    String sql1="delete from pelanggan where kdplg='"+kdplg+"'"; 
                    st.executeUpdate(sql1);
                    conn.close();
                    RequestDispatcher rd=request.getRequestDispatcher("indexplg.jsp");  
                    rd.include(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }else if (dapat.toString().equals("Batal")) {
                try {
                    RequestDispatcher rd=request.getRequestDispatcher("indexplg.jsp");  
                    rd.include(request, response);  
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
