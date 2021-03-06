<%-- 
    Document   : index
    Created on : Dec 11, 2021, 3:03:47 PM
    Author     : kid03
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div id="slides" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators">
        <li data-target="#slides" data-slide-to="0" class="active"></li>
        <li data-target="#slides" data-slide-to="1"></li>
        <li data-target="#slides" data-slide-to="2"></li>		
        <li data-target="#slides" data-slide-to="3"></li>
    </ul>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="<c:url value="/images/carousel0.png"/>">
            <div class="carousel-caption">
                <h1 class="display-2">Example</h1>
                <h3>Autolayout with Boostrap</h3>
                <button type="button" class="btn btn-outline-light btn-lg">
                    Join with US
                </button>
                
            </div>
        </div>
        <div class="carousel-item">
            <img src="<c:url value="/images/carousel1.png"/>">
            <div class="carousel-caption">
                <h1 class="display-2">Example</h1>
                <h3>Autolayout with Boostrap</h3>
                <button type="button" class="btn btn-outline-light btn-lg">
                    Join with US
                </button>
                
            </div>
        </div>
        <div class="carousel-item">
            <img src="<c:url value="/images/carousel2.png"/>">
            <div class="carousel-caption">
                <h1 class="display-2">Example</h1>
                <h3>Autolayout with Boostrap</h3>
                <button type="button" class="btn btn-outline-light btn-lg">
                    Join with US
                </button>
                
            </div>
        </div>
        <div class="carousel-item">
            <img src="<c:url value="/images/carousel3.png"/>">
            <div class="carousel-caption">
                <h1 class="display-2">Example</h1>
                <h3>Autolayout with Boostrap</h3>
                <button type="button" class="btn btn-outline-light btn-lg">
                    Join with US
                </button>
                
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="jumbotron">
        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-10">
            <p>This is an example of using Bootstrap to make a responsive Website. This is a tutorial</p>             
        </div>
        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-2">
            <a href="#">
                <button type="button" class="btn btn-outline-secondary">Buy a host</button>
            </a>
        </div>
    </div>
</div>
<div class="container-fluid padding">
    <div class="row welcome text-center">
        <div class="col-12">
            <h1 class="display-4">Build your application</h1>
        </div>
        <!-- Horizontal Rule -->
        <hr> 
        <div class="col-12">
            <p>Welcome my Bootstrap 4 tutorials. Bootstrap is an open-source and free front-end library with HTML and CSS based design</p>
        </div>
    </div>
</div>
<div class="container-fluid padding">
    <div class="row text-center padding">
        <div class="col-xs-12 col-sm-6 col-md-4 ">
            <i class="fab fa-react"></i>	
            <h3>REACT</h3>
            <p>Build the latest version of React</p>					
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4">
            <i class="fab fa-angular"></i>			
            <h3>Angular</h3>
            <p>Build your Website and Front-end Application</p>
        </div>
        <div class="col-sm-12 col-md-4">
            <i class="fab fa-css3"></i>			
            <h3>CSS3 , HTML5</h3>
            <p>Customize your web UI with Html5 and Css3</p>
        </div>
    </div>	
    <hr class="my-4">	
</div>
<div class="container-fluid padding">
    <div class="row padding">
        <div class="col-md-12 col-lg-6">
            <h2>If you build it...</h2>
            <p>Arduino is an open-source hardware, software and content platform with a global community. It?s intended for anyone making interactive projects.</p>
            <p>Arduino Education is a dedicated team formed by education experts, content developers, engineers and interaction designers from all around the world</p>
            <br>
        </div>
        <div class="col-lg-6">
            <img src="./images/laptop.JPG" class="img-fluid">
        </div>
    </div>
</div>
<hr class="my-2">

<div class="container-fluid padding">
    <div class="row welcome text-center">
        <div class="col-12">
            <h1 class="display-4">Meet our team members</h1>
        </div>
    </div>
</div>
<div class="container-fluid padding">
    <div class="row padding">
        <div class="col-md-4">
            <div class="card">
                <img class="card-img-top" src="./images/nguyenduchoang.png">
                <div class="card-body">
                    <h4 class="card-title">Nguyen Duc Hoang</h4>
                    <p class="card-text">Nguyen Duc Hoang is a fullstack developer with 12 years of experiences</p>
                    <a href="#" class="btn btn-outline-secondary">See profile</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img class="card-img-top" src="./images/johndoe.png">
                <div class="card-body">
                    <h4 class="card-title">
                        John Doe	
                    </h4>
                    <p class="card-text">John Doe is a web developer, he worked for some startup and technology companies</p>
                    <a href="#" class="btn btn-outline-secondary">See profile</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img class="card-img-top" src="./images/Natasha.png">
                <div class="card-body">
                    <h4 class="card-title">
                        Natasha	
                    </h4>
                    <p class="card-text">Natasha is a web designer, she has 5 years of experiences in UI/UX</p>
                    <a href="#" class="btn btn-outline-secondary">See profile</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid padding">
    <div class="row padding">
        <div class="col-md-12 col-lg-6">
            <h2>Our vision</h2>
            <p>All our work is for customer satisfaction with high quality products</p>
            <p>We make outsourcing all softwares relating to CMS, Database, Education</p>
            <br>
        </div>
        <div class="col-lg-6">
            <img src="./images/mission.jpg" class="img-fluid">
        </div>
    </div>
    <hr class="my-4">
</div>
<div class="container-fluid padding">	
    <div class="row text-center padding">
        <div class="col-12">
            <h2>Contact us</h2>
        </div>
        <div class="col-12 social padding">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-google-plus-g"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
    </div>
</div>	

