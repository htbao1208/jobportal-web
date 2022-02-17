<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/login" var="action"/>
<section class="vh-100 bg-image" style="background-image: url('https://mdbootstrap.com/img/Photos/new-templates/search-box/img4.jpg');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px; margin-top: 20px; margin-bottom: 20px;">
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Đăng nhập</h2>
                            <form method="POST" action="${action}">                
                                <div class="form-outline mb-4">
                                    <input type="text" id="username" name="username" class="form-control form-control-lg" />
                                    <label class="form-label" for="username">Tên đăng nhập</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" id="password" name="password" class="form-control form-control-lg" />
                                    <label class="form-label" for="password">Password</label>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 

                                <div class="d-flex justify-content-center">
                                    <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Login</button>
                                </div>
                                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="<c:url value="/seeker-register"/>" class="fw-bold text-body"><u>Register here</u></a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
