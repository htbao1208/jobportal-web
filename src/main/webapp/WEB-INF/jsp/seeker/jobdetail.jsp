
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/joblist/${job.id}" var="action"/>
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
                        <p><span>Ngày đăng: ${job.createdDate}</span></p>
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
                                <span><input class="btn btn-border btn-sm btn-outline-success" type="submit" value="Ứng tuyển"></span>   
                             </sec:authorize>
                             </form:form>
                                                     
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-sm-12 col-xs-12">
                <div class="content-area">
                    <div class="clearfix">
                        <div class="box">
                            <h4>Job Description</h4>
                            <p>${job.description}</p>
                            
                            <h4>Kinh nghiệm</h4>
                            <p>${job.exp}</p>
<!--                            <ul>
                                <li><i class="ti-check-box"></i>Demonstrated strong and effective verbal, written, and interpersonal communication skills</li>
                                <li><i class="ti-check-box"></i>Must be team-oriented, possess a positive attitude and work well with others</li>
                                <li><i class="ti-check-box"></i>Ability to prioritize and multi-task in a flexible, fast paced and challenging environment</li>
                            </ul>-->
                            <h4>Key responsibilities also include</h4>
                            <ul>
                                <li><i class="ti-check-box"></i>Provide technical health advice to Head of Country Programmes and field advisors at all key stages of the project management cycle including needs assessment.</li>
                                <li><i class="ti-check-box"></i>Technical strategy and design, implementation as well as sector specific monitoring and evaluation.</li>
                                <li><i class="ti-check-box"></i>This includes travel to field programmes as well as review of proposals, key reports and surveys prior to external submission.</li>
                            </ul>
                            <h4>Requirements</h4>
                            <ul>
                                <li><i class="ti-check-box"></i>Must have minimum of 3 years experience running, maneuvering, driving, and navigating equipment such as bulldozer, excavators, rollers, and front-end loaders.</li>
                                <li><i class="ti-check-box"></i>Must have minimum of 3 years experience running, maneuvering, driving, and navigating equipment such as bulldozer, excavators, rollers, and front-end loaders.
                                    Strongly prefer candidates with High School Diploma</li>
                            </ul>
                            <h4>Benefits</h4>
                            <ul>
                                <li><i class="ti-check-box"></i>Must have minimum of 3 years experience running, maneuvering, driving, and navigating equipment such as bulldozer, excavators, rollers, and front-end loaders.</li>
                                <li><i class="ti-check-box"></i>Strongly prefer candidates with High School Diploma</li>
                            </ul>
                            
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
                <aside>
                    <div class="sidebar">
                        <div class="box">
                            <h2 class="small-title">Job Details</h2>
                            <ul class="detail-list">
                                <li>
                                    <a href="#">Job Id</a>
                                    <span class="type-posts">Jb1246789</span>
                                </li>
                                <li>
                                    <a href="#">Location</a>
                                    <span class="type-posts">New York, NY</span>
                                </li>
                                <li>
                                    <a href="#">Company</a>
                                    <span class="type-posts">LemonKids LLC</span>
                                </li>
                                <li>
                                    <a href="#">Type</a>
                                    <span class="type-posts">Private</span>
                                </li>
                                <li>
                                    <a href="#">Employment Status</a>
                                    <span class="type-posts">Permanent</span>
                                </li>
                                <li>
                                    <a href="#">Employment Type</a>
                                    <span class="type-posts">Manager</span>
                                </li>
                                <li>
                                    <a href="#">Positions</a>
                                    <span class="type-posts">5</span>
                                </li>
                                <li>
                                    <a href="#">Career Level</a>
                                    <span class="type-posts">Experience</span>
                                </li>
                                <li>
                                    <a href="#">Experience</a>
                                    <span class="type-posts">3 Years</span>
                                </li>
                                <li>
                                    <a href="#">Gender</a>
                                    <span class="type-posts">Male</span>
                                </li>
                                <li>
                                    <a href="#">Nationality</a>
                                    <span class="type-posts">United States</span>
                                </li>
                                <li>
                                    <a href="#">Degree</a>
                                    <span class="type-posts">Masters</span>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
                </aside>
            </div>
        </div>
    </div>
</section>