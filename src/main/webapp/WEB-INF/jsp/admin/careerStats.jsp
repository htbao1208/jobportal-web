<%-- 
    Document   : careersStats
    Created on : Feb 18, 2022, 6:48:27 PM
    Author     : kid03
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="text-center">
    <h1>Statistics of candidates by career</h1>
    <form>
        <div class="form-group">
            <label>From Date</label>
            <input type="date" name="fromDate" class="form-control"/>
        </div>
        <div class="form-group">
            <label>To Date</label>
            <input type="date" name="toDate" class="form-control"/>
        </div>
        <div>
            <input type="submit" value="Stats" class="btn btn-success"/>
        </div>
    </form>
    <div class="chart-container mx-auto" style="width: 500px; height: 500px;">
        <canvas id="mySeekerStatsChart"></canvas>
    </div>
    <table class="table mt-5">
        <thead class="thead-dark">
        <tr class="border">
            <th>Seeker Code</th>
            <th>Name</th>
            <th>Career</th>
            <th>Application date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${careerStat}" var="c">
            <tr>
                <td>${c[0]}</td>
                <td>${c[1]} ${c[2]}</td>
                <td>${c[3]}</td>
                <td>${c[4]}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    let seekerLabels = [], seekerInfor = [];
    <c:forEach items="${careerStat}" var="c">
        seekerLabels.push('${c[3]}');
        seekerInfor.push(${c[5]});
    </c:forEach>
    window.onload = function (){
        seekerChart("mySeekerStatsChart", seekerLabels, seekerInfor);
    };
</script>
