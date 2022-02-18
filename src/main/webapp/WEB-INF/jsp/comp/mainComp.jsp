<%-- 
    Document   : mainProfile
    Created on : Feb 16, 2022, 1:17:45 PM
    Author     : kid03
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container p-0">
    <h1 class="h3 mb-3">Settings</h1>
    <div class="row">
        <div class="col-md-5 col-xl-4">

            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Company Settings</h5>
                </div>

                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action active" href="<c:url value="/company/mainComp"/>">
                      Infor
                    </a>
                      <a class="list-group-item list-group-item-action" href="javascript:;" onclick="updating()">
                      Password
                    </a>
                    <a class="list-group-item list-group-item-action" href="<c:url value="/company/listRecruit"/>">
                      List Recruit
                    </a>
                    <a class="list-group-item list-group-item-action" href="<c:url value="/company/listJob"/>">
                      List Job
                    </a> 
                </div>
            </div>
        </div>

        <div class="col-md-7 col-xl-8">
            <div>
                <div>

                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Infor</h5>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="text-center">
                                            <c:if test="${company != null}">
                                                <img alt="Andrew Jones" src="<c:url value="${company.logo}"/>" class="rounded-circle img-responsive mt-2" width="128" height="128">
                                            </c:if>
                                            <c:if test="${company == null}">
                                                <img alt="Andrew Jones" src="<c:url value="/images/johndoe.png"/>" class="rounded-circle img-responsive mt-2" width="128" height="128">
                                            </c:if>
                                        </div>
                                    </div>                                    
                                    <div class="col-md-8">
                                        <c:if test="${company != null}">
                                        <div class="form-group">
                                            <label for="name">Company name: </label>                                            
                                            <label for="name" class="float-right">${company.compName}</label>
                                        </div>
                                        <div class="form-group">
                                            <label for="dob">Website: </label>                                            
                                            <label for="dob" class="float-right">${company.website}</label>
                                        </div>                                        
                                        <div class="form-group">
                                            <label for="phone">Phone: </label>                                            
                                            <label for="phone" class="float-right">${company.phone}</label>
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address: </label>                                            
                                            <label for="address" class="float-right">${company.address}</label>
                                        </div>
                                        </c:if>                                    
                                        <c:if test="${company == null}">
                                        <div class="form-group">
                                            <label for="name">Full name: </label>                                            
                                            <label for="name" class="float-right" style="color: #888888;">Not update</label>
                                        </div>
                                        <div class="form-group">
                                            <label for="dob">DOB: </label>                                            
                                            <label for="dob" class="float-right" style="color: #888888;">Not update</label>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Phone: </label>                                            
                                            <label for="phone" class="float-right" style="color: #888888;">Not update</label>
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address: </label>                                            
                                            <label for="address" class="float-right" style="color: #888888;">Not update</label>
                                        </div>
                                        </c:if>
                                        <div class="form-group">
                                            <label for="email">Email: </label>                                            
                                            <label for="email" class="float-right">${currentUser.email}</label>
                                    </div>
                                    </div>
                                </div>

                                <a type="submit" class="btn btn-primary float-right" href="<c:url value="/company/info"/>">Update</a>
                            </form>

                        </div>
                    </div>
                </div>                
            </div>
        </div>
    </div>

</div>