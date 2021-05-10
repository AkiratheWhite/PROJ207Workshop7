<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Agent</title>
    <%@include file="../partials/bootsrap_jquery.jsp"%>
</head>
<body>

<div class="container py-4">
    <h2 class="text-center">Add New Agent</h2>
    <%@include file="./components/AgentForm.jsp"%>
    <div class="d-flex justify-content-center">
        <a href="${pageContext.request.contextPath}/agent/">
            <button class="btn btn-secondary">Back to List</button>
        </a>
    </div>
</div>

<script>
    function HandleSubmit(event) {
        event.preventDefault();
        $("#btnSubmit").attr("disabled", "");
        $("#btnSubmit").removeAttr("type");

        const formData = $("#AgentForm").serializeArray();

        var formObject = {};

        for (let i = 0; i < formData.length; i++){
            formObject[formData[i]['name']] = formData[i]['value'];
        }

        const formJSON = JSON.stringify(formObject)

        $.ajax({
            type: "POST",
            url: "http://localhost:8080/Workshop_7_war_exploded/api/agent",
            data: formJSON,
            dataType: "text",
            contentType: "application/json",
            beforeSend: function() { $("#statusMessage").html("Awaiting response...")},
            success: function(data) { $("#statusMessage").html(data);
                window.location.replace("${pageContext.request.contextPath}/agent/");
            },
            error: function(data) { $("#statusMessage").html(data);}
        });
    }
</script>
</body>
</html>
