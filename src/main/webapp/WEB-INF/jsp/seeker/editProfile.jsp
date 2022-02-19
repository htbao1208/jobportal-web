<%-- 
    Document   : profile
    Created on : Dec 14, 2021, 10:11:43 PM
    Author     : kid03
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:url value="/seeker/profile" var="action"/>
<div class="container">
    <form:form method="post" action="${action}" modelAttribute="seeker">  
        <div class="form-group">
            <label class="form-label" for="firstName">First name</label>
            <form:input type="text" id="firstName" path="firstName" class="form-control form-control-lg" />
        </div>

        <div class="form-group">
            <label class="form-label" for="lastName">Last name</label>
            <form:input type="text" id="lastName" path="lastName" class="form-control form-control-lg" />
        </div>

        <div class="form-group">
            <label class="form-label" for="phone">Phone</label>
            <form:input type="text" id="phone" path="phone" class="form-control form-control-lg" />
        </div>

        <div class="form-group">
            <label class="form-label" for="address">Address</label>
            <form:input type="text" id="address" path="address" class="form-control form-control-lg" />
        </div>
<!--        <div class="form-group">
            <label class="form-label" for="dob">DOB</label>
            <%--<form:input type="date" id="dob" path="dob" class="form-control form-control-lg" />--%>
        </div>-->
        <form:hidden path="id" />


        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" value="Update"/>
        </div>


    </form:form>
</div>

