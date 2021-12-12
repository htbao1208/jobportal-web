<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="vh-100 bg-image" style="background-image: url('https://mdbootstrap.com/img/Photos/new-templates/search-box/img4.jpg');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px; margin-top: 20px; margin-bottom: 20px;">
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Đăng nhập</h2>
                            <form>                
                                <div class="form-outline mb-4">
                                    <input type="text" id="form3Example3cg" class="form-control form-control-lg" />
                                    <label class="form-label" for="form3Example3cg">Username</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" id="form3Example4cg" class="form-control form-control-lg" />
                                    <label class="form-label" for="form3Example4cg">Password</label>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <button type="button" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Login</button>
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
