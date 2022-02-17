<%-- 
    Document   : profile
    Created on : Dec 14, 2021, 10:11:43 PM
    Author     : kid03
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:url value="/seeker/education" var="action"/>
<div class="container">
    <form:form method="post" action="${action}" modelAttribute="education">  
        <div class="form-group">
            <label class="form-label">School name</label>
            <form:input type="text" path="schoolName" class="form-control form-control-lg" />            
        </div> 
        <div class="form-group">
            <label class="form-label">Degree</label>
            <form:select class="form-control" path="degree">
                <form:option value="Associate">Associate</form:option>
                <form:option value="Bachelor">Bachelor</form:option>
                <form:option value="Master ">Master</form:option>
                <form:option value="Doctor">Doctor</form:option>
            </form:select>       
        </div>
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" value="Cập nhật"/>
        </div>
    </form:form>
</div>

