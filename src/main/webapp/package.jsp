<%--
  Created with IntelliJ IDEA.
  User: Texin D. Otinguey
  Date: May 08, 2021 / 0008
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Travel Packages</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="javascript/package.js"></script>
    <style>
        td, th {
            text-align: left;
            padding: 15px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>

<table id="travel-packages-table" class="table">
    <thead class="table-dark">
        <tr>
            <th>Package Name</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Description</th>
            <th>Base Price</th>
            <th>Agency Commission</th>
            <th></th>
        </tr>
    </thead>

</table>

<div class="container">
    <form id="TravelPackageForm" onsubmit="AddTravelPackage()">
        <div class="d-flex flex-column col-12 col-md-6 m-auto">
            <h2 class="text-center">Add New Travel Package</h2>
            <input class="form-control m-2 p-2" type="text" name="PkgName" placeholder="Package Name">
            <input class="form-control m-2 p-2" type="date" required pattern="\d{4}-\d{2}-\d{2}" name="PkgStartDate" placeholder="Start Date">
            <input class="form-control m-2 p-2" type="date" required pattern="\d{4}-\d{2}-\d{2}" name="PkgEndDate" placeholder="End Date">
            <textarea class="form-control m-2 p-2" name="PkgDesc" placeholder="Description" maxlength="50"></textarea>
            <input class="form-control m-2 p-2" type="number" min="0" pattern="[0-9]+([\.,][0-9]+)?" name="PkgBasePrice" placeholder="Base Price">
            <input class="form-control m-2 p-2" type="number" min="0" pattern="[0-9]+([\.,][0-9]+)?" name="PkgAgencyCommission" placeholder="Agency Commission">
            <button id="btnSubmit" class="btn btn-primary m-2 p-2" type="submit">Submit</button>
            <div id="statusMessage" class="form-control m-2 p-2"></div>
        </div>
    </form>
</div>

</body>
</html>
