/**
 * Method to make a GET request to the API resource and populate the table.
 */
const createAgentList = () => {
    $("#AgentTable tbody").empty(); //Removes all children, if the exist.

    fetch("http://localhost:8080/Workshop_7_war_exploded/api/agent", {
        method: 'GET'
    }).then(response => response.json()).then(data => {
        for(let i=0; i<data.length; i++) {
            const currentItem = data[i]; // Gets current JSON object.
            const currentKeys = Object.keys(currentItem); //Gets all keys for the current JSON object.
            const newRow = document.createElement("tr"); //Creates a new table row node.

            for(let j=0; j<currentKeys.length; j++) {
                const newColumn = document.createElement('td'); //Creates a new table column node.
                newColumn.innerHTML = currentItem[currentKeys[j]]; //Gets value corresponding to the key (property).
                newRow.appendChild(newColumn) //Adds the column to the new row.
            }

            //Adds action buttons in the last column.
            const actionColumn = document.createElement('td');
            const editAnchor = document.createElement("a");
            const btnEdit = document.createElement("button");
            const btnDel = document.createElement("button");

            //Adds text and CSS Styling.
            btnEdit.innerText = "Edit";
            btnDel.innerText = "Delete";
            btnEdit.setAttribute('class', 'btn btn-primary mx-1 btnEdit');
            btnDel.setAttribute('class', 'btn btn-danger mx-1 btnDelete');

            editAnchor.appendChild(btnEdit);
            editAnchor.setAttribute('href', `http://localhost:8080/Workshop_7_war_exploded/agent/EditAgent/${currentItem[currentKeys[0]]}`);
            //Adds the URI needed for the delete method to work.
            btnDel.setAttribute('data-uri', `http://localhost:8080/Workshop_7_war_exploded/api/agent/${currentItem[currentKeys[0]]}`);

            //Builds the column and adds it to the row.
            actionColumn.appendChild(editAnchor);
            actionColumn.appendChild(btnDel);
            newRow.appendChild(actionColumn);

            $("#AgentTable tbody").append(newRow); //Adds the new row to the agent table.
        }

        //Adds event listeners to all the delete buttons.
        $(".btnDelete").on("click", () => {
            DeleteAgent(event);
        });

        $("#loadingSpinner").remove(); //Removes the loading symbol from the webpage.
    }).catch((error) => {
        console.error('Error:', error);
    })
}

/**
 * Method to send a DELETE request to the API.
 * @param event Event created by clicking on a delete button.
 * @constructor
 */
const DeleteAgent = (event) => {
    const btnDelete = event.target;

    //If the user confirms the delete, then a DELETE request is sent to the server.
    if (confirm("Are you sure you want to delete this entry?")) {
        $.ajax({
            type: "DELETE",
            url: btnDelete.getAttribute('data-uri'),
            dataType: "text",
            success: function(data) {
                //Alerts the user of the result of the DELETE request, and refreshes the list.
                alert(data);
                createAgentList();
            }
        });
    }

    else {} //Do nothing if the user cancels the delete request.
}