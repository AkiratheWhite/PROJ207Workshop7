<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Agent</title>
    <%@include file="../partials/bootsrap_jquery.jsp"%>
</head>
<body>

<div class="container py-4">
    <h2 class="text-center">Edit Agent</h2>
    <%@include file="./components/AgentForm.jsp"%>
    <div class="d-flex justify-content-center">
        <a href="${pageContext.request.contextPath}/agent">
            <button class="btn btn-secondary">Back to List</button>
        </a>
    </div>
</div>

<script>
    var agentId; //Globally scoped variable to store AgentId

    $(document).ready(() => {
        const url_string = window.location.href;
        const position = url_string.lastIndexOf("/");
        const AgentID = url_string.substring(position+1, url_string.length);

        fetch("http://localhost:8080/Workshop_7_war_exploded/api/agent/"+AgentID, {
            method: 'GET'
        }).then(response => response.json()).then(data => {
            agentId = data['AgentId'];
            const values = Object.keys(data);
            for(let i=0; i<values.length; i++) {
                $("#"+values[i]).val(data[values[i]]);
                console.log("Values:" + values[i])
                console.log("Data:" + data[values[i]])
            }
        });
    });

    function HandleSubmit(event) {
        event.preventDefault();
        $("#btnSubmit").attr("disabled", "");
        $("#btnSubmit").removeAttr("type");

        const formData = $("#AgentForm").serializeArray();
        formData.push({'name': 'AgentId', 'value': agentId.toString()});

        var formObject = {};

        for (let i = 0; i < formData.length; i++){
            formObject[formData[i]['name']] = formData[i]['value'];
        }

        const formJSON = JSON.stringify(formObject)

        $.ajax({
            type: "PUT",
            url: "http://localhost:8080/Workshop_7_war_exploded/api/agent/"+agentId.toString(),
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
