<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:include page="./admin_header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(function(){
    $('.preview-add-button').click(function(){
        var form_data = {};
        form_data["title"] = $('.goods-form input[name="title"]').val();
     
        form_data["amount"] = parseFloat($('.goods-form input[name="amount"]').val()).toFixed(2);
       
        form_data["warehouse"] = $('.goods-form #warehouse option:selected').text();
        
        form_data["publishdate"] = $('.goods-form input[name="publishdate"]').val();
        
        
        var row = $('<tr></tr>');
        
        $.each(form_data, function( type, value ) {
            
            alert(value);
            
        });
        
        
    });  
});

</script>

</head>
<body>

	<div class="container">
		<div class="col-sm-12">
			<h2>상품등록</h2>
		</div>
		<!-- panel preview -->
		<div class="col-sm-5">
			<div class="panel panel-default">
				<div class="panel-body form-horizontal goods-form">
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label">책제목</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="title" name="title">
						</div>
					</div>
					<div class="form-group">
						<label for="amount" class="col-sm-3 control-label">권수</label>
						<div class="col-sm-9">
							<input type="number" class="form-control" id="amount" name="amount">
						</div>
					</div>
					<div class="form-group">
						<label for="warehouse" class="col-sm-3 control-label">지점</label>
						<div class="col-sm-9">
							<select class="form-control" id="warehouse" name="warehouse">
								<option>--</option>
								<option>a</option>
								<option>b</option>
								<option>c</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-3 control-label">출판일</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="publishdate" name="publishdate">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12 text-right">
							<button type="button" class="btn btn-default preview-add-button">
								<span class="glyphicon glyphicon-ok"></span> 등록
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>