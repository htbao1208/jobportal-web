
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="action" value="/joblist/${job.id}"/>
<!DOCTYPE html>
<div class="page-header" style="background: url(<c:url value="/images/banner.png"/>);>
    <div class="container">
        <div class="row">         
            <div class="col-md-12">
                <div class="breadcrumb-wrapper">
                    <h2 class="product-title">Job Details</h2>                    
                </div>
            </div>
        </div>
    </div>
</div>

<section class="job-detail section">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="header-detail">
                    <div class="header-content float-left">
                        <h3>${job.title}</a></h3>
                        <p><span>Date: ${job.createdDate}</span></p>
                        <p>Monthly Salary: <strong class="price">${job.salary}</strong></p>
                    </div>
                    <div class="detail-company float-right text-right">
                        <div class="img-thum">
                            <img class="rounded" width="80" height="80" src="<c:url value="${job.company.logo}"/>" alt="">
                        </div>
                        <div class="name">
                            <h4>${job.company.compName}</h4>
                            <h5>${job.company.address} </h5>
                            <p>-----------</p>
                        </div>
                    </div>
                    
                    <div class="clearfix">
                        <hr>
                        <div class="center p-2">
                            <form:form method="post" action="${action}" modelAttribute="application">                             
                            <sec:authorize access="isAuthenticated()">
                                <span><input class="btn btn-border btn-sm btn-outline-success" type="submit" value="Apply"></span>   
                            </sec:authorize>
                            </form:form>
                                                     
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="content-area">
                    <div class="clearfix">
                        <div class="box">
                            <h4>Job Description</h4>
                            <p>${job.description}</p>
                            
                            <h4>Experience</h4>
                            <p>${job.exp}</p>
                            
                            
                        </div>
                    </div>
                </div>
                
            </div>            
        </div>
    </div>
</section>