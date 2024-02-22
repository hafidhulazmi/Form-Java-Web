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
        <link rel="icon" type="image/x-icon" href="img/sup.png">
    </head>
    <body>
        <%
            String kdsupp=request.getParameter("kdsupp");
            String nmsupp=request.getParameter("nmsupp");
            String alamat=request.getParameter("alamat");
            String telp=request.getParameter("telepon");
            String norek=request.getParameter("norek");
            String bank=request.getParameter("bank");
            String dapat=request.getParameter("cmdsimpan");
            if (dapat.toString().equals("Simpan")) {
                try {
                    Connection conn;
                    conn = Koneksi.bukaKoneksi();
                    Statement st = conn.createStatement();
                    String sql="insert into supplier(kdsupp, nmsupp, alamat, telp, norek, bank)"
                    + " values('"+kdsupp+"', '"+nmsupp+"', '"+alamat+"', '"+telp+"', '"+norek+"', '"+bank+"')"; 
                    st.executeUpdate(sql);
                    conn.close();
                    RequestDispatcher rd=request.getRequestDispatcher("indexsup.jsp");  
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
                    String sql="select * from supplier where kdsupp='"+kdsupp+"'"; 
                    ResultSet rs = st.executeQuery(sql);
                    if(rs.next()){
                    String bankcari = rs.getString("bank");
        %>
        <nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand mx-51" href="index.jsp">Home</a>
            </div>
        </nav>
        <div class="mt-3">
            <p class="h2 text-center">
                Form Supplier
            </p>
        </div>
        <form method="post" action="tambahsup.jsp" class="mx-5 my-5">
            <div class="grid gap-3 mx-3 my-2">
                <label>Kode Supplier</label>
                <div class="col-8 mb-3">
                    <input class="me-4" type="number" class="form-control" name="kdsupp" value="<%=rs.getString("kdsupp")%>"  max="9999999999">
                    <input class="btn btn-secondary me-4" type="submit" value="Cari" name="cmdsimpan" style="width: 100px">
                </div>
                <label>Nama Supplier</label>
                <div class="row mb-3">
                    <div class="col-4">
                        <input type="text" class="form-control" name="nmsupp" value="<%=rs.getString("nmsupp")%>"  maxlength="20">
                    </div>
                </div>
                <label>Alamat</label>
                <div class="col-4 mb-3">
                    <textarea class="form-control" name="alamat" id="floatingTextarea2" style="height: 100px"><%=rs.getString("alamat")%></textarea>
                </div>
                <label>No. Telepon</label>
                <div class="col-4 mb-3">
                    <input type="text" class="form-control" name="telepon" value="<%=rs.getString("telp")%>" >
                </div>
                <label>No. Rekening</label>
                <div class="col-8 mb-3">
                    <input class="me-4" type="number" class="form-control" name="norek" value="<%=rs.getString("norek")%>"  max="999999999999999">
                </div>
                <label>Bank</label>
                <div class="col-4 mb-3">
                    <select class="form-select" name="bank" >
                        <option 
                            <% 
                                if(bankcari.equals("BCA")){
                                    %>selected<%
                                }
                            %>
                            value="BCA">BCA</option>
                        <option 
                            <% 
                                if(bankcari.equals("MANDIRI")){
                                    %>selected<%
                                }
                            %>
                            value="MANDIRI">MANDIRI</option>
                        <option 
                            <% 
                                if(bankcari.equals("BNI")){
                                    %>selected<%
                                }
                            %>
                            value="BNI">BNI</option>
                    </select>
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
                <th>Kode Supplier</th>
                <th>Nama Supplier</th>
                <th>Alamat</th>
                <th>No. Telepon</th>
                <th>No. Rekening</th>
                <th>Bank</th>
            </tr>
            <%
                try{
                    String sql1="select * from supplier";
                    ResultSet rs1 = st.executeQuery(sql1);
                    Integer i=1;
                    while (rs1.next()) {
                    %>
            <tr>
                <td><% out.print(i); %></td>
                <td><% out.print(rs1.getString("kdsupp")); %></td>
                <td><% out.print(rs1.getString("nmsupp")); %></td>
                <td><% out.print(rs1.getString("alamat")); %></td>
                <td><% out.print(rs1.getString("telp")); %></td>
                <td><% out.print(rs1.getString("norek")); %></td>
                <td><% out.print(rs1.getString("bank")); %></td>
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
        <%
                    }
                } catch (Exception e) {
                    out.print(e);
                }
            }else if (dapat.toString().equals("Ubah")) {
                try {
                    String sql1="update supplier set ";
                    if(kdsupp!=null){
                    sql1=sql1+"nmsupp='"+nmsupp+"' ";
                    sql1=sql1+", alamat='"+alamat+"'";
                    sql1=sql1+", telp='"+telp+"'";
                    sql1=sql1+", norek='"+norek+"'";
                    sql1=sql1+", bank='"+bank+"'";
                    sql1=sql1+" where kdsupp='"+kdsupp+"'";
                    Connection conn;
                    conn= Koneksi.bukaKoneksi();
                    Statement st = conn.createStatement();
                    st.executeUpdate(sql1);
                    conn.close();
                    %>
                    
                    <%
                    RequestDispatcher rd=request.getRequestDispatcher("indexsup.jsp");  
                    rd.include(request, response);
                    }else{
                        %>
                        
                                                    <%
                        RequestDispatcher rd=request.getRequestDispatcher("indexsup.jsp");  
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
                    String sql1="delete from supplier where kdsupp='"+kdsupp+"'"; 
                    st.executeUpdate(sql1);
                    conn.close();
                    RequestDispatcher rd=request.getRequestDispatcher("indexsup.jsp");  
                    rd.include(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }else if (dapat.toString().equals("Batal")) {
                try {
                    RequestDispatcher rd=request.getRequestDispatcher("indexsup.jsp");  
                    rd.include(request, response);  
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
