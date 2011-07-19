<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>AranduJejogua Beta</title>
 

<link href="http://www.gstatic.com/codesite/ph/17444577587916266307/css/ph_core.css" rel="stylesheet" type="text/css" />
 <link href="http://code.google.com/css/codesite.pack.04102009.css" rel="stylesheet" type="text/css" />
  <script language="javascript" src='script/jquery-1.6.min.js'></script>
  <script language="javascript" src='script/ajax.util.js'></script>
</head>

<body>

<div  id="gc-pagecontent" >
  <h1 class="page_title">Inicio</h1>
  <%
    String guestbookName = request.getParameter("guestbookName");
    if (guestbookName == null) {
        guestbookName = "default";
    }
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>
<p>Hola, <%= user.getNickname() %>! (Aqu&iacute; puedes
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">cerrar sesi&oacute;n</a>.)</p>
<%
    } else {
%>
<p>Hola!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">inicia sesi&aacute;n</a></p>
<%
    }
%>
 <div id="tabs" class="gtb">
      <a id="home" href="#home" class="tab">Lista</a>	   
	  <a id="comparaciones" href="#comparaciones" class="tab">Comparaciones</a> 
	  <a id="configuracion" href="#configuracion" class="tab">Configuracion</a>	   
	  <div class="gtbc"></div>
  </div>
  <!-- home page content -->
  <div class="g-unit" id="home-tab">
  	 <h2>Lista</h2>
   </div>  
    <div class="g-unit" id="comparaciones-tab">
    <h2>Comparaciones</h2>
   </div>  
   <div class="g-unit" id="configuracion-tab">
   <h2>Configuracion</h2>
   </div>  
   
</div>



<script type="text/javascript">

 $(window).load(function () {
   init();
});

</script>
</body>
</html>
