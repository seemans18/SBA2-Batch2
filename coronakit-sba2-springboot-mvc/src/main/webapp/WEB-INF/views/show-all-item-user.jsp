<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="spring-form"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User - Show Product List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="/header" />
	<br>
	<div>
	<c:if test="${msg != null }">
		<p class="alert alert-info"><strong>${msg }</strong></p>
	</c:if>
	</div>

	<form:form  class="form" action='${pageContext.request.contextPath}/user/show-kit' method="POST" modelAttribute="addedProducts">
		<c:choose>
		<c:when test="${products == null || products.isEmpty() }">
			<p class="well well-info">No Products Found !! </p>
		</c:when>
		<c:otherwise>
			<br/>
			<table class="table table-striped table-hover table-border">
				<tr>
					<th>Product ID#</th>
					<th>Product Name</th>
					<th>Cost</th>
					<th>Description</th>
					<!-- <th>Quantity</th>  -->
					<th>Action</th>
				</tr>
				<c:forEach items="${products }" var="product">
					<tr>
						<td>${product.id }</td>
						<td>${product.productName }</td>
						<td>${product.cost }</td>
						<td>${product.productDescription}</td>
						<td>
							<!-- <input type="number" name="qty" value="0" min="0"> -->
							<a class="btn btn-sm" href="${pageContext.request.contextPath}/user/add-to-cart/${product.id}">Add to Kit</a>
							<!-- <a class="btn btn-sm" href="${pageContext.request.contextPath}/user/add-to-cart/${product.id}">Add to Kit</a>  -->
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<p></p>
	<a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/user/show-kit">Show Kit</a>
	</form:form>
	<jsp:include page="/footer" />
</body>
</html>