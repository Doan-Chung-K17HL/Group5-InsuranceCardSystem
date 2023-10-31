<%-- 
    Document   : Admin_blog_dashboard
    Created on : Oct 2, 2023, 7:46:10 PM
    Author     : chun
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- bootstrap5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

        <!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-
              iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/Zpi
              Bw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- bootstrap5 5icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <link rel="stylesheet" href="CSS/admin_blog_dashboard.css"/>
        <style>
            .pagination {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;
}

.pagination a {
    text-decoration: none;
    padding: 5px 10px;
    margin: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    color: #333;
}

.current-page {
    background-color: #333; /* Màu nền của trang hiện tại khi được chọn */
    color: #fff; /* Màu chữ của trang hiện tại khi được chọn */
    
}

.pagination a:hover {
    background-color: #333;
    color: #fff;
}


        </style>
    </head>
    <body>

        <!--header-->
        <jsp:include page="Part/header.jsp"></jsp:include>


            <!--sidebar-->
        <jsp:include page="Part/sidebar_vip.jsp"></jsp:include>





            <!-- ---------------------------------------------------------------------------------------------------------------------------- -->



            <div class="container-fluid">
                <div class="row">
                    <div class="col min-vh-100 p-4">
                        <div class="container mt-5">

                            <div class="my-row row">

                                <!-- Column 1: Blog Post Table -->
                                <div class="my-column1 col-md-8">
                                    <h2 style="display: inline-block;">Danh sách người dùng</h2>
                                    <!--                                    go to blog page-->
                                    <button class="btn btn-success mb-3 " style="margin-left: 200px" >
                                        <a href="admin_Staff_list" style="text-decoration: none; color: #fff;">Danh sách nhân viên</a>
                                    </button>
                                    <form action="admin_Users_search" method="post" class="form-inline my-2 my-lg-0">
                                        <div class="input-group input-group-sm">
                                            <input value ="${txtname}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-secondary btn-number">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>

                                </form>
                                
                                <!-- Blog Post Table -->
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Họ Tên</th>
                                            <th>Ngày sinh</th>
                                            <th>Địa chỉ</th>
                                            <th>Số điện thoại</th>
                                            <th>Ảnh</th>
                                            <th>Vai trò</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Example row, you can use a loop to generate rows dynamically -->
                                        <c:forEach items="${listU}" var="o">
                                            <tr>
                                                <td>${o.getUser_fullName()}</td>
                                                <td>${o.getUser_dob()}</td>
                                                <td>${o.getUser_address()}</td>
                                                <td>${o.getUser_phoneNum()}</td>
                                                <td> <img src="${o.getUser_image()}" width="60px" height="60px"> </td>
                                                <td>${o.getUser_role()}</td>
                                                <td>
                                                    <a href="admin_Users_detail?id=${o.getUser_id()} " class="my-btn btn btn-primary">Chi tiết</a>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <!-- Repeat rows for each blog post -->
                                        
                                    </tbody>
                                    
                                </table>
                                <c:set var="page" value="${requestScope.page}"/>
<div class="pagination">
    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
        <c:set var="currentPage" value="${i == page}"/>
        <a href="admin_Users_list?page=${i}" class="${currentPage ? 'current-page' : ''}">${i}</a>
    </c:forEach>
</div>



                            </div>

                            <!-- Column 2: Edit History Table -->
                            <div class="my-column1 col-md-4">
                                <h2 style="display: inline-block;">Người dùng mới</h2>
                                <!-- togler -->

                                <!-- Edit History Table -->
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Họ Tên</th>
                                            <th>Ngày sinh</th>
                                            <th>Ảnh</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Example edit history rows, you can use a loop to generate rows dynamically -->
                                        <c:forEach items="${listNU}" var="o">
                                            <tr>
                                                <td>${o.getUser_fullName()}</td>
                                                <td>${o.getUser_dob()}</td>
                                                <td> <img src="${o.getUser_image()}" width="60px" height="60px"> </td>
                                            </tr>
                                        </c:forEach>

                                        <!-- Repeat rows for each edit history entry -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>






        <!-- quan trong cua dropdowntable -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>
</html>
