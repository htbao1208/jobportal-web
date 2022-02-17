<%-- 
    Document   : profile
    Created on : Dec 14, 2021, 10:11:43 PM
    Author     : kid03
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:url value="/seeker/addCV" var="action"/>
<div class="container">
    <form:form method="post" action="${action}" modelAttribute="cv">  
        <div class="form-group">
            <label class="form-label" for="title">Title</label>
            <form:input type="text" path="title" class="form-control form-control-lg" />            
        </div>
        <div class="form-group">
            <label class="form-label">Content</label>
            <form:input type="text" path="content" class="form-control form-control-lg" />
        </div>
        <div class="form-group">
            <label class="form-label" >Career</label>
            <form:select class="form-control" path="career">
                <c:forEach items="${careers}" var="c">
                    <form:option value="${c.id}" >${c.name}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="form-group">
            <label class="form-label">Min salary</label>
            <form:input type="text" path="minSalary" class="form-control form-control-lg" />
        </div>
        <div class="form-group">
            <label class="form-label">Max salary</label>
            <form:input type="text" path="maxSalary" class="form-control form-control-lg" />
        </div>
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" value="Cập nhật"/>
        </div>


    </form:form>
</div>

