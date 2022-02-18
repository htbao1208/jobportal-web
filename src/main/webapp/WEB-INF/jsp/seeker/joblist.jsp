<%-- 
    Document   : joblist
    Created on : Dec 12, 2021, 4:06:25 PM
    Author     : kid03
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-10 mx-auto mb-4">
            <div class="section-title text-center ">
                <h3 class="top-c-sep">Grow your career with us</h3>
                <p>Lorem ipsum dolor sit detudzdae amet, rcquisc adipiscing elit. Aenean socada commodo
                    ligaui egets dolor. Nullam quis ante tiam sit ame orci eget erovtiu faucid.</p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-10 mx-auto">
            <div class="career-search mb-60">

                <form action="#" class="career-form mb-60">
                    <div class="row">
                        <form class="form-inline row container pr-xs-0" action="">
                            <div class="col-md-6 col-lg-3 my-3">
                                <div class="input-group position-relative">
                                    <input type="text" class="form-control" placeholder="Enter Your Keywords" name="kw">
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 my-3">
                                <div class="select-container">
                                    <select class="custom-select" name="jobType">
                                        <option selected="">Select Job Type</option>
                                        <option value="Intership" label="Intership" />
                                        <option value="Part-time" label="Part-time"/>
                                        <option value="Full-time" label="Full-time"/>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 my-3 ml-auto">


                                <button type="submit" class="btn btn-lg btn-block btn-light btn-custom" id="contact-submit">
                                    Search
                                </button>
                        </form>
                    </div>
            </div>
            </form>

            <div class="filter-result">
                <p class="mb-30 ff-montserrat">Total Job Openings : ${jCounter}</p>
                <c:if test="${not empty list}">
                    <c:forEach var="j" items="${list}">
                        <div class="job-box d-md-flex align-items-center justify-content-between mb-30">
                            <div class="job-left my-4 d-md-flex align-items-center flex-wrap">
                                <div class="mr-md-4 mb-md-0 mb-4 mx-auto mx-md-0 d-md-none d-lg-flex">
                                    <img class="mr-1 rounded-circle" src="<c:url value="${j.company.logo}"/>"  width="25" height="25" alt="avatar">
                                </div>
                                <div class="job-content">
                                    <a href="<c:url value="/joblist/${j.id}"/>"><h5 class="text-center text-md-left">${j.title}</h5></a>

                                    <ul class="d-md-flex flex-wrap text-capitalize ff-open-sans">
                                        <li class="mr-md-4">
                                            <i class="zmdi zmdi-pin mr-2"></i> ${j.address}
                                        </li>
                                        <li class="mr-md-4">
                                            <i class="zmdi zmdi-money mr-2"></i> ${j.salary}
                                        </li>
                                        <li class="mr-md-4">
                                            <i class="zmdi zmdi-time mr-2"></i> ${j.jobType}
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty list}">
                    <p>Not found.</p>
                </c:if>
            </div>
        </div>

        <!-- START Pagination -->
        <nav aria-label="Page navigation">
            <ul class="pagination pagination-reset justify-content-center">
                <!--                            <li class="page-item disabled">
                                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                                                    <i class="zmdi zmdi-long-arrow-left"></i>
                                                </a>
                                            </li>-->
                <c:forEach begin="1" end="${Math.ceil(jCounter/9)}" var="page">
                    <li class="page-item">
                        <a class="page-link" href="<c:url value="/joblist"/>?page=${page}" tabindex="-1">${page}</a>
                    </li>

                </c:forEach>
                <!--                            <li class="page-item">
                                                <a class="page-link" href="#">
                                                    <i class="zmdi zmdi-long-arrow-right"></i>
                                                </a>
                                            </li>-->
            </ul>
        </nav>
        <!-- END Pagination -->
    </div>
</div>

</div>
