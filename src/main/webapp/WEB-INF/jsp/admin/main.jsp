<%-- 
    Document   : careersStats
    Created on : Feb 18, 2022, 6:48:27 PM
    Author     : kid03
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="text-center">
    <h1>User Management</h1>    
    <table class="table mt-5">
        <thead class="thead-dark">
            <tr class="border">
                <th>User Id</th>
                <th>Username</th>
                <th>User Role</th>
                <th>Email</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="u">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.username}</td>
                    <td>${u.userRole}</td>
                    <td>${u.email}</td>
                    <td>
                        <a href="<c:url value="/admin/user/delete/${u.id}"/>" onclick="if (!(confirm('Are you sure you want to delete this user?')))
                                    return false">
                            <input type="button" value="Xóa" class="btn btn-danger"/>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

