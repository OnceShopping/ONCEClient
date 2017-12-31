<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ONCE</title>
<script type="text/javascript">
function start(){
	location = "${pageContext.request.contextPath}/main"
}
</script>
</head>
<body onLoad="setTimeout('start()', 5000)">
	<img src="${pageContext.request.contextPath}/resources/img/OnceClient.png" alt="" width="100%" height="100%">
</body>
</html>