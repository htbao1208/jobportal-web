<%-- 
    Document   : profile
    Created on : Dec 14, 2021, 10:11:43 PM
    Author     : kid03
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:url value="/company/post" var="action"/>
<div class="container">
    <form:form class="" method="post" action="${action}" modelAttribute="job">        

        <div class="form-group">
            <form:input type="text" id="title" path="title" class="form-control form-control-lg" />
            <label class="form-label" for="title">Tên bài tuyển</label>
        </div>

        <div class="form-group">
            <form:textarea id="description" path="description" class="form-control form-control-lg" />
            <label class="form-label" for="description">Mô tả công việc</label>
        </div>
        <div class="form-group">
            <form:select class="form-control" id="jobtype" path="jobType">
                <form:option value="Thực tập" label="Thực tập" />
                <form:option value="Part-time" label="Part-time"/>
                <form:option value="Full-time" label="Full-time"/>
            </form:select>
            <label class="form-label" for="jobType">Loại công việc</label>
        </div>
        <div class="form-group">
            <form:input type="text" id="address" path="address" class="form-control form-control-lg" />
            <label class="form-label" for="address">Địa chỉ</label>
        </div>
            <div class="form-group">
            <form:input type="text" id="exp" path="exp" class="form-control form-control-lg" />
            <label class="form-label" for="exp">exp</label>
        </div>
         <div class="form-group">
            <form:input type="text" id="salary" path="salary" class="form-control form-control-lg" />
            <label class="form-label" for="salary">Lương</label>
        </div>
        <!--<div class="form-group">-->
        <%--<form:input type="file" id="file" path="file" class="form-control form-control-lg" />--%>
        <!--<label class="form-label" for="file">Logo</label>-->
        <!--</div>-->
        


        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" value="Add"/>
        </div>


    </form:form>
</div>



