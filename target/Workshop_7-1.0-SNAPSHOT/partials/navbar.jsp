<%--
  Created by IntelliJ IDEA.
  User: 860977
  Date: May 13, 2021 / 0013
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid justify-content-between">
            <!-- Left elements -->
            <div class="d-flex">
                <!-- Brand -->
                <a class="navbar-brand me-2 mb-1 d-flex align-items-center fs-1 fst-italic fw-bolder" href="${pageContext.request.contextPath}">
                    Travel  <b>Experts</b>
                </a>
            </div>
            <!-- Left elements -->

            <!-- Right elements -->
            <ul class="navbar-nav flex-row">
                <li class="nav-item me-3 me-lg-1">
                    <a class="nav-link d-sm-flex align-items-sm-center" href="#">
                        <strong class="d-none d-sm-block ms-1"><i class="bi bi-person-circle fs-3"></i> Hello, <i>User!</i></strong>
                    </a>
                </li>
            </ul>
            <!-- Right elements -->
        </div>
    </nav>
</body>
</html>
