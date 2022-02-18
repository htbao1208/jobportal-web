<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:url value="/company/cvList/${cv.id}"  var="action"/>
<!DOCTYPE html>
<div class="container">
    <div class="row">
        <div class="col-lg-3 ">
            <div class="card left-profile-card">
                <div class="card-body">
                    <div class="text-center">
                        <img src="<c:url value="${cv.seeker.user.userImg}"/>" alt="" class="user-profile">
                        <h3>${cv.seeker.lastName} ${cv.seeker.firstName}</h3>
                        <hr>                        
                    </div>
                        <div class="text-center">
                            <c:if test="${not empty compCheck}">
                                <form:form method="post" action="${action}" modelAttribute="recruit">
                                    <input class="btn btn-border btn-sm btn-outline-success" type="submit" value="Recruit"> 
                                </form:form>
                            </c:if>
                            <c:if test="${empty compCheck}">
                                <a class="btn btn-border btn-sm btn-outline-success" href="javascript:;" onclick="showAlertComp()">Recruit</a>
                            </c:if>
                        </div>
                    <div class="personal-info">
                        <h3>Personal Information</h3>
                        <ul class="personal-list">
                            <li><i class="fas fa-briefcase "></i><span>${cv.title}</span></li>
                            <li><i class="fas fa-map-marker-alt "></i><span> ${cv.seeker.address}</span></li>
                            <li><i class="far fa-envelope "></i><span>${cv.seeker.user.email}</span></li>
                            <li><i class="fas fa-mobile "></i><span>${cv.seeker.phone}</span></li>
                        </ul>
                    </div>
                    <hr>
                    <div class="skill">
                        <h3>Skills</h3>
                        <c:if test="${not empty skills}">
                            <c:forEach var="l" items="${skills}">
                                <p>${l.name}</p>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty skills}">
                            <p>No skills.</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9">
            <div class="card right-profile-card">
                <div class="card-header alert-primary">
                    <ul class="nav nav-pills" id="pills-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-selected="true">Work Experience</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="pills-education-tab" data-toggle="pill" href="#pills-education" role="tab" aria-selected="false">Education</a>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                            <c:if test="${not empty exps}">
                                <c:forEach var="e" items="${exps}">
                                    <div class="work-container">
                                        <h3>${e.jobName} :- ${e.company}</h3>
                                        <h4><i class="far fa-calendar-alt"></i>${e.yearExp}</h4>                                
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty exps}">
                                <p>No experiences.</p>
                            </c:if>
                        </div>
                        <div class="tab-pane fade" id="pills-education" role="tabpanel">                            
                            <c:if test="${not empty edus}">
                                <c:forEach var="ed" items="${edus}">
                                    <div class="work-container">
                                        <h3>${ed.degree} :- ${ed.schoolName}</h3>
                                        <h4>${ed.industry}</h4>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty edus}">
                                <p>No experiences.</p>
                            </c:if>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>