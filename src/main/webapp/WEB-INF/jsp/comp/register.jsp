<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/comp-register" var="action"/>

<section class="vh-100 bg-image" style="background-image: url('https://mdbootstrap.com/img/Photos/new-templates/search-box/img4.jpg');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px; margin-top: 20px; margin-bottom: 20px;">
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Create an account</h2>

                            <form:form class="register-form" method="post" action="${action}"  modelAttribute="user"  enctype="multipart/form-data">

                                <div class="form-outline mb-4">
                                    <form:input type="text" id="username" path="username" class="form-control form-control-lg" />
                                    <label class="form-label" for="username">Username</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <form:input type="email" id="email" path="email" class="form-control form-control-lg" />
                                    <label class="form-label" for="email">Email</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <form:input type="password" id="password" path="password" class="form-control form-control-lg" />
                                    <label class="form-label" for="password">Password</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <form:input type="password" id="confirmPassword" path="confirmPassword" class="form-control form-control-lg" />
                                    <label class="form-label" for="confirmPassword">Confirm Password</label>
                                </div>
                                    
                                <div class="d-flex justify-content-center">
                                    <input type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" value="Sign Up"/>
                                </div>

                                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="<c:url value="/seeker-login"/>" class="fw-bold text-body"><u>Sign in here</u></a></p>

                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
