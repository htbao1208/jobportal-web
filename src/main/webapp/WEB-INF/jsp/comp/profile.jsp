<%-- 
    Document   : profile
    Created on : Dec 14, 2021, 10:11:43 PM
    Author     : kid03
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<c:url value="/company/info" var="action"/>
<div class="container">
    <form:form class="" method="post" action="${action}" modelAttribute="company" enctype="multipart/form-data">
        <div class="avatar-wrapper">               
            <c:if test="${company.id > 0}">
                <img src="<c:url value="${company.logo}"/>" width="200" height="200" class="profile-pic"/>
            </c:if>
            <c:if test="${company.id <= 0}">
                <img src="" class="profile-pic"/>
            </c:if>
            
            <div class="upload-button">
            </div>
            <form:input class="file-upload" type="file" path="file" accept="image/*"/>
        </div>

        <div class="form-group">
            <form:input type="text" id="compName" path="compName" class="form-control form-control-lg" />
            <label class="form-label" for="compName">Tên công ty</label>
        </div>

        <div class="form-group">
            <form:input type="text" id="website" path="website" class="form-control form-control-lg" />
            <label class="form-label" for="website">Website</label>
        </div>

        <div class="form-group">
            <form:input type="text" id="phone" path="phone" class="form-control form-control-lg" />
            <label class="form-label" for="phone">Số điện thoại</label>
        </div>

        <div class="form-group">
            <form:input type="text" id="address" path="address" class="form-control form-control-lg" />
            <label class="form-label" for="address">Địa chỉ</label>
        </div>
        <form:hidden path="id" />


        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" value="Đăng ký"/>
        </div>


    </form:form>
</div>

<script>
    $(document).ready(function () {
        var readURL = function (input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.profile-pic').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        };

        $(".file-upload").on('change', function () {
            readURL(this);
        });

        $(".upload-button").on('click', function () {
            $(".file-upload").click();
        });
    });
</script>

