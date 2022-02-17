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
                    <a class="list-group-item list-group-item-action" href="<c:url value="/seeker/main"/>">
                      Account
                    </a>
                    <a class="list-group-item list-group-item-action" href="#password">
                      Password
                    </a>
                    <a class="list-group-item list-group-item-action active" href="<c:url value="/seeker/listAppication"/>">
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
                        <div class="card-body">
                            <h5 class="card-title">Job Applied</h5>
                            <c:if test="${not empty listApply}">
                                <c:forEach var="l" items="${listApply}">
                                    <div class="job-box d-md-flex align-items-center justify-content-between mb-30">
                                        <div class="job-left my-4 d-md-flex align-items-center flex-wrap">
                                            <div class="job-content">
                                                <h5 class="text-center text-md-left">${l.job.title}</h5>

                                                <ul class="d-md-flex flex-wrap text-capitalize ff-open-sans">
                                                    <li class="mr-md-4">
                                                        <i class="zmdi zmdi-pin mr-2"></i> ${l.job.address}
                                                    </li>
                                                    <li class="mr-md-4">
                                                        <i class="zmdi zmdi-money mr-2"></i> ${l.job.salary}
                                                    </li>
                                                    <li class="mr-md-4">
                                                        <i class="zmdi zmdi-time mr-2"></i> ${l.job.jobType}
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="job-right my-4 flex-shrink-0">
                                            <a href="<c:url value="/seeker/application/delete/${l.id}"/>" onclick="if (!(confirm('Are you sure you want to delete this application?'))) return false" class="btn d-block w-100 d-sm-inline-block btn-danger">Cancel</a>
                                        </div>
                                    </div>
                                    </hr>
                                </c:forEach>
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-reset justify-content-center">
                                    <c:forEach begin="1" end="${Math.ceil(counter/5)}" var="page">
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value="/joblist"/>?page=${page}" tabindex="-1">${page}</a>
                                        </li>

                                    </c:forEach>
                                </ul>
                            </nav>
                        </c:if>
                        <c:if test="${empty listApply}">
                            <p>Haven't applied for any job yet </p>
                        </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>