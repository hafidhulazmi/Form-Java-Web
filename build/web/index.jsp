<%-- 
    Document   : index
    Created on : Dec 6, 2023, 1:15:06 PM
    Author     : hafid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>Main Page</title>
        <link rel="icon" type="image/x-icon" href="img/store.png">
    </head>
    <body>
        <p class="h1 text-center">Sistem Penjualan</p>
        <div class="row-height my-5">           
            <div class="row  d-flex justify-content-center"> 
                <div class="card text-center text-bg-secondary mx-3" style="width: 18rem;">
                  <div class="card-header">
                    Pelanggan
                  </div>
                  <img src="img/cust.png" class="card-img-top">
                  <div class="card-body">
                    <a href="indexplg.jsp" class="btn btn-primary">Tambah/Edit</a>
                  </div>
                </div>
                <div class="card text-center text-bg-success mx-3" style="width: 18rem;">
                  <div class="card-header">
                    Supplier
                  </div>
                  <img src="img/sup.png" class="card-img-top">
                  <div class="card-body">
                    <a href="indexsup.jsp" class="btn btn-primary">Tambah/Edit</a>
                  </div>
                </div>
                <div class="card text-center text-bg-secondary mx-3" style="width: 18rem;">
                  <div class="card-header">
                    Barang
                  </div>
                  <img src="img/brg.png" class="card-img-top">
                  <div class="card-body">
                    <a href="indexbrg.jsp" class="btn btn-primary">Tambah/Edit</a>
                  </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
