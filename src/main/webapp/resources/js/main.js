/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global fetch */

function deleteApplication(id) {
    event.preventDefault();
    if(confirm("Are you sure to cancel this application?") == true){
        fetch(`/jobportal/api/listApplication/${id}`, {
            method: "delete",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if(res.status == 200) {
                let d = document.getElementById(`n${id}`);
                d.style.display = "none";
                location.reload();
            } else
                alert("Can't Delete!!!");
        });
    }
}

function deleteCV(id) {
    event.preventDefault();
    if(confirm("Are you sure to delete this CV?") == true){
        fetch(`/jobportal/api/CV/${id}`, {
            method: "delete",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if(res.status == 200) {
                alert("Press F5 to update this page.");
                let d = document.getElementById(`n${id}`);
                d.style.display = "none";
//                location.reload();
                
            } else
                alert("Can't Delete!!!");
        });
    }
}

function deleteSkill(id) {
    event.preventDefault();
    if(confirm("Are you sure to delete this skill?") == true){
        fetch(`/jobportal/api/skill/${id}`, {
            method: "delete",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if(res.status == 200) {
                alert("Press F5 to update this page.");
                let d = document.getElementById(`n${id}`);
                d.style.display = "none";
                location.reload();
                
            } else
                alert("Can't Delete!!!");
        });
    }
}