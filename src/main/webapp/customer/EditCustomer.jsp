<%--
  Created by IntelliJ IDEA.
  User: Chester
  Date: 5/10/2021
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Customer</title>
    <%@include file="../partials/boostrap_jquery.jsp"%>
</head>
<body>
<%@include file="../partials/navbar.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-auto bg-light sticky-top">
            <div class="d-flex flex-sm-column flex-row flex-nowrap bg-light align-items-center sticky-top">
                <ul class="nav nav-pills nav-flush flex-sm-column flex-row flex-nowrap mb-auto mx-auto text-center align-items-center">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}" class="nav-link active py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Home">
                            <i class="bi-house fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/agent/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Agents">
                            <i class="bi bi-person fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/bookingdetails/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Booking Details">
                            <i class="bi bi-journal fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/travel-package/" class="nav-link py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Travel Packages">
                            <i class="bi bi-table fs-1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/" class="nav-link active py-3 px-2" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Customers">
                            <i class="bi-people fs-1"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm p-3 min-vh-100">
            <div class="container py-4">
                <h2 class="text-center">Edit Customer</h2>
                <%@include file="./components/CustomerForm.jsp"%>
                <div class="d-flex justify-content-center">
                    <a href="${pageContext.request.contextPath}/customer/">
                        <button class="btn btn-secondary">Back to List</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    let customerId;

    $(document).ready(() => {
        const url_string = window.location.href
        const position = url_string.lastIndexOf("/")
        const CustomerID = url_string.substring(position+1, url_string.length)
        //console.log("Customer ID: "+CustomerID);

        fetch("http://localhost:8080/Workshop_7_war_exploded/api/customer/"+CustomerID, {
            method: 'GET'
        }).then(response => response.json()).then(data => {
            customerId = data['CustomerId']
            const values = Object.keys(data)
            for(let i=0; i<values.length; i++) {

                //console.log("Values "+ values[i] + " - " +data[values[i]])
                //console.log($("input[name="+values[i]+"]"));

                //$("#"+values[i]).val(data[values[i]])//retrieve data by Id value
                $("input[name="+values[i]+"]").val(data[values[i]])//retrieve data by name value
            }
        });
    });

    //function HandleSubmit(event) {
    function HandleSubmitCustomer(event) {
        event.preventDefault();
        $("#btnSubmit").attr("disabled", "");
        $("#btnSubmit").removeAttr("type");
        const formData = $("#CustomerForm").serializeArray();
        formData.push({'name': 'CustomerId', 'value': customerId.toString()});

        let formObject = {};

        for (let i = 0; i < formData.length; i++){
            formObject[formData[i]['name']] = formData[i]['value'];
        }
        const formJSON = JSON.stringify(formObject)

        $.ajax({
            type: "PUT",
            url: "http://localhost:8080/Workshop_7_war_exploded/api/customer/"+customerId.toString(),
            data: formJSON,
            dataType: "text",
            contentType: "application/json",
            beforeSend: function() { $("#statusMessage").html("Awaiting response...")},
            success: function(data) { $("#statusMessage").html(data);
                window.location.replace("${pageContext.request.contextPath}/customer/");
            },
            error: function(data) { $("#statusMessage").html(data);}
        });

    }//function HandleSubmit
</script>
</body>
</html>
