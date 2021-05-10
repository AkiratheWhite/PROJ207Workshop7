<%--
  Created by IntelliJ IDEA.
  User: Chester
  Date: 5/10/2021
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Customer</title>
    <%@include file="../partials/bootsrap_jquery.jsp"%>
</head>
<body>

<div class="container py-4">
    <h2 class="text-center">Add New Customer</h2>
    <%@include file="components/CustomerForm.jsp"%>
    <div class="d-flex justify-content-center">
        <a href="${pageContext.request.contextPath}/customer/">
            <button class="btn btn-secondary">Back to list</button>
        </a>
    </div>
</div>

<script>
    function HandleSubmit(event){
        event.preventDefault();
        $("#btnSubmit").attr("disabled", "");
        $("#btnSubmit").removeAttr("type");
        const formData = $("#CustomerForm").serializeArray();
        var formObject = {};

        for(let i = 0; i<formData.length; i++){
            formObject[formData[i]['name']] = formData[i]['value'];
        }

        const formJSON = JSON.stringify(formObject)

        $.ajax({
            type: "POST",
            url: "http://localhost:8080/Workshop_7_war_exploded/api/customer/",
            data: formJSON,
            dataType: "text",
            contentType: "application/json",
            beforeSend: function() { $("#statusMessage").html("Awaiting response...")},
            success: function(data) { $("#statusMessage").html(data);
                window.location.replace("${pageContext.request.contextPath}/customer/");
        },
        error: function (data){$("#statusMessage").html(data);}
        });
    }
</script>
</body>
</html>
