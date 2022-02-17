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
                    <h5 class="card-title mb-0">Profile Settings</h5>
                </div>

                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action active" href="<c:url value="/seeker/main"/>">
                      Account
                    </a>
                    <a class="list-group-item list-group-item-action" href="#password">
                      Password
                    </a>
                    <a class="list-group-item list-group-item-action" href="<c:url value="/seeker/listAppication"/>">
                      List Application
                    </a>
                    <a class="list-group-item list-group-item-action" href="<c:url value="/seeker/CV"/>">
                      CV
                    </a> 
                </div>
            </div>
        </div>

        <div class="col-md-7 col-xl-8">
            <div>
                <div>

                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Profile</h5>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="text-center">
                                            <img alt="Andrew Jones" src="<c:url value="${currentUser.userImg}"/>" class="rounded-circle img-responsive mt-2" width="128" height="128">
                                        </div>
                                    </div>                                    
                                    <div class="col-md-8">
                                        <c:if test="${seeker != null}">
                                        <div class="form-group">
                                            <label for="name">Full name: </label>                                            
                                            <label for="name" class="float-right">${seeker.firstName} ${seeker.lastName}</label>
                                        </div>
                                        <div class="form-group">
                                            <label for="dob">DOB: </label>                                            
                                            <label for="dob" class="float-right">${seeker.dob}</label>
                                        </div>                                        
                                        <div class="form-group">
                                            <label for="phone">Phone: </label>                                            
                                            <label for="phone" class="float-right">${seeker.phone}</label>
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address: </label>                                            
                                            <label for="address" class="float-right">${seeker.address}</label>
                                        </div>
                                        </c:if>                                    
                                        <c:if test="${seeker == null}">
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

                                <a type="submit" class="btn btn-primary float-right" href="<c:url value="/seeker/profile"/>">Update</a>
                            </form>

                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <div class="card-actions float-right">
                                <a type="button" class="btn btn-primary float-right" href="<c:url value="/seeker/education"/>">Add</a>
                            </div>
                            <h5 class="card-title mb-0">Education</h5>
                        </div>
                        <div class="card-body">
                            <c:if test="${not empty edus}">
                                <c:forEach var="ed" items="${edus}">
                                    <div class="job-box d-md-flex align-items-center justify-content-between mb-30">
                                        <div class="job-left my-4 d-md-flex align-items-center flex-wrap">
                                            <div class="job-content">
                                                <h5 class="text-center text-md-left">${ed.schoolName}</h5>
                                                <ul class="d-md-flex flex-wrap text-capitalize ff-open-sans">
                                                    <li class="mr-md-4">
                                                        <i class="zmdi zmdi-pin mr-2"></i> ${ed.degree}
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="job-right my-4 flex-shrink-0">
                                            <a href="<c:url value="/seeker/education/delete/${ed.id}"/>" onclick="if (!(confirm('Are you sure you want to delete this education?'))) return false" class="btn d-block w-100 d-sm-inline-block btn-danger">Delete</a>
                                        </div>
                                    </div>
                                    </hr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty edus}">
                                <p>No experiences.</p>
                            </c:if>
                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-header">
                            <div class="card-actions float-right">
                                <a type="button" class="btn btn-primary float-right" href="<c:url value="/seeker/experience"/>">Add</a>
                            </div>
                            <h5 class="card-title mb-0">Experience</h5>
                        </div>
                        <div class="card-body">
                            <c:if test="${not empty exps}">
                                <c:forEach var="e" items="${exps}">
                                    <div class="job-box d-md-flex align-items-center justify-content-between mb-30">
                                        <div class="job-left my-4 d-md-flex align-items-center flex-wrap">
                                            <div class="job-content">
                                                <h5 class="text-center text-md-left">${e.jobName}</h5>
                                                <ul class="d-md-flex flex-wrap text-capitalize ff-open-sans">
                                                    <li class="mr-md-4">
                                                        <i class="zmdi zmdi-pin mr-2"></i> ${e.company}
                                                    </li>
                                                    <li class="mr-md-4">
                                                        <i class="zmdi zmdi-time mr-2"></i> ${e.yearExp}
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="job-right my-4 flex-shrink-0">
                                            <a href="<c:url value="/seeker/experience/delete/${e.id}"/>" onclick="if (!(confirm('Are you sure you want to delete this experience?'))) return false" class="btn d-block w-100 d-sm-inline-block btn-danger">Delete</a>
                                        </div>
                                    </div>
                                    </hr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty exps}">
                                <p>No experiences.</p>
                            </c:if>
                        </div>
                    </div>
                            
                    <div class="card">
                        <div class="card-header">
                            <div class="card-actions float-right">
                                <a type="button" class="btn btn-primary float-right" href="<c:url value="/seeker/skill"/>">Add</a>
                            </div>
                            <h5 class="card-title mb-0">Skill</h5>
                        </div>
                        <div class="card-body">
                            <c:if test="${not empty skills}">
                                <c:forEach var="s" items="${skills}">
                                    <div class="job-box d-md-flex align-items-center justify-content-between mb-30">
                                        <div class="job-left my-4 d-md-flex align-items-center flex-wrap">
                                            <div class="job-content">
                                                <h5 class="text-center text-md-left">${s.name}</h5>                                                
                                            </div>
                                        </div>
                                        <div class="job-right my-4 flex-shrink-0">
                                            <a href="<c:url value="/seeker/skill/delete/${s.id}"/>" onclick="if (!(confirm('Are you sure you want to delete this skill?'))) return false" class="btn d-block w-100 d-sm-inline-block btn-danger">Cancel</a>
                                        </div>
                                    </div>
                                    </hr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty skills}">
                                <p>No skills.</p>
                            </c:if>
                        </div>
                    </div>
                </div>                
            </div>
        </div>
    </div>

</div>