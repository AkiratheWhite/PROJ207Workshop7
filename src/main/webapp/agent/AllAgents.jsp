<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2021-05-09
  Time: 2:23 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Agents</title>
    <%@include file="../partials/bootsrap_jquery.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/agent/js/AllAgents.js"></script>
</head>
<body>
    <div class="container py-4">
        <div class="d-flex justify-content-around">
            <h2>All Agents</h2>
            <a href="${pageContext.request.contextPath}/agent/AddAgent">
                <button class="btn btn-primary">Add New Agent</button>
            </a>
        </div>

        <table id="AgentTable" class="table text-center">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Agent ID</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Middle Initial</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Business Phone No.</th>
                    <th scope="col">Email</th>
                    <th scope="col">Position</th>
                    <th scope="col">Agency ID</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>

        <div id="loadingSpinner" class="d-flex justify-content-center">
            <div class="spinner-grow spinner-grow-sm mx-1" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <div class="spinner-grow spinner-grow-sm mx-1" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <div class="spinner-grow spinner-grow-sm mx-1" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>

    </div>
</body>
    <script>
        $(document).ready(() => {
            createAgentList();
        });
    </script>
</html>
