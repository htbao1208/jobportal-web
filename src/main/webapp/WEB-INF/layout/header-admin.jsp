<%-- 
    Document   : header-admin
    Created on : Feb 18, 2022, 4:37:40 PM
    Author     : kid03
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <!-- Brand/logo -->
    <a class="navbar-brand" href="#">
        <img src="<c:url value="/images/white-icon.png"/>" height="30">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#navbarResponsive">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarResponsive">

        <!-- Links -->
        <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-1">
                <a class="nav-link" href="javascript:;" onclick="updating()">User Management</a>
            </li>
            <li class="nav-item mx-1">
                <a class="nav-link" href="<c:url value="/admin/careerStats"/>">Seeker Statistics</a>
            </li>
            <li class="nav-item dropdown mx-1">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown"><span>${currentUser.username}</span></a>
                <div class="dropdown-menu dropdown-menu-center">
                    <a class="dropdown-item" href="<c:url value="/logout"/>">Log out</a>                                                   
                </div>                
            </li>
        </ul>
    </div>
</nav>