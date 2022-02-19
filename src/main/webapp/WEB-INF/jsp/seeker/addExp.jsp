<%-- 
    Document   : profile
    Created on : Dec 14, 2021, 10:11:43 PM
    Author     : kid03
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:url value="/seeker/experience" var="action"/>
<div class="container">
    <form:form method="post" action="${action}" modelAttribute="experience">  
        <div class="form-group">
            <label class="form-label">Job name</label>
            <form:input type="text" path="jobName" class="form-control form-control-lg" />            
        </div> 
        <div class="form-group">
            <label class="form-label">Job experience</label>
            <form:select class="form-control" path="yearExp">
                <form:option value="Less than 1 year">Less than 1 year</form:option>
                <form:option value="1 - 2 years">1 - 2 years</form:option>
                <form:option value="2 - 3 years">2 - 3 years</form:option>
                <form:option value="3 - 5 years">3 - 5 years</form:option>
                <form:option value="More than 5 years">More than 5 years</form:option>
            </form:select>       
        </div> 
        <div class="form-group">
            <label class="form-label">Enterprise name</label>
            <form:input type="text" path="company" class="form-control form-control-lg" />            
        </div> 
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" value="Update"/>
        </div>
    </form:form>
</div>

