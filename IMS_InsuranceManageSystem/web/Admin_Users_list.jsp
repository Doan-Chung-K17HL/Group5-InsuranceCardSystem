<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/admin_insuranceProduct_dashboard.css">
    <title>Admin Panel</title>

    <!-- bootstrap -->

    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script> -->

    <!-- BOOTSTRAP5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

    <!-- boxicon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>

<body>

    <!-- side menu  -->
    <div class="side-menu">
        <div class="brand-name">
            <!-- <h1>Brand</h1> -->
        </div>
        <ul class="side-container">
            <li class="side-item"><img src="Image/dashboard (2).png" alt="">&nbsp; <span>Dashboard</span> </li>
            <li class="side-item"><img src="Image/reading-book (1).png" alt="">&nbsp;<span>Manage Users</span> </li>
            <li class="side-item"><img src="Image/teacher2.png" alt="">&nbsp;<span>Manage Staffs</span> </li>
            <li class="side-item"><img src="Image/school.png" alt="">&nbsp;<span>Manage Blogs</span> </li>
            <li class="side-item"><img src="Image/school.png" alt="">&nbsp;<span>Manage Insurance Product</span> </li>
        </ul>
    </div>



    <div class="my-container" id="my-container">
        
        <!--heaedr-->
        <jsp:include page="Part/header.jsp"></jsp:include>
        
        <div class="content">
            <div class="my-cards">
                <!-- number of users -->
                <div class="my-card">
                    <div class="my-box">
                        <h1>2194</h1>
                        <h3>Users</h3>
                    </div>
                    <div class="icon-case">
                        <img src="Image/students.png" alt="">
                    </div>
                </div>
                <!-- num of staffs -->
                <div class="my-card">
                    <div class="my-box">
                        <h1>53</h1>
                        <h3>Staffs</h3>
                    </div>
                    <div class="icon-case">
                        <img src="Image/teachers.png" alt="">
                    </div>
                </div>
                <!-- num of insurance product -->
                <div class="my-card">
                    <div class="my-box">
                        <h1>5</h1>
                        <h3>Contracts</h3>
                    </div>
                    <div class="icon-case">
                        <img src="Image/schools.png" alt="">
                    </div>
                </div>
                <!-- num of blogs -->
                <div class="my-card">
                    <div class="my-box">
                        <h1>18</h1>
                        <h3>Blogs</h3>
                    </div>
                    <div class="icon-case">
                        <img src="Image/income.png" alt="">
                    </div>
                </div>
            </div>

            <!-- list user -->
            <div class="content-2">

                <div class="my-list1">
                    <div class="my-list-title">
                        <h2>List Insurance Product</h2>
                        <!-- add new area -->
                        <a href="#" class="my-btn btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                            data-bs-whatever="@getbootstrap">Add</a>
                    </div>
                    <table>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                </tr>
                                
                                
                            <c:forEach items="${listIP}" var="o">
                                <tr>
                                    <td>${o.getIp_id()}</td>
                                    <td>${o.getIp_name()}</td>
                                    <td>
                                        <a href="admin_IP_detail?ip_id=${o.getIp_id()} " class="my-btn btn btn-primary">Detail</a>
                                        
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                </div>


                <!-- -------------------------------------------------------------------------------------------------------------------------- -->
                <div class="new-students">
                    <div class="my-list-title">
                        <h2>New Users</h2>
                        <a href="#" class="my-btn btn btn-secondary">View All</a>
                    </div>
                    <table>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            
                        </tr>
                        <tr>
                            
                        </tr>
                        <tr>
                            
                        </tr>
                        <tr>
                            
                        </tr>
                        <tr>
                            
                        </tr>

                    </table>
                </div>
            </div>
        </div>
    </div>
        
        
        
        
</body>
<!--                     form add new user 
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="admin_IP_add" method="get">
                         modal header 
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add Insurance Product</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                         modal body 
                        <div class="modal-body">

                            <div class="mb-3">
                                <label for="recipient-name" class="col-form-label">Type:</label>
                                <input type="text" class="form-control" id="recipient-name" name="ip_type">
                            </div>
                            <div class="mb-3">
                                <label for="message-text" class="col-form-label">Name:</label>
                                <textarea class="form-control" id="message-text" name="ip_name"></textarea>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" >Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

                 form show detail user 
                <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="admin_IP_add" method="get">
                         modal header 
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Insurance Product Detail</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                         modal body 
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="recipient-name" class="col-form-label">ID:</label>
                                <input type="text" class="form-control" id="recipient-name" name="ip_type">
                            </div>
                            <div class="mb-3">
                                <label for="recipient-name" class="col-form-label">Type:</label>
                                <input type="text" class="form-control" id="recipient-name" name="ip_type">
                            </div>
                            <div class="mb-3">
                                <label for="message-text" class="col-form-label">Name:</label>
                                <textarea class="form-control" id="message-text" name="ip_name"></textarea>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>

                 form edit detail user 
                <div class="modal fade" id="my-modal-edit" tabindex="-1" aria-labelledby="exampleModalLabe2"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                             modal header 
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Edit Detail</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                             modal body 
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="recipient-name" class="col-form-label">Insurance product name</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">Insurance product type:</label>
                                        <textarea class="form-control" id="message-text"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Send message</button>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
            let data;
        let JsonData;
            
            function detail(id){
                 var xhr = new XMLHttpRequest();          //duong truyen
                                       xhr.open("GET", "admin_IP_detail", true);        // mo ra duong truyen ve phuong thuc get ve trang servlet
                                       xhr.onreadystatechange = function () {           //lay du lieu tu servlet
                                           if (xhr.readyState === 4 && xhr.status === 200) {
                                                   JsonData = xhr.responseText;
                                                   data = JSON.parse(xhr.responseText);
                                                   document.getElementById("ip_id").value = data.ip_id;
                                                   document.getElementById("ip_type").value = data.ip_type;
                                                   document.getElementById("ip_name").value = data.ip_name;
                                               }
                                           };
                                           xhr.send(id);  //truyen ve servlet
            }
        </script>  -->
</html>