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
<!doctype html>
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<title>AranduJejogua Beta</title>
	
	<meta charset="utf-8">
	<meta name="description" content="Comparte con tu red de contactos tus compras y aprende de las compras de ellos.">
	<meta name="keywords" content="supermercado compartir aprender negociar central compras hogar social red">
	<meta name="author" content="Raul Giucich">
	<meta name="robots" content="index, follow">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Icons -->
	<link rel="shortcut icon" href="/favicon.ico">
	<link rel="apple-touch-icon" href="/apple-touch-icon.png">
	
	<!-- CSS Styles -->
	<link rel="stylesheet" href="css/screen.css">
	<link rel="stylesheet" href="css/colors.css">
	<link rel="stylesheet" href="css/jquery.tipsy.css">
	<link rel="stylesheet" href="css/jquery.wysiwyg.css">
	<link rel="stylesheet" href="css/jquery.datatables.css">
	<link rel="stylesheet" href="css/jquery.nyromodal.css">
	<link rel="stylesheet" href="css/jquery.datepicker.css">
	<link rel="stylesheet" href="css/jquery.fileinput.css">
	<link rel="stylesheet" href="css/jquery.fullcalendar.css">
	<link rel="stylesheet" href="css/jquery.visualize.css">
	<link rel="stylesheet" href="css/jquery.snippet.css">
	
	<!-- Google WebFonts -->
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans+Mono|Open+Sans:400,400italic,700,700italic&amp;v2' rel='stylesheet' type='text/css'>
	
	<!-- Modernizr adds classes to the <html> element which allow you to target specific browser functionality in your stylesheet -->
	<script src="js/libs/modernizr-1.7.min.js"></script>
	
</head>
<body>

	<!-- Header -->
	<header id="navigation">

		<!-- Navigation Container -->
		<div class="navigation-wrapper">
		
			<!-- Your Project Logo -->
			<a id="logo" href="/" title="Volver al inicio">Your logo</a>
			
			<!-- Main Nav Container -->
			<nav id="nav-main">
			
				<!-- Main Navigation -->
				<ul id="nav-main-navigation">
					<li><a href="/" title="">INICIO</a></li>
					<li><a href="#submenu-1" title="" class="nav-main-subnav">Reportes</a></li>
					<li><a href="#submenu-2" title="" class="nav-main-subnav">Red</a></li>
					<li><a href="#submenu-3" title="" class="nav-main-subnav">Lugares</a></li>
				</ul>
				<!-- /Main Navigation -->
				
				<!-- User Navigation -->
				<ul id="nav-main-user">
				 <%
				    UserService userService = UserServiceFactory.getUserService();
    				User user = userService.getCurrentUser();
    				if (user != null) {
    					
					%>
						<li>Hola, <a href="#" title=""><%= user.getNickname() %></a></li>
						<li><a href="#" title="Messages" class="actions"><img alt="Messages" src="img/icons/icon_user_message.png"></a></li>
						<li><a href="#" title="Settings" class="actions"><img alt="Settings" src="img/icons/icon_user_settings.png"></a></li>
						<li><a href="<%= userService.createLogoutURL(request.getRequestURI())%>" title="Logout" class="actions"><img alt="Logout" src="img/icons/icon_user_logout.png"></a></li>
					<%
					    } else {
					%>
						<li>Hola, <a href="<%= userService.createLoginURL(request.getRequestURI()) %>" title="">inicia sesi&oacute;n</a></li>
					<%
					    }
					%>
				
					
				</ul>
				<!-- /User Navigation -->
				
			</nav>
			<!-- /Main Nav Container -->
			
			<!-- Sub Nav Container -->
			<nav id="nav-sub">
			
				<!-- Sub Nav Block #submenu-1 -->
				<div id="submenu-1" class="submenu">
				
					<!-- Standard Sub Nav List Style -->
					<!-- Use class .menu-fit to indent list under 1st main menu item -->
					<ul class="standard-list menu-fit">
						<li class="standard-list-header"><h2>Some Links</h2></li>
						<li><a href="#">Envato</a></li>
						<li><a href="#">ActiveDen</a></li>
						<li><a href="#">AudioJungle</a></li>
						<li><a href="#">ThemeForest</a></li>
						<li><a href="#">VideoHive</a></li>
						<li><a href="#">GraphicRiver</a></li>
						<li><a href="#">3DOcean</a></li>
						<li><a href="#">CodeCanyon</a></li>
						<li><a href="#">Creattica</a></li>
					</ul>
					<!-- /Standard Sub Nav List Style -->
					
					<ul class="standard-list">
						<li class="standard-list-header"><h2>Useful Links</h2></li>
						<li><a href="#">Appstorm</a></li>
						<li><a href="#">Mac.Appstorm</a></li>
						<li><a href="#">Web.Appstorm</a></li>
						<li><a href="#">iPhone.Appstorm</a></li>
						<li><a href="#">TheNetsetter</a></li>
						<li><a href="#">Snipplr</a></li>
						<li><a href="#">Rockable Press</a></li>
						<li><a href="#">FreelanceSwitch</a></li>
					</ul>
					<ul class="standard-list">
						<li class="standard-list-header"><h2>More Links</h2></li>
						<li><a href="#">Psdtuts+</a></li>
						<li><a href="#">Nettuts+</a></li>
						<li><a href="#">Vectortuts+</a></li>
						<li><a href="#">Audiotuts+</a></li>
						<li><a href="#">Aetuts+</a></li>
						<li><a href="#">Activetuts+</a></li>
						<li><a href="#">Cgtuts+</a></li>
						<li><a href="#">Phototuts+</a></li>
						<li><a href="#">Mobiletuts+</a></li>
					</ul>
					
					<!-- If you don't want headers in lists use class .header-fit to indent list verticaly to fit lists with headers -->
					<ul class="standard-list header-fit">
						<li><a href="#">Webdesigntuts+</a></li>
						<li><a href="#">Noupe</a></li>
						<li><a href="#">Six Revisions</a></li>
						<li><a href="#">Drawar</a></li>
						<li><a href="#">DesignShack</a></li>
						<li><a href="#">Cats Who Code</a></li>
						<li><a href="#">Onextrapixel</a></li>
						<li><a href="#">Vanseodesign</a></li>
						<li><a href="#">Webdesigner Depot</a></li>
					</ul>
					<ul class="standard-list header-fit">
						<li><a href="#">VandelayDesign</a></li>
						<li><a href="#">Web Designer Wall</a></li>
						<li><a href="#">Impressive Webs</a></li>
						<li><a href="#">Hongkiat</a></li>
						<li><a href="#">Yoast</a></li>
						<li><a href="http://www.parallaq.com" class="outside">Parallaq</a></li>
					</ul>
				</div>
				<!-- /Sub Nav Block #submenu-1 -->
				
				<!-- Sub Nav Block #submenu-2 -->
				<div id="submenu-2" class="submenu">
					<ul class="standard-list menu-fit">
						<li class="standard-list-header"><h2>Some Links</h2></li>
						<li><a href="#">Envato</a></li>
						<li><a href="#">ActiveDen</a></li>
						<li><a href="#">AudioJungle</a></li>
						<li><a href="#">ThemeForest</a></li>
						<li><a href="#">VideoHive</a></li>
						<li><a href="#">GraphicRiver</a></li>
						<li><a href="#">3DOcean</a></li>
						<li><a href="#">CodeCanyon</a></li>
						<li><a href="#">Creattica</a></li>
					</ul>
					
					<!-- Box Sub Nav List Style -->
					<ul class="box-list">
						<li class="box-list-header"><h2>Useful Links</h2></li>
						<li><a href="#">Appstorm</a></li>
						<li><a href="#">Mac.Appstorm</a></li>
						<li><a href="#">Web.Appstorm</a></li>
						<li><a href="#">iPhone.Appstorm</a></li>
						<li><a href="#">TheNetsetter</a></li>
						
					</ul>
					<!-- /Box Sub Nav List Style -->
					
					<ul class="box-list header-fit">
						<li><a href="#">FreelanceSwitch</a></li>
						<li><a href="#">WorkAwesome</a></li>
						<li><a href="#">DrinkAwesome</a></li>
						<li><a href="#">LiveAwesome</a></li>
						<li><a href="#">SleepAwesome</a></li>
					</ul>
					<ul class="box-list header-fit">
						<li><a href="#">Psdtuts+</a></li>
						<li><a href="#">Nettuts+</a></li>
						<li><a href="#">Vectortuts+</a></li>
						<li><a href="#">Audiotuts+</a></li>
						<li><a href="#">Aetuts+</a></li>
					</ul>
					
					<!-- You can also use articles in submenu, they will automatically align to the right or use class .perex to align left  -->
					<article>
						<h2>Header H2</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam.</p>
					</article>
				</div>
				<!-- /Sub Nav Block #submenu-2 -->
				
				<!-- Sub Nav Block #submenu-3 -->
				<div id="submenu-3" class="submenu">
					
					<!-- Thumbnail Sub Nav List Style -->
					<ul class="thumbnail-list menu-fit">
						<li class="thumbnail-list-header"><h2>Image Content</h2></li>
						<li>
							<img src="img/_sample-data/sample_image_1.png" alt="Sample Image">
							<h3>Some image examples</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus.</p>
							<a class="thumbnail-list-more">Read more &raquo;</a>
						</li>
						<li>
							<img src="img/_sample-data/sample_image_2.png" alt="Sample Image">
							<h3>One more example</h3>
							<p>Sed pharetra placerat est suscipit sagittis. Phasellus aliquam malesuada blandit.</p>
							<a class="thumbnail-list-more">Read more &raquo;</a>
						</li>
					</ul>
					<!-- /Thumbnail Sub Nav List Style -->
					
					<!-- You can also use articles in submenu, they will automatically align to the right or use class .perex to align left  -->
					<article>
						<h2>Header H2</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam.</p>
					</article>
					
				</div>
				<!-- /Sub Nav Block #submenu-3 -->
				
				
			</nav>
			
		</div>
	</header>
	<!-- /Header -->
	
	<!-- Main Content -->
	<section role="main" class="page-wrapper">
	
		<!-- Dashboard -->
		<section id="dashboard">
			<h1>Bienvenido a la Red Social de Administración del Hogar!</h1>
			
			<!-- Breadcumbs -->
			<ul id="breadcrumbs">
				<li><a href="/" title="Inicio">Inicio</a></li>
				<li><a href="#">Mis Listas</a></li>
				<li><a href="#">Productos</a></li>
				<li><a href="#">Lugares de Compra</a></li>
				<li>P&aacute;gina actual</li>
			</ul>
			<!-- /Breadcumbs -->
			
		</section>
		<!-- /Dashboard -->
		
		<!-- Full width content box with minimizer -->
		<article class="content-box minimizer">
			<header>
			
				<h2>Tachyon Administration Template</h2>
				
				<!-- Content Box Tab Navigation -->
				<nav>
					<ul class="tab-switch">
						<li><a class="default-tab tooltip" href="#tab1" title="Switch to next tab">Graph</a></li>
						<li><a class="tooltip" href="#tab2" title="Form styles">Form</a></li>
						<li><a class="tooltip" href="#tab3" title="Sample tables">Table</a></li>
					</ul>
				</nav>
				<!-- /Content Box Tab Navigation -->
				
			</header>
			<section>
			
				<!-- Tab Content #tab1 -->
				<div class="tab default-tab" id="tab1">
					<h3>Employee Sales by Department</h3>
					
					<!-- Sample Data table for jQuery Visualize plugin. Use attribute chart-type for different visualization -->
					<table class="data" data-chart="line">
						<thead>
							<tr>
								<td></td>
								<th scope="col">food</th>
								<th scope="col">auto</th>
								<th scope="col">household</th>
								<th scope="col">furniture</th>
								<th scope="col">kitchen</th>
								<th scope="col">bath</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">Mary</th>
								<td>190</td>
								<td>160</td>
								<td>40</td>
								<td>120</td>
								<td>30</td>
								<td>70</td>
							</tr>
							<tr>
								<th scope="row">Tom</th>
								<td>3</td>
								<td>40</td>
								<td>30</td>
								<td>45</td>
								<td>35</td>
								<td>49</td>
							</tr>
							<tr>
								<th scope="row">Brad</th>
								<td>10</td>
								<td>180</td>
								<td>10</td>
								<td>85</td>
								<td>25</td>
								<td>79</td>
							</tr>
							<tr>
								<th scope="row">Kate</th>
								<td>40</td>
								<td>80</td>
								<td>90</td>
								<td>25</td>
								<td>15</td>
								<td>119</td>
							</tr>
						</tbody>
					</table>
					<!-- /Sample Data -->
					
				</div>
				<!-- /Tab Content #tab1 -->
				
				<!-- Tab Content #tab2 -->
				<div class="tab" id="tab2">
					<h3>Horizontal Form</h3>
					
					<!-- Horizontal form (default) -->
					<form class="horizontal-form">
						<!-- Inputs -->
						<!-- Use class .small, .medium or .large for predefined size -->
						<fieldset>
							<legend>Legend</legend>
							<dl>
								<dt>
									<label>Short Input</label>
								</dt>
								<dd>
									<input type="text" class="small" name="" value="">
									<p>Short description of event</p>
								</dd>
								<dt>
									<!-- You can add mandatory highlight automatically by class .mandatory or... -->
									<label class="mandatory">Medium Input</label>
								</dt>
								<dd>
									<input type="text" class="medium" name="" value="">
								</dd>
								<dt>
									<!-- ...manually by adding <span>*</span> into label -->
									<label>Focused Input <span>*</span></label>
								</dt>
								<dd>
									<!-- Class .focused is only required for demo -->
									<input type="text" class="medium focused" name="" value="">
								</dd>
								<dt>
									<label>Valid Input</label>
								</dt>
								<dd>
									<input type="text" class="medium valid" name="" value="">
									<span class="valid-side-note">Valid text</span>
								</dd>
								<dt>
									<label>Invalid Input</label>
								</dt>
								<dd>
									<input type="text" class="medium invalid" name="" value="">
									<span class="invalid-side-note">Invalid text</span>
								</dd>
								<dt>
									<label>Disabled Input</label>
								</dt>
								<dd>
									<input type="text" class="medium" disabled name="" value="This input was disabled">
								</dd>
								<dt>
									<label>Ghost Input</label>
								</dt>
								<dd>
									<input class="ghost medium" type="text" name="" value="This is ghost input acting like pure text">
								</dd>
								<dt>
									<label>Large input</label>
								</dt>
								<dd>
									<input type="text" class="large" name="" value="">
									<p>Short description of event</p>
								</dd>
								<dt>
									<label>Text only</label>
								</dt>
								<dd class="text">
									<p>Sometimes you need pure text in forms. Use class .text for &lt;dd&gt; to correct text alignment.</p>
								</dd>
								<dt>
									<label>File input</label>
								</dt>
								<dd>
									<input type="file" class="fileupload" name="">
									<p>Max size 5Mb</p>
								</dd>
								<dt>
									<label>Date input</label>
								</dt>
								<dd>
									<input type="text" class="datepicker" name="" value="">
								</dd>
								<dt>
									<label>Textarea</label>
								</dt>
								<dd>
									<!-- Use class .wysiwyg for jQuery jWYSIWYG initiation -->
									<textarea rows="5" cols="40" class="wysiwyg large" name=""></textarea>
									<p>Short description of event</p>
								</dd>
							</dl>
						</fieldset>
						<fieldset class="no-borders">
							<legend>Fieldset with .no-borders class</legend>
							<dl>
								<dt class="checkbox"><label>Checkbox A</label></dt>
								<dd><input type="checkbox" name=""></dd>
								<dt class="checkbox"><label>Checkbox B</label></dt>
								<dd><input type="checkbox" name=""></dd>
								<dt class="checkbox"><label>Checkbox C</label></dt>
								<dd><input type="checkbox" name=""></dd>
							</dl>
						</fieldset>
						<fieldset>
							<legend>Choose one of these</legend>
							<dl>
								<dt class="radio"><label>Option 1</label></dt>
								<dd><input type="radio" name="test"></dd>
								<dt class="radio"><label>Option 2</label></dt>
								<dd><input type="radio" name="test"></dd>
								<dt class="radio"><label>Option 3</label></dt>
								<dd><input type="radio" name="test"></dd>
							</dl>
						</fieldset>
						<fieldset>
							<legend>Choose one of these</legend>
							<dl>
								<dt><label>Select</label></dt>
								<dd>
									<select name="actions">
										<option selected>Choose an action</option>
										<option value="e">Edit</option>
										<option value="r">Remove</option>
										<option value="x">Export</option>
									</select>
								</dd>
							</dl>
						</fieldset>
						<button type="submit">Submit</button> or <a href="#">Cancel</a>
					</form>
					<!-- /Horizontal form -->
					
					<!-- Vertical form -->
					<h3>Vertical Form</h3>
					<form class="vertical-form">
						<!-- Inputs -->
						<!-- Use class .small, .medium or .large for predefined size -->
						<fieldset>
							<legend>Legend</legend>
							<dl>
								<dt class="clear-tm">
									<label>Short Input</label>
								</dt>
								<dd>
									<input type="text" class="small" name="" value="">
									<p>Short description of event</p>
								</dd>
								<dt>
									<label>Medium Input</label>
								</dt>
								<dd>
									<input type="text" class="medium" name="" value="">
								</dd>
								<dt>
									<label>Large input</label>
								</dt>
								<dd>
									<input type="text" class="large" name="" value="">
								</dd>
								<dt>
									<label>Text only</label>
								</dt>
								<dd class="text">
									<p>Sometimes you need pure text in forms. Use class .text for &lt;dd&gt; to correct text alignment.</p>
								</dd>
							</dl>
						</fieldset>
						<fieldset>
							<legend>Check-in some of these</legend>
							<dl>
								<dt class="checkbox"><label>Checkbox A</label></dt>
								<dd class="checkbox"><input type="checkbox"></dd>
								<dt class="checkbox"><label>Checkbox B</label></dt>
								<dd class="checkbox"><input type="checkbox"></dd>
								<dt class="checkbox"><label>Checkbox C</label></dt>
								<dd class="checkbox"><input type="checkbox"></dd>
							</dl>
						</fieldset>
						<fieldset>
							<legend>Choose one of these</legend>
							<dl>
								<dt class="radio"><label>Option 1</label></dt>
								<dd class="radio"><input type="radio" name="test"></dd>
								<dt class="radio"><label>Option 2</label></dt>
								<dd class="radio"><input type="radio" name="test"></dd>
								<dt class="radio"><label>Option 3</label></dt>
								<dd class="radio"><input type="radio" name="test"></dd>
							</dl>
						</fieldset>
						<fieldset>
							<legend>Choose one of these</legend>
							<dl>
								<dt class="clear-tm"><label>Select</label></dt>
								<dd>
									<select name="actions">
										<option selected>Choose an action</option>
										<option value="e">Edit</option>
										<option value="r">Remove</option>
										<option value="x">Export</option>
									</select>
								</dd>
							</dl>
						</fieldset>
						<button type="submit">View</button> <button type="submit" class="gray">Submit</button> or <a href="#">Cancel</a>
					</form>
					<!-- /Vertical form -->
					
				</div>
				<!-- /Tab Content #tab2 -->
				
				<!-- Tab Content #tab3 -->
				<div class="tab" id="tab3">
					<h3>Table with jQuery.dataTables</h3>
					
					<!-- Sample jQuery DataTable  -->
					<table class="datatable">
						<thead>
							<tr>
								<th>Rendering engine</th>
								<th>Browser</th>
								<th>Platform(s)</th>
								<th>Engine version</th>
								<th>CSS grade</th>
							</tr>
						</thead>
						<tbody>
							<tr class="gradeX">
								<td>Trident</td>
								<td>Internet Explorer 4.0</td>
								<td>Win 95+</td>
								<td> 4</td>
								<td>X</td>
							</tr>
							<tr class="gradeC">
								<td>Trident</td>
								<td>Internet  Explorer 5.0</td>
								<td>Win 95+</td>
								<td>5</td>
								<td>C</td>
							</tr>
							<tr class="gradeA">
								<td>Trident</td>
								<td>Internet Explorer 5.5</td>
								<td>Win 95+</td>
								<td>5.5</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Trident</td>
								<td>Internet Explorer 6</td>
								<td>Win 98+</td>
								<td>6</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Trident</td>
								<td>Internet Explorer 7</td>
								<td>Win XP SP2+</td>
								<td>7</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Trident</td>
								<td>AOL browser (AOL desktop)</td>
								<td>Win XP</td>
								<td>6</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Firefox 1.0</td>
								<td>Win 98+ / OSX.2+</td>
								<td>1.7</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Firefox 1.5</td>
								<td>Win 98+ / OSX.2+</td>
								<td>1.8</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Firefox 2.0</td>
								<td>Win 98+ / OSX.2+</td>
								<td>1.8</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Firefox 3.0</td>
								<td>Win 2k+ / OSX.3+</td>
								<td>1.9</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Camino 1.0</td>
								<td>OSX.2+</td>
								<td>1.8</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Camino 1.5</td>
								<td>OSX.3+</td>
								<td>1.8</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Netscape 7.2</td>
								<td>Win 95+ / Mac OS 8.6-9.2</td>
								<td>1.7</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Netscape Browser 8</td>
								<td>Win 98SE+</td>
								<td>1.7</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Netscape Navigator 9</td>
								<td>Win 98+ / OSX.2+</td>
								<td>1.8</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Mozilla 1.0</td>
								<td>Win 95+ / OSX.1+</td>
								<td>1</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Mozilla 1.1</td>
								<td>Win 95+ / OSX.1+</td>
								<td>1.1</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Mozilla 1.2</td>
								<td>Win 95+ / OSX.1+</td>
								<td>1.2</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Mozilla 1.3</td>
								<td>Win 95+ / OSX.1+</td>
								<td>1.3</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Mozilla 1.4</td>
								<td>Win 95+ / OSX.1+</td>
								<td>1.4</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Mozilla 1.5</td>
								<td>Win 95+ / OSX.1+</td>
								<td>1.5</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Mozilla 1.6</td>
								<td>Win 95+ / OSX.1+</td>
								<td>1.6</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Mozilla 1.7</td>
								<td>Win 98+ / OSX.1+</td>
								<td>1.7</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Mozilla 1.8</td>
								<td>Win 98+ / OSX.1+</td>
								<td>1.8</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Seamonkey 1.1</td>
								<td>Win 98+ / OSX.2+</td>
								<td>1.8</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Gecko</td>
								<td>Epiphany 2.20</td>
								<td>Gnome</td>
								<td>1.8</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Webkit</td>
								<td>Safari 1.2</td>
								<td>OSX.3</td>
								<td>125.5</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Webkit</td>
								<td>Safari 1.3</td>
								<td>OSX.3</td>
								<td>312.8</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Webkit</td>
								<td>Safari 2.0</td>
								<td>OSX.4+</td>
								<td>419.3</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Webkit</td>
								<td>Safari 3.0</td>
								<td>OSX.4+</td>
								<td>522.1</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Webkit</td>
								<td>OmniWeb 5.5</td>
								<td>OSX.4+</td>
								<td>420</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Webkit</td>
								<td>iPod Touch / iPhone</td>
								<td>iPod</td>
								<td>420.1</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Webkit</td>
								<td>S60</td>
								<td>S60</td>
								<td>413</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Presto</td>
								<td>Opera 7.0</td>
								<td>Win 95+ / OSX.1+</td>
								<td>-</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Presto</td>
								<td>Opera 7.5</td>
								<td>Win 95+ / OSX.2+</td>
								<td>-</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Presto</td>
								<td>Opera 8.0</td>
								<td>Win 95+ / OSX.2+</td>
								<td>-</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Presto</td>
								<td>Opera 8.5</td>
								<td>Win 95+ / OSX.2+</td>
								<td>-</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Presto</td>
								<td>Opera 9.0</td>
								<td>Win 95+ / OSX.3+</td>
								<td>-</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Presto</td>
								<td>Opera 9.2</td>
								<td>Win 88+ / OSX.3+</td>
								<td>-</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Presto</td>
								<td>Opera 9.5</td>
								<td>Win 88+ / OSX.3+</td>
								<td>-</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Presto</td>
								<td>Opera for Wii</td>
								<td>Wii</td>
								<td>-</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Presto</td>
								<td>Nokia N800</td>
								<td>N800</td>
								<td>-</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>Presto</td>
								<td>Nintendo DS browser</td>
								<td>Nintendo DS</td>
								<td>8.5</td>
								<td>C/A<sup>1</sup></td>
							</tr>
							<tr class="gradeC">
								<td>KHTML</td>
								<td>Konqureror 3.1</td>
								<td>KDE 3.1</td>
								<td>3.1</td>
								<td>C</td>
							</tr>
							<tr class="gradeA">
								<td>KHTML</td>
								<td>Konqureror 3.3</td>
								<td>KDE 3.3</td>
								<td>3.3</td>
								<td>A</td>
							</tr>
							<tr class="gradeA">
								<td>KHTML</td>
								<td>Konqureror 3.5</td>
								<td>KDE 3.5</td>
								<td>3.5</td>
								<td>A</td>
							</tr>
							<tr class="gradeX">
								<td>Tasman</td>
								<td>Internet Explorer 4.5</td>
								<td>Mac OS 8-9</td>
								<td>-</td>
								<td>X</td>
							</tr>
							<tr class="gradeC">
								<td>Tasman</td>
								<td>Internet Explorer 5.1</td>
								<td>Mac OS 7.6-9</td>
								<td>1</td>
								<td>C</td>
							</tr>
							<tr class="gradeC">
								<td>Tasman</td>
								<td>Internet Explorer 5.2</td>
								<td>Mac OS 8-X</td>
								<td>1</td>
								<td>C</td>
							</tr>
							<tr class="gradeA">
								<td>Misc</td>
								<td>NetFront 3.1</td>
								<td>Embedded devices</td>
								<td>-</td>
								<td>C</td>
							</tr>
							<tr class="gradeA">
								<td>Misc</td>
								<td>NetFront 3.4</td>
								<td>Embedded devices</td>
								<td>-</td>
								<td>A</td>
							</tr>
							<tr class="gradeX">
								<td>Misc</td>
								<td>Dillo 0.8</td>
								<td>Embedded devices</td>
								<td>-</td>
								<td>X</td>
							</tr>
							<tr class="gradeX">
								<td>Misc</td>
								<td>Links</td>
								<td>Text only</td>
								<td>-</td>
								<td>X</td>
							</tr>
							<tr class="gradeX">
								<td>Misc</td>
								<td>Lynx</td>
								<td>Text only</td>
								<td>-</td>
								<td>X</td>
							</tr>
							<tr class="gradeC">
								<td>Misc</td>
								<td>IE Mobile</td>
								<td>Windows Mobile 6</td>
								<td>-</td>
								<td>C</td>
							</tr>
							<tr class="gradeC">
								<td>Misc</td>
								<td>PSP browser</td>
								<td>PSP</td>
								<td>-</td>
								<td>C</td>
							</tr>
							<tr class="gradeU">
								<td>Other browsers</td>
								<td>All others</td>
								<td>-</td>
								<td>-</td>
								<td>U</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th>Rendering engine</th>
								<th>Browser</th>
								<th>Platform(s)</th>
								<th>Engine version</th>
								<th>CSS grade</th>
							</tr>
						</tfoot>
					</table>
					<!-- /Sample jQuery DataTable  -->
					
					<h3 class="clearfix">Regular Table</h3>
					
					<!-- Basic Table  -->
					<form class="table-form">
						<table>
							<thead>
								<tr>
									<th><input type="checkbox" class="check-all"></th>
									<th>&nbsp;</th>
									<th>Rendering engine</th>
									<th>Browser</th>
									<th>Platform(s)</th>
									<th>Version</th>
									<th>Tags</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Trident</td>
									<td>Internet Explorer 4.0</td>
									<td>Win 95+</td>
									<td>4</td>
									<td><span class="tag red">High</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Trident</td>
									<td>Internet  Explorer 5.0</td>
									<td>Win 95+</td>
									<td>5</td>
									<td><span class="tag orange">Medium</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Trident</td>
									<td>Internet Explorer 5.5</td>
									<td>Win 95+</td>
									<td>5.5</td>
									<td><span class="tag green">Low</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Trident</td>
									<td>Internet Explorer 6</td>
									<td>Win 98+</td>
									<td>6</td>
									<td><span class="tag gray">Closed</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Trident</td>
									<td>Internet Explorer 7</td>
									<td>Win XP SP2+</td>
									<td>7</td>
									<td><span class="tag blue">#337</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Trident</td>
									<td>AOL browser (AOL desktop)</td>
									<td>Win XP</td>
									<td>6</td>
									<td><span class="tag gray">Closed</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Gecko</td>
									<td>Firefox 1.0</td>
									<td>Win 98+ / OSX.2+</td>
									<td>1.7</td>
									<td><span class="tag gray">Closed</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Gecko</td>
									<td>Firefox 1.5</td>
									<td>Win 98+ / OSX.2+</td>
									<td>1.8</td>
									<td><span class="tag gray">Closed</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Gecko</td>
									<td>Firefox 2.0</td>
									<td>Win 98+ / OSX.2+</td>
									<td>1.8</td>
									<td><span class="tag black">Foo</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Gecko</td>
									<td>Firefox 3.0</td>
									<td>Win 2k+ / OSX.3+</td>
									<td>1.9</td>
									<td><span class="tag gray">Closed</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Gecko</td>
									<td>Camino 1.0</td>
									<td>OSX.2+</td>
									<td>1.8</td>
									<td><span class="tag gray">Closed</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<!-- Table actions -->
										<a class="toggle-table-switch tooltip" href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a></li>
											<li><a href="#">edit</a></li>
											<li><a href="#">delete</a></li>
										</ul>
										<!-- /Table actions -->
									</td>
									<td>Gecko</td>
									<td>Camino 1.5</td>
									<td>OSX.3+</td>
									<td>1.8</td>
									<td><span class="tag gray">Closed</span></td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a></li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a></li>
											<li><a class="delete tooltip" href="#" title="Delete Item">delete</a></li>
										</ul>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="8">
										<!-- Pagination -->
										<ul class="pagination">
											<li><a class="button gray" href="#">&laquo; first</a></li>
											<li><a class="button gray" href="#">&lt; next</a></li>
											<li class="hellip">&hellip;</li>
											<li><a class="button gray" href="#">5</a></li>
											<li><a class="button gray" href="#">6</a></li>
											<li><a class="button" href="#">7</a></li>
											<li><a class="button gray" href="#">8</a></li>
											<li><a class="button gray" href="#">9</a></li>
											<li class="hellip">&hellip;</li>
											<li><a class="button gray" href="#">prev &gt;</a></li>
											<li><a class="button gray" href="#">last &raquo;</a></li>
										</ul>
										<!-- /Pagination -->
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
					<!-- /Basic Table  -->
					
				</div>
				<!-- /Tab Content #tab3 -->

			</section>
			<footer>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum aliquet nisi ac risus tincidunt gravida. Cras imperdiet mattis nisl et suscipit.</footer>
		</article>
		<!-- /Full width content box with minimizer -->
		
		<div class="clearfix"></div> <!-- We're really sorry for this, but because of IE7 we still need separated div with clearfix -->
		
		<!-- Half width content box -->
		<article class="content-box col-2">
			<header>
				<h2>Headline H2</h2>
				
				<!-- Content Box Actions -->
				<nav>
					<ul class="button-switch">
						<li><a href="#" class="button">View</a></li>
						<li><a href="#" class="button">Edit</a></li>
						<li><a href="#" class="button gray">Delete</a></li>
					</ul>
				</nav>
				<!-- /Content Box Actions -->
				
			</header>
			<section>
			
				<!-- Class .bb instantly adds 1px bottom border -->
				<h3 class="bb">Headline H3</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis. Phasellus aliquam malesuada blandit. Donec adipiscing sem erat. Nunc at dui id purus lacinia tincidunt sit amet vel erat.</p>
					
				<!-- Image Minimenu Actions -->
				<div class="image-frame right">
					<img src="img/_sample-data/sample_image.jpg" alt="Sample Image">
					<ul class="image-actions">
						<li class="image-actions-header">Options</li>
						<li><a href="#">View</a></li>
						<li><a href="#">Edit</a></li>
						<li><a href="#">Delete</a></li>
					</ul>
				</div>
				<!-- /Image Minimenu Actions -->
				
				<ol>
					<li>Lorem ipsum dolor sit amet</li>
					<li><strong>Consectetur adipiscing elit</strong></li>
					<li><em>Suspendisse et dignissim metus</em></li>
					<li>Maecenas id <a href="#">augue ac metus</a> tempus</li>
					<li>Nunc at dui id purus lacinia
						<ol>
							<li>Lorem ipsum dolor sit amet</li>
							<li>Consectetur adipiscing elit</li>
							<li>Suspendisse et dignissim metus</li>
							<li>Phasellus aliquam
								<ol>
									<li>Lorem ipsum dolor sit amet</li>
									<li>Consectetur adipiscing elit</li>
								</ol>
							</li>
						</ol>
					</li>
					<li>Sed pharetra placerat est suscipit</li>
				</ol>
				<h4>Headline H4</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis. Phasellus aliquam malesuada blandit. Donec adipiscing sem erat. Nunc at dui id purus lacinia tincidunt sit amet vel erat.</p>
				<h5>Headline H5</h5>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <code>Yes, the &lt;code&gt; tag is styled too!</code> Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis. Phasellus aliquam malesuada blandit. Donec adipiscing sem erat. Nunc at dui id purus lacinia tincidunt sit amet vel erat.</p>
				
			</section>
		</article>
		<!-- /Half width content box -->
		
		<!-- Half width content box with margin clearing class -->
		<article class="content-box col-2 clear-rm">
			<header>
				<h2>Stats and Progress Bars</h2>
				
				<!-- Content Box Options -->
				<nav>
					<a href="#" class="toggle-options-switch button gray"><img src="img/icons/icon_options.png" alt="Options"></a>
					<ul class="options-switch">
						<li><a href="#">View</a></li>
						<li><a href="#">Edit</a></li>
						<li><a href="#">Delete</a></li>
					</ul>
				</nav>
				<!-- /Content Box Options -->
				
			</header>
			<section>
			
				<!-- Stats Summary -->
				<ul class="stats-summary">
					<li>
						<strong class="stats-count">17</strong>
						<p>New registrations</p>
						<a href="#" class="button stats-view tooltip" title="View new registrations">View</a>
					</li>
					<li>
						<strong class="stats-count">89</strong>
						<p>New visitors</p>
						<a href="#" class="button stats-view tooltip" title="View new visitros">View</a>
					</li>
					<li>
						<strong class="stats-count">346</strong>
						<p>New sales</p>
						<a href="#" class="button stats-view tooltip" title="View new sales">View</a>
					</li>
					<li>
						<strong class="stats-count">266</strong>
						<p>New orders</p>
						<a href="#" class="button stats-view tooltip" title="View new orders">View</a>
					</li>
					<li>
						<strong class="stats-count">1024</strong>
						<p>New requests</p>
						<a href="#" class="button stats-view tooltip" title="View new requests">View</a>
					</li>
				</ul>
				<!-- /Stats Summary -->
				
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam.</p>
				
				<!-- Progress Bar -->
				<div class="progress-bar green small">
					<div style="width:49%;">
						<span>49<sup>%</sup></span>
					</div>
				</div>
				<!-- /Progress Bar -->
				
				<!-- Progress Bar -->
				<div class="progress-bar red medium">
					<div style="width:67%;">
						<span>67<sup>%</sup></span>
					</div>
				</div>
				<!-- /Progress Bar -->
				
				<!-- Progress Bar -->
				<div class="progress-bar blue large">
					<div style="width:80%;">
						<span>80<sup>%</sup></span>
					</div>
				</div>
				<!-- /Progress Bar -->
				
				<!-- Progress Bar -->
				<div class="progress-bar black huge">
					<div style="width:80%;">
						<span>80<sup>%</sup></span>
					</div>
				</div>
				<!-- /Progress Bar -->
				
			</section>
		</article>
		<!-- /Half width content box with margin clearing class -->
		
		<div class="clearfix"></div> <!-- We're really sorry for this, but because of IE7 we still need separated div with clearfix -->
		
		<!-- Full width content box -->
		<article class="content-box">
			<header>
				<h2>Notifications, Image Gallery and more!</h2>
				
				<!-- Content Box Search -->
				<nav>
					<form class="content-box-header-search" action="/">
						<input type="text" name="" class="content-box-header-search-input">
						<button class="content-box-header-search-btn">Search</button>
					</form>
				</nav>
				<!-- /Content Box Search -->
				
			</header>
			<section>
				
				<!-- Side Tab Container -->
				<div class="sidetabs">
				
					<!-- Side Tab Navigation -->
					<nav class="sidetab-switch">
						<ul>
							<li><a class="default-sidetab" href="#sidetab1">Notifications</a></li>
							<li><a href="#sidetab2">Image Gallery</a></li>
							<li><a href="#sidetab3">Tickets</a></li>
						</ul>
						<p>Aenean facilisis ligula eget orci adipiscing varius. Curabitur sem ligula, egestas vel bibendum sed, sodales eu nulla. Vestibulum luctus aliquam feugiat. Donec porta interdum placerat.</p>
					</nav>
					<!-- /Side Tab Navigation -->
					
					<!-- Side Tab Content #sidetab1 -->
					<div class="sidetab default-sidetab" id="sidetab1">
					
						<h3>Notifications</h3>
						
						<!-- Notification -->
						<div class="notification error">
							<a href="#" class="close-notification tooltip" title="Hide Notification">x</a>
							<h4>Error notification</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.</p>
							<a href="#" class="show-notification-details">&#9658; Show Details</a>
							<ul class="notification-details">
								<li>Lorem ipsum dolor sit amet</li>
								<li>Suspendisse et dignissim metus</li>
								<li>Maecenas id augue ac metus tempus</li>
								<li>Sed pharetra placerat est suscipit</li>
								<li>Phasellus aliquam males</li>
								<li>Nunc at dui id purus lacinia tincidunt</li>
							</ul>
						</div>
						<!-- /Notification -->
						
						<!-- Notification -->
						<div class="notification success">
							<a href="#" class="close-notification tooltip" title="Hide Notification">x</a>
							<h4>Success notification</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.</p>
							<a href="#" class="show-notification-details">&#9658; Show Details</a>
							<ul class="notification-details">
								<li>Lorem ipsum dolor sit amet</li>
								<li>Suspendisse et dignissim metus</li>
								<li>Maecenas id augue ac metus tempus</li>
								<li>Sed pharetra placerat est suscipit</li>
								<li>Phasellus aliquam males</li>
								<li>Nunc at dui id purus lacinia tincidunt</li>
							</ul>
						</div>
						<!-- /Notification -->
						
						<!-- Notification -->
						<div class="notification information">
							<a href="#" class="close-notification tooltip" title="Hide Notification">x</a>
							<h4>Information notification</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.</p>
							<a href="#" class="show-notification-details">&#9658; Show Details</a>
							<ul class="notification-details">
								<li>Lorem ipsum dolor sit amet</li>
								<li>Suspendisse et dignissim metus</li>
								<li>Maecenas id augue ac metus tempus</li>
								<li>Sed pharetra placerat est suscipit</li>
								<li>Phasellus aliquam males</li>
								<li>Nunc at dui id purus lacinia tincidunt</li>
							</ul>
						</div>
						<!-- /Notification -->
						
						<!-- Notification -->
						<div class="notification attention">
							<a href="#" class="close-notification tooltip" title="Hide Notification">x</a>
							<h4>Attention notification</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam.</p>
						</div>
						<!-- /Notification -->
						
						<!-- Notification -->
						<div class="notification note">
							<a href="#" class="close-notification tooltip" title="Hide Notification">x</a>
							<h4>Note</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis.</p>
						</div>
						<!-- /Notification -->
						
					</div>
					<!-- /Side Tab Content #sidetab1 -->
					
					<!-- Side Tab Content #sidetab2 -->
					<div class="sidetab" id="sidetab2">
						<h3>Image Gallery</h3>
						
						<!-- Inline Image Gallery -->
						<ul class="image-gallery">
							<li class="image-frame">
								<img src="img/_sample-data/sample_image.jpg" alt="Sample Image">
								<ul class="image-actions">
									<li class="image-actions-header">Options</li>
									<li><a href="#">View</a></li>
									<li><a href="#">Edit</a></li>
									<li><a href="#">Delete</a></li>
								</ul>
							</li>
							<li class="image-frame">
								<img src="img/_sample-data/sample_image.jpg" alt="Sample Image">
								<ul class="image-actions">
									<li class="image-actions-header">Options</li>
									<li><a href="#">View</a></li>
									<li><a href="#">Edit</a></li>
									<li><a href="#">Delete</a></li>
								</ul>
							</li>
							<li class="image-frame">
								<img src="img/_sample-data/sample_image.jpg" alt="Sample Image">
								<ul class="image-actions">
									<li><a href="#">View</a></li>
									<li><a href="#">Edit</a></li>
									<li><a href="#">Delete</a></li>
								</ul>
							</li>
							<li class="image-frame">
								<img src="img/_sample-data/sample_image.jpg" alt="Sample Image">
								<ul class="image-actions">
									<li><a href="#">View</a></li>
									<li><a href="#">Edit</a></li>
									<li><a href="#">Delete</a></li>
								</ul>
							</li>
							<li class="image-frame">
								<img src="img/_sample-data/sample_image.jpg" alt="Sample Image">
								<ul class="image-actions">
									<li class="view"><a href="#">View</a></li>
									<li class="delete"><a href="#">Delete</a></li>
								</ul>
							</li>
							<li class="image-frame">
								<img src="img/_sample-data/sample_image.jpg" alt="Sample Image">
								<ul class="image-actions">
									<li class="view"><a href="#">View</a></li>
									<li class="delete"><a href="#">Delete</a></li>
								</ul>
							</li>
							<li>
								<img src="img/_sample-data/sample_image.jpg" alt="Sample Image">
							</li>
							<li>
								<img src="img/_sample-data/sample_image.jpg" alt="Sample Image">
							</li>
						</ul>
						<!-- /Inline Image Gallery -->
						
					</div>
					<!-- /Side Tab Content #sidetab2 -->
					
					<!-- Side Tab Content #sidetab3 -->
					<div class="sidetab" id="sidetab3">
						<h3>Tickets</h3>
						
						<!-- Tickets -->
						<ul class="tickets">
						
							<!-- Ticket Headers -->
							<li class="ticket-header">
								<ul>
									<li class="ticket-header-ticket">Ticket</li>
									<li class="ticket-header-activity">Activity</li>
									<li class="ticket-header-user">User</li>
									<li class="ticket-header-priority">Priority</li>
									<li class="ticket-header-age">Age</li>
								</ul>
							</li>
							<!-- /Ticket Headers -->
							
							<!-- Ticket Data -->
							<li class="ticket-data">
							
								<!-- Ticket Overview -->
								<div class="ticket-overview">
									<ul>
										<li class="ticket-data-ticket">
											#13664
										</li>
										<li class="ticket-data-activity">
											<a href="#" class="ticket-open-details">Vestibulum luctus aliquam feugiat. Donec porta</a>
											<p>New Ticket</p>
										</li>
										<li class="ticket-data-user">
											<strong>Duke Smith</strong>
											Best Deals Ltd.
										</li>
										<li class="ticket-data-priority">
											<span class="tag red">High</span>
										</li>
										<li class="ticket-data-age">
											16 hours
										</li>
									</ul>
								</div>
								<!-- /Ticket Overview -->
								
								<!-- Ticket Details -->
								<div class="ticket-details">
									<h4>Donec porta interdum placerat</h4>
									<dl>
										<dt>Opened:</dt>
										<dd><strong>16 hours ago</strong></dd>
										<dt>Last updated:</dt>
										<dd><strong>11 hours ago</strong></dd>
										<dt>Milestone:</dt>
										<dd><strong>N/A</strong></dd>
										<dt class="clear">Reported by:</dt>
										<dd><strong>Jamie</strong></dd>
										<dt>Assigned to:</dt>
										<dd><strong>Anybody</strong></dd>
										<dt>Tags:</dt>
										<dd><strong>N/A</strong></dd>
									</dl>
									<h5>Description</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis.</p>
									<ul class="ticket-details-actions">
										<li><a href="#" class="button gray">Update ticket</a></li>
										<li><a href="#" class="button red">Close ticket</a></li>
									</ul>
								</div>
								<!-- /Ticket Details -->
								
							</li>
							<!-- /Ticket Data -->
							
							<!-- Ticket Data -->
							<li class="ticket-data">
							
								<!-- Ticket Overview -->
								<div class="ticket-overview">
									<ul>
										<li class="ticket-data-ticket">
											#13663
										</li>
										<li class="ticket-data-activity">
											<a href="#" class="ticket-open-details">Nulla aliquam sapien semper mauris consectetur</a>
											<p>New Ticket</p>
										</li>
										<li class="ticket-data-user">
											<strong>Mathew Kulas</strong>
											Adept Ltd.
										</li>
										<li class="ticket-data-priority">
											<span class="tag red">High</span>
										</li>
										<li class="ticket-data-age">
											22 hours
										</li>
									</ul>
								</div>
								<!-- /Ticket Overview -->
								
								<!-- Ticket Details -->
								<div class="ticket-details">
									<h4>Nulla aliquam sapien semper mauris consectetur suscipit</h4>
									<dl>
										<dt>Opened:</dt>
										<dd><strong>22 hours ago</strong></dd>
										<dt>Last updated:</dt>
										<dd><strong>22 hours ago</strong></dd>
										<dt>Milestone:</dt>
										<dd><strong>N/A</strong></dd>
										<dt class="clear">Reported by:</dt>
										<dd><strong>Mathew</strong></dd>
										<dt>Assigned to:</dt>
										<dd><strong>Anybody</strong></dd>
										<dt>Tags:</dt>
										<dd><strong>N/A</strong></dd>
									</dl>
									<h5>Description</h5>
									<p>Vivamus sit amet sapien est. Vestibulum at mattis orci. Duis sit amet tincidunt nisi. Morbi at porttitor nunc. Aliquam lorem massa, dictum vel consequat vitae, sodales nec lectus. Nam metus libero, mollis nec iaculis sit amet, eleifend ac orci. Sed mollis mollis luctus.</p>
									<ul class="ticket-details-actions">
										<li><a href="#" class="button gray">Update ticket</a></li>
										<li><a href="#" class="button red">Close ticket</a></li>
									</ul>
								</div>
								<!-- /Ticket Details -->
								
							</li>
							<!-- /Ticket Data -->
							
							<!-- Ticket Data -->
							<li class="ticket-data">
							
								<!-- Ticket Overview -->
								<div class="ticket-overview">
									<ul>
										<li class="ticket-data-ticket">
											#13662
										</li>
										<li class="ticket-data-activity">
											<a href="#" class="ticket-open-details">Sed pharetra placerat est suscipit sagittis</a>
											<p>New Ticket</p>
										</li>
										<li class="ticket-data-user">
											<strong>Ted Rollin</strong>
											Systel, Inc.
										</li>
										<li class="ticket-data-priority">
											<span class="tag orange">Medium</span>
										</li>
										<li class="ticket-data-age">
											1 day
										</li>
									</ul>
								</div>
								<!-- /Ticket Overview -->
								
								<!-- Ticket Details -->
								<div class="ticket-details">
									<h4>Sed pharetra placerat est suscipit sagittis</h4>
									<dl>
										<dt>Opened:</dt>
										<dd><strong>1 day ago</strong></dd>
										<dt>Last updated:</dt>
										<dd><strong>23 hours ago</strong></dd>
										<dt>Milestone:</dt>
										<dd><strong>N/A</strong></dd>
										<dt class="clear">Reported by:</dt>
										<dd><strong>Ted Rollin</strong></dd>
										<dt>Assigned to:</dt>
										<dd><strong>Javier Zulauf</strong></dd>
										<dt>Tags:</dt>
										<dd><strong>N/A</strong></dd>
									</dl>
									<h5>Description</h5>
									<p>Quisque ut eleifend lorem. Ut bibendum lobortis ante, in blandit quam aliquet eget. Donec tortor risus, vestibulum id dictum laoreet, condimentum vel nisi. Ut euismod laoreet justo vel iaculis. Phasellus at lacus eget magna laoreet euismod et vitae elit.</p>
									<ul class="ticket-details-actions">
										<li><a href="#" class="button gray">Update ticket</a></li>
										<li><a href="#" class="button red">Close ticket</a></li>
									</ul>
								</div>
								<!-- /Ticket Details -->
								
							</li>
							<!-- /Ticket Data -->
							
							<!-- Ticket Data -->
							<li class="ticket-data">
							
								<!-- Ticket Overview -->
								<div class="ticket-overview">
									<ul>
										<li class="ticket-data-ticket">
											#13661
										</li>
										<li class="ticket-data-activity">
											<a href="#" class="ticket-open-details">Quisque ac nisl vitae sapien porta luctus eget sed</a>
											<p>New Ticket</p>
										</li>
										<li class="ticket-data-user">
											<strong>Hugh Tilman</strong>
											Sunix Consulting
										</li>
										<li class="ticket-data-priority">
											<span class="tag orange">Medium</span>
										</li>
										<li class="ticket-data-age">
											2 days
										</li>
									</ul>
								</div>
								<!-- /Ticket Overview -->
								
								<!-- Ticket Details -->
								<div class="ticket-details">
									<h4>Quisque ac nisl vitae sapien porta luctus eget sed dui</h4>
									<dl>
										<dt>Opened:</dt>
										<dd><strong>2 days ago</strong></dd>
										<dt>Last updated:</dt>
										<dd><strong>11 hours ago</strong></dd>
										<dt>Milestone:</dt>
										<dd><strong>N/A</strong></dd>
										<dt class="clear">Reported by:</dt>
										<dd><strong>Hugh Tilman</strong></dd>
										<dt>Assigned to:</dt>
										<dd><strong>Anybody</strong></dd>
										<dt>Tags:</dt>
										<dd><strong>N/A</strong></dd>
									</dl>
									<h5>Description</h5>
									<p>Duis viverra quam tempor felis suscipit sit amet interdum erat pulvinar. Nulla nec quam quis mi pharetra tincidunt et in neque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris a cursus velit.</p>
									<ul class="ticket-details-actions">
										<li><a href="#" class="button gray">Update ticket</a></li>
										<li><a href="#" class="button red">Close ticket</a></li>
									</ul>
								</div>
								<!-- /Ticket Details -->
								
							</li>
							<!-- /Ticket Data -->
							
							<!-- Ticket Data -->
							<li class="ticket-data">
							
								<!-- Ticket Overview -->
								<div class="ticket-overview">
									<ul>
										<li class="ticket-data-ticket">
											#13660
										</li>
										<li class="ticket-data-activity">
											<a href="#" class="ticket-open-details">Etiam ipsum justo, venenatis a facilisis vel</a>
											<p>New Ticket</p>
										</li>
										<li class="ticket-data-user">
											<strong>Selena Cartier</strong>
											Sunix Consulting
										</li>
										<li class="ticket-data-priority">
											<span class="tag orange">Medium</span>
										</li>
										<li class="ticket-data-age">
											2 days
										</li>
									</ul>
								</div>
								<!-- /Ticket Overview -->
								
								<!-- Ticket Details -->
								<div class="ticket-details">
									<h4>Etiam ipsum justo, venenatis a facilisis vel, posuere a ligula</h4>
									<dl>
										<dt>Opened:</dt>
										<dd><strong>2 days ago</strong></dd>
										<dt>Last updated:</dt>
										<dd><strong>22 hours ago</strong></dd>
										<dt>Milestone:</dt>
										<dd><strong>N/A</strong></dd>
										<dt class="clear">Reported by:</dt>
										<dd><strong>Selena</strong></dd>
										<dt>Assigned to:</dt>
										<dd><strong>Anybody</strong></dd>
										<dt>Tags:</dt>
										<dd><strong>N/A</strong></dd>
									</dl>
									<h5>Description</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis.</p>
									<ul class="ticket-details-actions">
										<li><a href="#" class="button gray">Update ticket</a></li>
										<li><a href="#" class="button red">Close ticket</a></li>
									</ul>
								</div>
								<!-- /Ticket Details -->
								
							</li>
							<!-- /Ticket Data -->
							
							<!-- Ticket Data -->
							<li class="ticket-data">
							
								<!-- Ticket Overview -->
								<div class="ticket-overview">
									<ul>
										<li class="ticket-data-ticket">
											#13659
										</li>
										<li class="ticket-data-activity">
											<a href="#" class="ticket-open-details">Vivamus sit amet sapien est</a>
											<p>New Ticket</p>
										</li>
										<li class="ticket-data-user">
											<strong>Javier Zulauf</strong>
											Systectio USA
										</li>
										<li class="ticket-data-priority">
											<span class="tag green">Low</span>
										</li>
										<li class="ticket-data-age">
											3 days
										</li>
									</ul>
								</div>
								<!-- /Ticket Overview -->
								
								<!-- Ticket Details -->
								<div class="ticket-details">
									<h4>Vivamus sit amet sapien est</h4>
									<dl>
										<dt>Opened:</dt>
										<dd><strong>3 days ago</strong></dd>
										<dt>Last updated:</dt>
										<dd><strong>11 hours ago</strong></dd>
										<dt>Milestone:</dt>
										<dd><strong>N/A</strong></dd>
										<dt class="clear">Reported by:</dt>
										<dd><strong>Javier Zulauf</strong></dd>
										<dt>Assigned to:</dt>
										<dd><strong>Anybody</strong></dd>
										<dt>Tags:</dt>
										<dd><strong>N/A</strong></dd>
									</dl>
									<h5>Description</h5>
									<p>Aenean magna massa, condimentum id tristique eu, accumsan vel enim. Morbi et risus vel quam convallis eleifend non nec neque. Sed pellentesque malesuada interdum. Nunc malesuada nulla in velit posuere porta. Ut nec turpis nibh, ut luctus magna.</p>
									<ul class="ticket-details-actions">
										<li><a href="#" class="button gray">Update ticket</a></li>
										<li><a href="#" class="button red">Close ticket</a></li>
									</ul>
								</div>
								<!-- /Ticket Details -->
								
							</li>
							<!-- /Ticket Data -->
							
							<!-- Ticket Data -->
							<li class="ticket-data">
							
								<!-- Ticket Overview -->
								<div class="ticket-overview">
									<ul>
										<li class="ticket-data-ticket">
											#13658
										</li>
										<li class="ticket-data-activity">
											<a href="#" class="ticket-open-details">Donec porta interdum placerat!</a>
											<p>New Ticket</p>
										</li>
										<li class="ticket-data-user">
											<strong>Matt Muench</strong>
											Systems GmbH
										</li>
										<li class="ticket-data-priority">
											<span class="tag green">Low</span>
										</li>
										<li class="ticket-data-age">
											3 days
										</li>
									</ul>
								</div>
								<!-- /Ticket Overview -->
								
								<!-- Ticket Details -->
								<div class="ticket-details">
									<h4>Donec porta interdum placerat!</h4>
									<dl>
										<dt>Opened:</dt>
										<dd><strong>3 days ago</strong></dd>
										<dt>Last updated:</dt>
										<dd><strong>20 hours ago</strong></dd>
										<dt>Milestone:</dt>
										<dd><strong>N/A</strong></dd>
										<dt class="clear">Reported by:</dt>
										<dd><strong>Mathew</strong></dd>
										<dt>Assigned to:</dt>
										<dd><strong>Anybody</strong></dd>
										<dt>Tags:</dt>
										<dd><strong>N/A</strong></dd>
									</dl>
									<h5>Description</h5>
									<p>Aliquam gravida sapien sit amet quam consectetur vitae vehicula dolor tempor. Etiam vitae purus sem. Aenean imperdiet, ante a interdum vehicula, justo nulla rutrum dolor, a adipiscing turpis orci vitae nisi. Cras sit amet tortor a ligula feugiat placerat sit amet porttitor magna.</p>
									<ul class="ticket-details-actions">
										<li><a href="#" class="button gray">Update ticket</a></li>
										<li><a href="#" class="button red">Close ticket</a></li>
									</ul>
								</div>
								<!-- /Ticket Details -->
								
							</li>
							<!-- /Ticket Data -->
							
							<!-- Ticket Data -->
							<li class="ticket-data">
							
								<!-- Ticket Overview -->
								<div class="ticket-overview">
									<ul>
										<li class="ticket-data-ticket">
											#13657
										</li>
										<li class="ticket-data-activity">
											<a href="#" class="ticket-open-details">Curabitur varius suscipit nibh, eu venenatis lectus</a>
											<p>New Ticket</p>
										</li>
										<li class="ticket-data-user">
											<strong>Max Granata</strong>
											Adobell, Inc
										</li>
										<li class="ticket-data-priority">
											<span class="tag green">Low</span>
										</li>
										<li class="ticket-data-age">
											3 days
										</li>
									</ul>
								</div>
								<!-- /Ticket Overview -->
								
								<!-- Ticket Details -->
								<div class="ticket-details">
									<h4>Curabitur varius suscipit nibh, eu venenatis lectus sodales sit amet</h4>
									<dl>
										<dt>Opened:</dt>
										<dd><strong>3 days ago</strong></dd>
										<dt>Last updated:</dt>
										<dd><strong>11 hours ago</strong></dd>
										<dt>Milestone:</dt>
										<dd><strong>N/A</strong></dd>
										<dt class="clear">Reported by:</dt>
										<dd><strong>Max Granata</strong></dd>
										<dt>Assigned to:</dt>
										<dd><strong>Anybody</strong></dd>
										<dt>Tags:</dt>
										<dd><strong>N/A</strong></dd>
									</dl>
									<h5>Description</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at nisi orci, eget congue orci. Aliquam dictum venenatis erat, vel porta massa pellentesque et. Sed blandit, odio sit amet sollicitudin iaculis, quam nisi sodales enim, ut blandit enim nisi in urna.</p>
									<ul class="ticket-details-actions">
										<li><a href="#" class="button gray">Update ticket</a></li>
										<li><a href="#" class="button red">Close ticket</a></li>
									</ul>
								</div>
								<!-- /Ticket Details -->
								
							</li>
							<!-- /Ticket Data -->
							
						</ul>
						<!-- /Tickets-->
						
					</div>
					<!-- /Side Tab Content #sidetab3 -->
					
				</div>
				<!-- /Side Tab Container -->
				
			</section>
		</article>
		<!-- /Full width content box -->
		
		<div class="clearfix"></div> <!-- We're really sorry for this, but because of IE7 we still need separated div with clearfix -->
		
		<!-- One-third width content box -->
		<article class="content-box minimizer col-3">
			<header>
				<h2>Buttons and Links</h2>
				
				<!-- Content Box Options -->
				<nav>
					<a href="#" class="toggle-options-switch button gray"><img src="img/icons/icon_options.png" alt="Options"></a>
					<ul class="options-switch">
						<li><a href="#">View</a></li>
						<li><a href="#">Edit</a></li>
						<li><a href="#">Delete</a></li>
					</ul>
				</nav>
				<!-- /Content Box Options -->
				
			</header>
			<section>
				<!-- Links -->
				<p><a href="#sample" class="modal">Regulart Text Link with modal</a></p>
				<p><a href="#sample" class="outside modal">Regulart Text Link with .outside class</a></p>
				<p><a href="#" class="button">Button-like Text Link (class '.button')</a></p>
				<p><a href="#" class="button blue">Button-like Text Link ('.blue')</a></p>
				<p><a href="#" class="button green">Button-like Text Link ('.green')</a></p>
				<p><a href="#" class="button red">Button-like Text Link ('.red')</a></p>
				<!-- /Links -->
				
				<!-- Buttons -->
				<p><button class="gray">Button (default is auto width)</button></p>
				<p><button class="blue small">Button (.small)</button></p>
				<p><button class="green medium">Button (.medium)</button></p>
				<p><button class="red large">Button (.large)</button></p>
				<p><button class="black huge">Button (.huge)</button></p>
				<p><button class="gray pill">Button (.pill)</button></p>
				<p><button disabled>Button:disabled</button></p>
				<p><input type="submit" class="gray" value="Input[type='submit']"></p>
				<p><input type="button" class="gray" value="Input[type='button']"></p>
				<!-- /Buttons -->
				
			</section>
		</article>
		<!-- /One-third width content box -->
		
		<!-- One-third width content box with Tip Box style -->
		<article class="content-box tip-box col-3">
			<header>
				<h2>Tip Box</h2>
			</header>
			<section>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis.</p>
				<ul>
					<li>Lorem ipsum dolor sit amet</li>
					<li>Suspendisse et dignissim metus</li>
					<li>Maecenas id augue ac metus tempus</li>
					<li>Sed pharetra placerat est suscipit</li>
					<li>Phasellus aliquam males</li>
					<li>Nunc at dui id purus lacinia tincidunt</li>
				</ul>
			</section>
		</article>
		<!-- /One-third width content box -->
		
		<!-- One-third width content box -->
		<article class="content-box col-3 clear-rm">
			<header>
				<h2>Accordion Navigation</h2>
			</header>
			<section>
				
				<!-- Accordion -->
				<ul class="accordion">
					<!-- Accordion Tab -->
					<li>
						<a class="accordion-switch" href=""><h3>First Heading</h3></a>
						<div>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam.</p>
						</div>
					</li>
					<!-- /Accordion Tab -->
					
					<!-- Accordion Tab -->
					<li>
						<a class="accordion-switch" href=""><h3>Second Heading</h3></a>
						<div>
							<p>Sed neque leo, elementum id malesuada id, consequat et erat. Maecenas lorem mauris, consequat ornare elementum adipiscing, tristique eu eros.</p>
						</div>
					</li>
					<!-- /Accordion Tab -->
					
					<!-- Accordion Tab -->
					<li>
						<a class="accordion-switch" href=""><h3>Third Heading</h3></a>
						<div>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam.</p>
						</div>
					</li>
					<!-- /Accordion Tab -->
					
					<!-- Accordion Tab -->
					<li>
						<a class="accordion-switch" href=""><h3>Fourth Heading</h3></a>
						<div>
							<p>Sed neque leo, elementum id malesuada id, consequat et erat. Maecenas lorem mauris, consequat ornare elementum adipiscing, tristique eu eros.</p>
						</div>
					</li>
					<!-- /Accordion Tab -->
				</ul>
				<!-- /Accordion -->
				
			</section>
		</article>
		<!-- /One-third width content box -->
		
		<div class="clearfix"></div> <!-- We're really sorry for this, but because of IE7 we still need separated div with clearfix -->
		
		<!-- One-quarter width content box -->
		<article class="content-box col-4">
			<header>
				<h2>List Styles</h2>
			</header>
			<section>
				<h3>Placerat est</h3>
				
				<!-- Basic List Style -->
				<ul>
					<li>Lorem ipsum dolor sit</li>
					<li>Suspendisse et dignissim</li>
					<li>Maecenas id augue ac</li>
					<li>Sed pharetra placerat</li>
					<li>Phasellus aliquam males</li>
					<li>Nunc at dui id purus</li>
				</ul>
				<!-- /Basic List Style -->
				
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis.</p>
				
				<!-- Arrow List Style -->
				<ul class="list-style-arrow">
					<li>Lorem ipsum dolor sit</li>
					<li>Suspendisse et dignissim</li>
					<li>Maecenas id augue ac</li>
					<li>Sed pharetra placerat</li>
					<li>Phasellus aliquam males</li>
					<li>Nunc at dui id purus</li>
				</ul>
				<!-- /Arrow List Style -->
				
			</section>
		</article>
		<!-- /One-quarter width content box -->
		
		<!-- One-quarter width content box -->
		<article class="content-box minimizer col-4">
			<header>
				<h2>List Styles</h2>
			</header>
			<section>
				<h3>Suscipit est</h3>
				
				<!-- Cross List Style -->
				<ul class="list-style-cross">
					<li>Lorem ipsum dolor sit</li>
					<li>Suspendisse et dignissim</li>
					<li>Maecenas id augue ac</li>
					<li>Sed pharetra placerat</li>
					<li>Phasellus aliquam males</li>
					<li>Nunc at dui id purus</li>
				</ul>
				<!-- /Cross List Style -->
				
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis.</p>
				
				<!-- Checkmark List Style -->
				<ul class="list-style-checkmark">
					<li>Lorem ipsum dolor sit</li>
					<li>Suspendisse et dignissim</li>
					<li>Maecenas id augue ac</li>
					<li>Sed pharetra placerat</li>
					<li>Phasellus aliquam males</li>
					<li>Nunc at dui id purus</li>
				</ul>
				<!-- /Checkmark List Style -->
				
			</section>
		</article>
		<!-- /One-quarter width content box -->
		
		<!-- One-quarter width content box -->
		<article class="content-box col-4">
			<header>
				<h2>AJAX Loading</h2>
			</header>
			<section>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis.</p>
				
				<!-- Attachment List Style -->
				<ul class="list-style-attach">
					<li>Lorem ipsum dolor sit</li>
					<li>Suspendisse et dignissim</li>
					<li>Maecenas id augue ac</li>
					<li>Sed pharetra placerat</li>
					<li>Phasellus aliquam males</li>
					<li>Nunc at dui id purus</li>
				</ul>
				<!-- /Attachment List Style -->
				
				<!-- AJAX Loading icons -->
				<span class="loading black" title="Loading, please wait&#8230;"></span>
				<span class="loading red" title="Loading, please wait&#8230;"></span>
				<span class="loading green" title="Loading, please wait&#8230;"></span>
				<span class="loading blue" title="Loading, please wait&#8230;"></span>
				<!-- /AJAX Loading icons -->
					
			</section>
		</article>
		<!-- /One-quarter width content box -->
		
		<!-- One-quarter width content box with Tip Box style -->
		<article class="content-box tip-box col-4 clear-rm">
			<header>
				<h2>Tip Box</h2>
			</header>
			<section>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis.</p>
				<h3>Maecenas id augue ac metus</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis.</p>
			</section>
		</article>
		<!-- /One-quarter width content box -->
		
		<div class="clearfix"></div> <!-- We're really sorry for this, but because of IE7 we still need separated div with clearfix -->
		
		<!-- Full width content box -->
		<article class="content-box minimizer">
			<header>
				<h2>Calendar and Wizard</h2>
				
				<!-- Content Box Tab Navigation -->
				<nav>
					<ul class="tab-switch">
						<li><a class="default-tab" href="#tab4">Calendar</a></li>
						<li><a href="#tab5">Sidetabs in tab</a></li>
						<li><a href="#tab6">Wizard</a></li>
					</ul>
				</nav>
				<!-- /Content Box Tab Navigation -->
				
			</header>
			<section>
				
				<!-- Tab Content #tab4 -->
				<div class="tab default-tab" id="tab4">
					<h3>jQuery Full Calendar Plugin</h3>
					
					<!-- jQuery Full Calendar Plugin -->
					<div class="fullcalendar"></div>
					<!-- /jQuery Full Calendar Plugin -->
				</div>
				<!-- /Tab Content #tab4 -->
				
				<!-- Tab Content #tab5 -->
				<div class="tab sidetabs" id="tab5">
					
					<!-- Side Tab Navigation -->
					<nav class="sidetab-switch">
						<ul>
							<li><a class="default-sidetab" href="#sidetab4">Logs</a></li>
							<li><a href="#sidetab5">Dashboard</a></li>
							<li><a href="#sidetab6">Code View</a></li>
						</ul>
						<p>Aenean facilisis ligula eget orci adipiscing varius. Curabitur sem ligula, egestas vel bibendum sed, sodales eu nulla. Vestibulum luctus aliquam feugiat. Donec porta interdum placerat.</p>
					</nav>
					<!-- /Side Tab Navigation -->
					
					<!-- Side Tab Content #sidetab4 -->
					<div class="sidetab default-sidetab" id="sidetab4">
						<h3>Logs or News</h3>
						
						<!-- Logs -->
						<ul class="logs">
						
							<!-- Log Item -->
							<li>
								<h4>Vivamus et nisl neque, vel volutpat tortor</h4>
								<p>Teger feugiat, lorem ac adipiscing tempor, urna dolor scelerisque justo, ac convallis lectus ligula at purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nisl arcu, viverra a feugiat ac, elementum vitae risus. Sed a ipsum sit amet neque posuere accumsan a eu lectus. Proin nec enim quis erat viverra gravida eget sit amet lectus.</p>
								<ul class="logs-actions">
									<li>By <strong>Birgir Danko</strong></li>
									<li>May 31th, 2011</li>
									<li>0 Comments</li>
									<li><a href="#">Report</a></li>
									<li><a href="#">View</a></li>
									<li><a href="#">Edit</a></li>
								</ul>
							</li>
							<!-- /Log Item -->
							
							<li>
								<h4>Donec et est eget dolor fringilla malesuada</h4>
								<p>Curabitur in velit vitae est faucibus ullamcorper. Etiam in ligula ac sem dictum blandit. Etiam arcu tellus, ullamcorper sed volutpat quis, condimentum eget elit. Cras accumsan elementum velit nec elementum. Curabitur mauris metus, porttitor id suscipit id, ultrices a dui.</p>
								<ul class="logs-actions">
									<li>By <strong>Roque Gedalyahu</strong></li>
									<li>May 30th, 2011</li>
									<li>7 Comments</li>
									<li><a href="#">Report</a></li>
									<li><a href="#">View</a></li>
									<li><a href="#">Edit</a></li>
								</ul>
							</li>
							<li>
								<h4>Nulla eget ligula elit</h4>
								<p>Curabitur in velit vitae est faucibus ullamcorper. Etiam in ligula ac sem dictum blandit. Etiam arcu tellus, ullamcorper sed volutpat quis, condimentum eget elit. Cras accumsan elementum velit nec elementum. Curabitur mauris metus, porttitor id suscipit id, ultrices a dui.</p>
								<ul class="logs-actions">
									<li>By <strong>Dariusz Eustorgios</strong></li>
									<li>May 30th, 2011</li>
									<li>2 Comments</li>
									<li><a href="#">Report</a></li>
									<li><a href="#">View</a></li>
									<li><a href="#">Edit</a></li>
								</ul>
							</li>
							<li>
								<h4>In metus nisi, accumsan ut rutrum vel, tristique a quam</h4>
								<p>Sed at felis libero, non sagittis ipsum. Aenean mauris erat, auctor eget sodales nec, euismod sed nunc. Integer accumsan egestas augue eu tincidunt. Etiam in orci ut enim ullamcorper sagittis.</p>
								<ul class="logs-actions">
									<li>By <strong>Paulie Luukas</strong></li>
									<li>May 29th, 2011</li>
									<li>10 Comments</li>
									<li><a href="#">Report</a></li>
									<li><a href="#">View</a></li>
									<li><a href="#">Edit</a></li>
								</ul>
							</li>
							<li>
								<h4>Quisque a eros eu quam commodo lacinia</h4>
								<p>Aliquam erat volutpat. Vivamus et nisl neque, vel volutpat tortor. Suspendisse blandit quam non turpis pharetra lobortis. Donec vitae facilisis quam. Cras nunc mi, consectetur facilisis bibendum ut, vehicula at ligula.</p>
								<ul class="logs-actions">
									<li>By <strong>Duff Mauno</strong></li>
									<li>May 27th, 2011</li>
									<li>31 Comments</li>
									<li><a href="#">Report</a></li>
									<li><a href="#">View</a></li>
									<li><a href="#">Edit</a></li>
								</ul>
							</li>
						</ul>
						<!-- /Logs -->
						
					</div>
					<!-- /Side Tab Content #sidetab4 -->
					
					<!-- Side Tab Content #sidetab5 -->
					<div class="sidetab" id="sidetab5">
						<h3>Dashboard</h3>
						
						<!-- Dashboard -->
						<ul class="dashboard">
							<li>
								<h4>Sales Today</h4>
								<ul>
									<li class="dashboard-stats">788 $</li>
									<li class="dashboard-actions">
										<a href="#" class="button">View</a>
									</li>
								</ul>
							</li>
							<li>
								<h4>Orders Today</h4>
								<ul>
									<li class="dashboard-stats">14</li>
									<li class="dashboard-actions">
										<a href="#" class="button">View</a>
									</li>
								</ul>
							</li>
							<li>
								<h4>Total Orders</h4>
								<ul>
									<li class="dashboard-stats">341</li>
									<li class="dashboard-actions">
										<a href="#" class="button">View</a>
									</li>
								</ul>
							</li>
							<li>
								<h4>Total Sales</h4>
								<ul>
									<li class="dashboard-stats">32K $</li>
									<li class="dashboard-actions">
										<a href="#" class="button">View</a>
									</li>
								</ul>
							</li>
						</ul>
						<!-- /Dashboard -->
						
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis. Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
						<p>Teger feugiat, lorem ac adipiscing tempor, urna dolor scelerisque justo, ac convallis lectus ligula at purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nisl arcu, viverra a feugiat ac, elementum vitae risus. Sed a ipsum sit amet neque posuere accumsan a eu lectus. Proin nec enim quis erat viverra gravida eget sit amet lectus.</p>
						<p>Curabitur in velit vitae est faucibus ullamcorper. Etiam in ligula ac sem dictum blandit. Etiam arcu tellus, ullamcorper sed volutpat quis, condimentum eget elit. Cras accumsan elementum velit nec elementum. Curabitur mauris metus, porttitor id suscipit id, ultrices a dui.</p>
						
					</div>
					<!-- /Side Tab Content #sidetab5 -->
					
					<!-- Side Tab Content #sidetab6 -->
					<div class="sidetab" id="sidetab6">
						<h3>Code View with jQuery Snippet plugin</h3>
						<p>Snippet is a jQuery syntax highlighting plugin built on top of the SHJS script found on SourceForge. Snippet provides a quick and easy way of highlighting source code passages in HTML documents.</p>
						
<h4>CSS</h4>
<pre class="cssCode">
body #main p.navy {
	text-decoration: none;
	color: navy;
	font-family: arial;
	/* font-size: 12pt; */
	font-size: 14px;
	font-weight: medium;
}
</pre>

<h4>JAVASCRIPT</h4>
<pre class="jsCode">
var a = document.getElementById("me");
function myFunc(foo) {
	var bar = foo.innerHTML;
	// comment
	alert("Text is: "+bar);
	return false;
}
myFunc(a);
</pre>

<h4>PHP</h4>
<pre class="phpCode">
&lt;?php
session_start();
if(!$_SESSION['logged']){
	header("Location: login.php");
	exit;
}
echo 'Welcome, '.$_SESSION['user'];
?&gt;
</pre>
					<p>Snippet is packed with 39 styles to choose from! See the homepage for more details <a href="http://www.steamdev.com/snippet/" class="outside">www.steamdev.com/snippet/</a>.</p>
					
					</div>
					<!-- /Side Tab Content #sidetab6 -->
					
				</div>
				<!-- /Tab Content #tab5 -->
				
				<!-- Tab Content #tab6 -->
				<div class="tab" id="tab6">
					<h3>Wizard</h3>
					
					<!-- Wizard -->
					<!-- Wizard Steps -->
					<ol class="wizard-steps">
						<li><a href="#step1">Register</a><span>1</span></li>
						<li><a href="#step2">Personal Information</a><span>2</span></li>
						<li><a href="#step3">Payment Information</a><span>3</span></li>
						<li><a href="#step4">Confirmation</a><span>4</span></li>
					</ol>
					<!-- /Wizard Steps -->
					
					<!-- Wizard Item -->
					<div id="step1" class="wizard-content">
						<h4>Wizard Step 1</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat dapibus tortor quis sodales. Mauris convallis lobortis justo a facilisis. Aenean mollis lacus ac nunc bibendum tempus. Proin laoreet, ante id convallis aliquet, leo orci placerat nisi, nec suscipit mi tortor at enim. Mauris eu augue a lectus tempus sagittis. Fusce lacinia suscipit velit, quis commodo eros tincidunt fringilla.</p>
						<p>In eget nulla nec neque condimentum luctus non non justo. Sed at felis libero, non sagittis ipsum. Aenean mauris erat, auctor eget sodales nec, euismod sed nunc. Integer accumsan egestas augue eu tincidunt. Etiam in orci ut enim ullamcorper sagittis. Maecenas pharetra lorem vitae nulla rhoncus quis aliquet nisl tincidunt. Mauris malesuada purus in augue ultrices lacinia. Praesent a nunc at eros hendrerit molestie a a est. Integer nec est in nulla volutpat lacinia quis dapibus magna. Etiam eu justo nec magna imperdiet rutrum. Suspendisse imperdiet condimentum lacus ac condimentum.</p>
						<a class="wizard-next" href="#step2">Next step &raquo;</a>
					</div>
					<!--/ Wizard Item -->
					
					<div id="step2" class="wizard-content">
						<h4>Wizard Step 2</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat dapibus tortor quis sodales. Mauris convallis lobortis justo a facilisis. Aenean mollis lacus ac nunc bibendum tempus. Proin laoreet, ante id convallis aliquet, leo orci placerat nisi, nec suscipit mi tortor at enim. Mauris eu augue a lectus tempus sagittis. Fusce lacinia suscipit velit, quis commodo eros tincidunt fringilla.</p>
						<p>In eget nulla nec neque condimentum luctus non non justo. Sed at felis libero, non sagittis ipsum. Aenean mauris erat, auctor eget sodales nec, euismod sed nunc. Integer accumsan egestas augue eu tincidunt. Etiam in orci ut enim ullamcorper sagittis. Maecenas pharetra lorem vitae nulla rhoncus quis aliquet nisl tincidunt. Mauris malesuada purus in augue ultrices lacinia. Praesent a nunc at eros hendrerit molestie a a est. Integer nec est in nulla volutpat lacinia quis dapibus magna. Etiam eu justo nec magna imperdiet rutrum. Suspendisse imperdiet condimentum lacus ac condimentum.</p>
						<a class="wizard-next" href="#step3">Next step &raquo;</a>
					</div>
					<div id="step3" class="wizard-content">
						<h4>Wizard Step 3</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat dapibus tortor quis sodales. Mauris convallis lobortis justo a facilisis. Aenean mollis lacus ac nunc bibendum tempus. Proin laoreet, ante id convallis aliquet, leo orci placerat nisi, nec suscipit mi tortor at enim. Mauris eu augue a lectus tempus sagittis. Fusce lacinia suscipit velit, quis commodo eros tincidunt fringilla.</p>
						<p>In eget nulla nec neque condimentum luctus non non justo. Sed at felis libero, non sagittis ipsum. Aenean mauris erat, auctor eget sodales nec, euismod sed nunc. Integer accumsan egestas augue eu tincidunt. Etiam in orci ut enim ullamcorper sagittis. Maecenas pharetra lorem vitae nulla rhoncus quis aliquet nisl tincidunt. Mauris malesuada purus in augue ultrices lacinia. Praesent a nunc at eros hendrerit molestie a a est. Integer nec est in nulla volutpat lacinia quis dapibus magna. Etiam eu justo nec magna imperdiet rutrum. Suspendisse imperdiet condimentum lacus ac condimentum.</p>
						<a class="wizard-next" href="#step4">Next step &raquo;</a>
					</div>
					<div id="step4" class="wizard-content">
						<h4>Wizard Step 4</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat dapibus tortor quis sodales. Mauris convallis lobortis justo a facilisis. Aenean mollis lacus ac nunc bibendum tempus. Proin laoreet, ante id convallis aliquet, leo orci placerat nisi, nec suscipit mi tortor at enim. Mauris eu augue a lectus tempus sagittis. Fusce lacinia suscipit velit, quis commodo eros tincidunt fringilla.</p>
						<p>In eget nulla nec neque condimentum luctus non non justo. Sed at felis libero, non sagittis ipsum. Aenean mauris erat, auctor eget sodales nec, euismod sed nunc. Integer accumsan egestas augue eu tincidunt. Etiam in orci ut enim ullamcorper sagittis. Maecenas pharetra lorem vitae nulla rhoncus quis aliquet nisl tincidunt. Mauris malesuada purus in augue ultrices lacinia. Praesent a nunc at eros hendrerit molestie a a est. Integer nec est in nulla volutpat lacinia quis dapibus magna. Etiam eu justo nec magna imperdiet rutrum. Suspendisse imperdiet condimentum lacus ac condimentum.</p>
						<a href="#">Save</a>
					</div>
					<!-- /Wizard -->
					
				</div>
				<!-- /Tab Content #tab6 -->
				
			</section>
			<footer>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum aliquet nisi ac risus tincidunt gravida. Cras imperdiet mattis nisl et suscipit.</footer>
		</article>
		<!-- /Full width content box -->
		
		<!-- Half width content box -->
		<article class="content-box minimizer col-2">
			<header>
				<h2>Contacts</h2>
			</header>
			<section>
			
				<!-- Contacts -->
				<ul class="contacts">
					
					<!-- Contacts item -->
					<li>
						<img src="img/icons/icon_avatar.jpg" alt="Sample Avatar">
						<ul>
							<li><strong>Duff Mauno</strong></li>
							<li><em>Account Manager</em></li>
							<li><a href="#">View Details</a></li>
						</ul>
					</li>
					<!-- /Contacts item -->
					
					<li>
						<img src="img/icons/icon_avatar.jpg" alt="Sample Avatar">
						<ul>
							<li><strong>Tavish Fedmid</strong></li>
							<li><em>Site Admin</em></li>
							<li><a href="#">View Details</a></li>
						</ul>
					</li>
					<li>
						<img src="img/icons/icon_avatar.jpg" alt="Sample Avatar">
						<ul>
							<li><a href="#">Dr. Wes Ture</a></li>
							<li><em>Site Admin</em></li>
							<li><a href="#">View Details</a></li>
						</ul>
					</li>
					<li>
						<img src="img/icons/icon_avatar.jpg" alt="Sample Avatar">
						<ul>
							<li><a href="#">Yared Markus</a></li>
							<li><em>Editor</em></li>
							<li><a href="#">View Details</a></li>
						</ul>
					</li>
					<li>
						<img src="img/icons/icon_avatar.jpg" alt="Sample Avatar">
						<ul>
							<li><a href="#">Bernard Dubls</a></li>
							<li><em>Editor</em></li>
							<li><a href="#">View Details</a></li>
						</ul>
					</li>
				</ul>
				<!-- /Contacts -->
				
			</section>
		</article>
		<!-- /Half width content box -->
		
		<!-- Half width content box -->
		<article class="content-box col-2 clear-rm">
			<header>
				<h2>Icons</h2>
			</header>
			<section>
				<h3>Emoticons</h3>
				<p>We have made for you simple predefined emoticons. Use class .emoticon with mood class of your choice (.emoticon .smile).</p>
				
				<!-- Emoticons -->
				<p><span class="emoticon smile">:smile:</span> <span class="emoticon grin">:grin:</span> <span class="emoticon evilgrin">:evilgrin:</span> <span class="emoticon happy">:happy:</span> <span class="emoticon surprised">:surprised:</span> <span class="emoticon tongue">:tongue:</span> <span class="emoticon unhappy">:unhappy:</span> <span class="emoticon waii">:waii:</span> <span class="emoticon wink">:wink:</span> <span class="emoticon bug">:bug:</span> <span class="emoticon heart">:heart:</span> <span class="emoticon basketball">:basketball:</span> <span class="emoticon soccer">:soccer:</span> <span class="emoticon tennis">:tennis:</span> <span class="emoticon golf">:golf:</span> <span class="emoticon football">:football:</span> <span class="emoticon up">:up:</span> <span class="emoticon down">:down:</span></p>
				<!-- /Emoticons -->
				
				<h3>File Extension</h3>
				<p>Tachyon Admin comes also with special predefined file extension styles. Use class .extension with file type class to add extension icon (.extension .cplusplus) to any element.</p>
				
				<!-- File extensions -->
				<ul class="fleft">
					<li><span class="extension empty">Empty document</span></li>
					<li><span class="extension acrobat">Acrobat document</span></li>
					<li><span class="extension code">Code document</span></li>
					<li><span class="extension c">C document</span></li>
					<li><span class="extension cplusplus">C++ document</span></li>
					<li><span class="extension csharp">C# document</span></li>
					<li><span class="extension database">Database document</span></li>
				</ul>
				<ul class="fleft">
					<li><span class="extension excel">Excel document</span></li>
					<li><span class="extension flash">Flash document</span></li>
					<li><span class="extension msoffice">MS Office document</span></li>
					<li><span class="extension php">PHP document</span></li>
					<li><span class="extension powerpoint">Powerpoint document</span></li>
					<li><span class="extension picture">Picture document</span></li>
					<li><span class="extension ruby">Ruby document</span></li>
				</ul>
				<ul class="fleft">
					<li><span class="extension text">Text document</span></li>
					<li><span class="extension tux">Tux document</span></li>
					<li><span class="extension word">Word document</span></li>
					<li><span class="extension visualstudio">Visual Studio document</span></li>
					<li><span class="extension zip">Zip document</span></li>
				</ul>
				<!-- /File extensions -->
				
			</section>
			<footer>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum aliquet nisi ac risus tincidunt gravida. Cras imperdiet mattis nisl et suscipit.</footer>
		</article>
		<!-- /Half width content box -->
		
		<div class="clearfix"></div> <!-- We're really sorry for this, but because of IE7 we still need separated div with clearfix -->
		
		<!-- Full width content box -->
		<article class="content-box minimizer">
			<header>
				<h2>Buttons</h2>
			</header>
			<section>
				<h3>Icon Buttons</h3>
				<button class="icon red"><img src="img/icons/buttons/abacus.png" title="Abacus"></button>
				<button class="icon blue"><img src="img/icons/buttons/acces_denied_sign.png" alt="Acces Denied Sign"></button>
				<button class="icon green"><img src="img/icons/buttons/address_book.png" alt="Address Book"></button>
				<button class="icon black"><img src="img/icons/buttons/admin_user_2.png" alt="Admin User 2"></button>
				<button class="icon"><img src="img/icons/buttons/admin_user.png" alt="Admin User"><span>Admin User</span></button>
				<button class="icon"><img src="img/icons/buttons/airplane.png" alt="Airplane"></button>
				<button class="icon"><img src="img/icons/buttons/alarm_bell_2.png" alt="alarm bell 2"></button>
				<button class="icon"><img src="img/icons/buttons/alarm_bell.png" alt="alarm bell"></button>
				<button class="icon"><img src="img/icons/buttons/alarm_clock.png" alt="Alarm Clock"></button>
				<button class="icon"><img src="img/icons/buttons/alert_2.png" alt="Alert 2"></button>
				<button class="icon"><img src="img/icons/buttons/alert.png" alt="Alert"></button>
				<button class="icon"><img src="img/icons/buttons/android.png" alt="Android"></button>
				<button class="icon"><img src="img/icons/buttons/apartment_building.png" alt="Apartment Building"></button>
				<button class="icon"><img src="img/icons/buttons/archive.png" alt="Archive"></button>
				<button class="icon"><img src="img/icons/buttons/bag.png" alt="Bag"></button>
				<button class="icon"><img src="img/icons/buttons/balloons.png" alt="Balloons"></button>
				<button class="icon"><img src="img/icons/buttons/bandaid.png" alt="Bandaid"></button>
				<button class="icon"><img src="img/icons/buttons/battery_almost_empty.png" alt="Battery Almost Empty"></button>
				<button class="icon"><img src="img/icons/buttons/battery_almost_full.png" alt="Battery Almost Full"></button>
				<button class="icon"><img src="img/icons/buttons/battery_empty.png" alt="Battery Empty"></button>
				<button class="icon"><img src="img/icons/buttons/battery_full.png" alt="Battery Full"></button>
				<button class="icon"><img src="img/icons/buttons/battery.png" alt="Battery"></button>
				<button class="icon"><img src="img/icons/buttons/bended_arrow_down.png" alt="Bended arrow down"></button>
				<button class="icon"><img src="img/icons/buttons/bended_arrow_left.png" alt="Bended arrow left"></button>
				<button class="icon"><img src="img/icons/buttons/bended_arrow_right.png" alt="Bended arrow right"></button>
				<button class="icon"><img src="img/icons/buttons/bended_arrow_up.png" alt="Bended arrow up"></button>
				<button class="icon"><img src="img/icons/buttons/big_brush.png" alt="Big Brush"></button>
				<button class="icon"><img src="img/icons/buttons/blackberry.png" alt="Blackberry"></button>
				<button class="icon"><img src="img/icons/buttons/blocks_images.png" alt="blocks images"></button>
				<button class="icon"><img src="img/icons/buttons/blu-ray.png" alt="Blu-ray"></button>
				<button class="icon"><img src="img/icons/buttons/bluetooth_2.png" alt="skin_colour bluetooth 2"></button>
				<button class="icon"><img src="img/icons/buttons/bluetooth.png" alt="skin_colour bluetooth"></button>
				<button class="icon"><img src="img/icons/buttons/book_Large.png" alt="Book Large"></button>
				<button class="icon"><img src="img/icons/buttons/book.png" alt="Book"></button>
				<button class="icon"><img src="img/icons/buttons/books.png" alt="Books"></button>
				<button class="icon"><img src="img/icons/buttons/box_Incoming.png" alt="Box Incoming"></button>
				<button class="icon"><img src="img/icons/buttons/box_outgoing.png" alt="Box Outgoing"></button>
				<button class="icon"><img src="img/icons/buttons/Bulls_eye.png" alt="Bulls Eye"></button>
				<button class="icon"><img src="img/icons/buttons/calculator.png" alt="Calculator"></button>
				<button class="icon"><img src="img/icons/buttons/camera_2.png" alt="Camera 2"></button>
				<button class="icon"><img src="img/icons/buttons/camera.png" alt="Camera"></button>
				<button class="icon"><img src="img/icons/buttons/car.png" alt="Car"></button>
				<button class="icon"><img src="img/icons/buttons/cash_register.png" alt="Cash Register"></button>
				<button class="icon"><img src="img/icons/buttons/cassette.png" alt="Cassette"></button>
				<button class="icon"><img src="img/icons/buttons/cat.png" alt="Cat"></button>
				<button class="icon"><img src="img/icons/buttons/cd.png" alt="CD"></button>
				<button class="icon"><img src="img/icons/buttons/chair.png" alt="Chair"></button>
				<button class="icon"><img src="img/icons/buttons/chart_2.png" alt="Chart 2"></button>
				<button class="icon"><img src="img/icons/buttons/chart_3.png" alt="Chart 3"></button>
				<button class="icon"><img src="img/icons/buttons/chart_4.png" alt="Chart 4"></button>
				<button class="icon"><img src="img/icons/buttons/chart_5.png" alt="Chart 5"></button>
				<button class="icon"><img src="img/icons/buttons/chart_6.png" alt="Chart 6"></button>
				<button class="icon"><img src="img/icons/buttons/chart_7.png" alt="Chart 7"></button>
				<button class="icon"><img src="img/icons/buttons/chart_8.png" alt="Chart 8"></button>
				<button class="icon"><img src="img/icons/buttons/chart.png" alt="Chart"></button>
				<button class="icon"><img src="img/icons/buttons/chemical.png" alt="Chemical"></button>
				<button class="icon"><img src="img/icons/buttons/chrome.png" alt="Chrome"></button>
				<button class="icon"><img src="img/icons/buttons/clipboard.png" alt="Clipboard"></button>
				<button class="icon"><img src="img/icons/buttons/clock.png" alt="Clock"></button>
				<button class="icon"><img src="img/icons/buttons/cloud_download.png" alt="Cloud download"></button>
				<button class="icon"><img src="img/icons/buttons/cloud_upload.png" alt="Cloud upload"></button>
				<button class="icon"><img src="img/icons/buttons/cloud.png" alt="Cloud"></button>
				<button class="icon"><img src="img/icons/buttons/cog_2.png" alt="Cog 2"></button>
				<button class="icon"><img src="img/icons/buttons/cog_3.png" alt="Cog 3"></button>
				<button class="icon"><img src="img/icons/buttons/cog_4.png" alt="Cog 4"></button>
				<button class="icon"><img src="img/icons/buttons/cog.png" alt="Cog"></button>
				<button class="icon"><img src="img/icons/buttons/companies.png" alt="Companies"></button>
				<button class="icon"><img src="img/icons/buttons/computer_imac.png" alt="Computer_iMac"></button>
				<button class="icon"><img src="img/icons/buttons/coverflow.png" alt="Coverflow"></button>
				<button class="icon"><img src="img/icons/buttons/create_write.png" alt="create write"></button>
				<button class="icon"><img src="img/icons/buttons/cup.png" alt="Cup"></button>
				<button class="icon"><img src="img/icons/buttons/cut_scissors.png" alt="cut scissors"></button>
				<button class="icon"><img src="img/icons/buttons/day_Calendar.png" alt="Day Calendar"></button>
				<button class="icon"><img src="img/icons/buttons/delicious.png" alt="Delicious"></button>
				<button class="icon"><img src="img/icons/buttons/digg_2.png" alt="Digg 2"></button>
				<button class="icon"><img src="img/icons/buttons/digg.png" alt="Digg"></button>
				<button class="icon"><img src="img/icons/buttons/document.png" alt="Document"></button>
				<button class="icon"><img src="img/icons/buttons/documents.png" alt="Documents"></button>
				<button class="icon"><img src="img/icons/buttons/download_to_computer.png" alt="download To Computer"></button>
				<button class="icon"><img src="img/icons/buttons/download.png" alt="download"></button>
				<button class="icon"><img src="img/icons/buttons/dress.png" alt="Dress"></button>
				<button class="icon"><img src="img/icons/buttons/dribbble_2.png" alt="Dribbble 2"></button>
				<button class="icon"><img src="img/icons/buttons/dribbble.png" alt="Dribbble"></button>
				<button class="icon"><img src="img/icons/buttons/dropbox.png" alt="Dropbox"></button>
				<button class="icon"><img src="img/icons/buttons/drupal.png" alt="Drupal"></button>
				<button class="icon"><img src="img/icons/buttons/dVD.png" alt="DVD"></button>
				<button class="icon"><img src="img/icons/buttons/electricity_input.png" alt="Electricity Input"></button>
				<button class="icon"><img src="img/icons/buttons/electricity_plug.png" alt="Electricity Plug"></button>
				<button class="icon"><img src="img/icons/buttons/excel_document.png" alt="Excel Document"></button>
				<button class="icon"><img src="img/icons/buttons/excel_documents.png" alt="Excel Documents"></button>
				<button class="icon"><img src="img/icons/buttons/exit.png" alt="Exit"></button>
				<button class="icon"><img src="img/icons/buttons/expose.png" alt="Exposé"></button>
				<button class="icon"><img src="img/icons/buttons/expression_engine.png" alt="Expression Engine"></button>
				<button class="icon"><img src="img/icons/buttons/eyedropper.png" alt="Eyedropper"></button>
				<button class="icon"><img src="img/icons/buttons/facebook_like.png" alt="Facebook Like"></button>
				<button class="icon"><img src="img/icons/buttons/facebook.png" alt="Facebook"></button>
				<button class="icon"><img src="img/icons/buttons/fax.png" alt="Fax"></button>
				<button class="icon"><img src="img/icons/buttons/female_contour.png" alt="Female Contour"></button>
				<button class="icon"><img src="img/icons/buttons/female_symbol.png" alt="Female symbol"></button>
				<button class="icon"><img src="img/icons/buttons/file_cabinet.png" alt="File Cabinet"></button>
				<button class="icon"><img src="img/icons/buttons/film_camera.png" alt="Film Camera"></button>
				<button class="icon"><img src="img/icons/buttons/film_strip_2.png" alt="Film Strip 2"></button>
				<button class="icon"><img src="img/icons/buttons/film_strip.png" alt="Film Strip"></button>
				<button class="icon"><img src="img/icons/buttons/finish_flag.png" alt="Finish Flag"></button>
				<button class="icon"><img src="img/icons/buttons/firefox.png" alt="Firefox"></button>
				<button class="icon"><img src="img/icons/buttons/flag_2.png" alt="Flag 2"></button>
				<button class="icon"><img src="img/icons/buttons/flag.png" alt="Flag"></button>
				<button class="icon"><img src="img/icons/buttons/folder.png" alt="Folder"></button>
				<button class="icon"><img src="img/icons/buttons/footprints.png" alt="Footprints"></button>
				<button class="icon"><img src="img/icons/buttons/fountain_pen.png" alt="Fountain Pen"></button>
				<button class="icon"><img src="img/icons/buttons/frames.png" alt="Frames"></button>
				<button class="icon"><img src="img/icons/buttons/globe_2.png" alt="Globe 2"></button>
				<button class="icon"><img src="img/icons/buttons/globe.png" alt="Globe"></button>
				<button class="icon"><img src="img/icons/buttons/go_back_from_full_screen.png" alt="Go Back From Full Screen"></button>
				<button class="icon"><img src="img/icons/buttons/go_back_from_screen.png" alt="Go Back From Screen"></button>
				<button class="icon"><img src="img/icons/buttons/go_full_screen.png" alt="Go Full Screen"></button>
				<button class="icon"><img src="img/icons/buttons/google_buzz.png" alt="Google Buzz"></button>
				<button class="icon"><img src="img/icons/buttons/google_maps.png" alt="Google Maps"></button>
				<button class="icon"><img src="img/icons/buttons/graph.png" alt="Graph"></button>
				<button class="icon"><img src="img/icons/buttons/hd_2.png" alt="HD 2"></button>
				<button class="icon"><img src="img/icons/buttons/hd_3.png" alt="HD 3"></button>
				<button class="icon"><img src="img/icons/buttons/hd.png" alt="HD"></button>
				<button class="icon"><img src="img/icons/buttons/headphones.png" alt="Headphones"></button>
				<button class="icon"><img src="img/icons/buttons/help.png" alt="Help"></button>
				<button class="icon"><img src="img/icons/buttons/home_2.png" alt="Home 2"></button>
				<button class="icon"><img src="img/icons/buttons/home.png" alt="Home"></button>
				<button class="icon"><img src="img/icons/buttons/ice_cream_2.png" alt="Ice Cream 2"></button>
				<button class="icon"><img src="img/icons/buttons/ice_cream.png" alt="Ice Cream"></button>
				<button class="icon"><img src="img/icons/buttons/ichat.png" alt="iChat"></button>
				<button class="icon"><img src="img/icons/buttons/image_2.png" alt="Image 2"></button>
				<button class="icon"><img src="img/icons/buttons/image.png" alt="Image"></button>
				<button class="icon"><img src="img/icons/buttons/image2_2.png" alt="Image2 2"></button>
				<button class="icon"><img src="img/icons/buttons/images.png" alt="Images"></button>
				<button class="icon"><img src="img/icons/buttons/inbox.png" alt="Inbox"></button>
				<button class="icon"><img src="img/icons/buttons/info_about.png" alt="info about"></button>
				<button class="icon"><img src="img/icons/buttons/iPad.png" alt="iPad"></button>
				<button class="icon"><img src="img/icons/buttons/iPhone_3g.png" alt="iPhone 3(G)"></button>
				<button class="icon"><img src="img/icons/buttons/iPhone_4.png" alt="iPhone 4"></button>
				<button class="icon"><img src="img/icons/buttons/iPod_classic.png" alt="iPod Classic"></button>
				<button class="icon"><img src="img/icons/buttons/iPod_nano.png" alt="iPod Nano"></button>
				<button class="icon"><img src="img/icons/buttons/joomla.png" alt="Joomla"></button>
				<button class="icon"><img src="img/icons/buttons/key_2.png" alt="Key 2"></button>
				<button class="icon"><img src="img/icons/buttons/key.png" alt="Key"></button>
				<button class="icon"><img src="img/icons/buttons/ladies_purse.png" alt="Lady's Purse"></button>
				<button class="icon"><img src="img/icons/buttons/lamp.png" alt="Lamp"></button>
				<button class="icon"><img src="img/icons/buttons/laptop.png" alt="Laptop"></button>
				<button class="icon"><img src="img/icons/buttons/lastfm_2.png" alt="LastFM 2"></button>
				<button class="icon"><img src="img/icons/buttons/lemonade_stand.png" alt="Lemonade Stand"></button>
				<button class="icon"><img src="img/icons/buttons/light_bulb.png" alt="Light bulb"></button>
				<button class="icon"><img src="img/icons/buttons/link_2.png" alt="Link 2"></button>
				<button class="icon"><img src="img/icons/buttons/link.png" alt="Link"></button>
				<button class="icon"><img src="img/icons/buttons/linux.png" alt="Linux"></button>
				<button class="icon"><img src="img/icons/buttons/list_w__image.png" alt="List w_ Image"></button>
				<button class="icon"><img src="img/icons/buttons/list_w__images.png" alt="List w_ Images"></button>
				<button class="icon"><img src="img/icons/buttons/list.png" alt="List"></button>
				<button class="icon"><img src="img/icons/buttons/loading_Bar.png" alt="Loading Bar"></button>
				<button class="icon"><img src="img/icons/buttons/locked_2.png" alt="Locked 2"></button>
				<button class="icon"><img src="img/icons/buttons/locked.png" alt="Locked"></button>
				<button class="icon"><img src="img/icons/buttons/macos.png" alt="MacOS"></button>
				<button class="icon"><img src="img/icons/buttons/magic_mouse.png" alt="Magic Mouse"></button>
				<button class="icon"><img src="img/icons/buttons/magnifying_glass.png" alt="Magnifying Glass"></button>
				<button class="icon"><img src="img/icons/buttons/mail.png" alt="Mail"></button>
				<button class="icon"><img src="img/icons/buttons/male_contour.png" alt="Male Contour"></button>
				<button class="icon"><img src="img/icons/buttons/male_symbol.png" alt="Male symbol"></button>
				<button class="icon"><img src="img/icons/buttons/map.png" alt="Map"></button>
				<button class="icon"><img src="img/icons/buttons/marker.png" alt="Marker"></button>
				<button class="icon"><img src="img/icons/buttons/medical_case.png" alt="Medical Case"></button>
				<button class="icon"><img src="img/icons/buttons/megaphone.png" alt="Megaphone"></button>
				<button class="icon"><img src="img/icons/buttons/microphone.png" alt="Microphone"></button>
				<button class="icon"><img src="img/icons/buttons/mighty_mouse.png" alt="Mighty Mouse"></button>
				<button class="icon"><img src="img/icons/buttons/mobile_phone.png" alt="Mobile Phone"></button>
				<button class="icon"><img src="img/icons/buttons/mobypicture.png" alt="MobyPicture"></button>
				<button class="icon"><img src="img/icons/buttons/money_2.png" alt="Money 2"></button>
				<button class="icon"><img src="img/icons/buttons/money.png" alt="Money"></button>
				<button class="icon"><img src="img/icons/buttons/monitor.png" alt="Monitor"></button>
				<button class="icon"><img src="img/icons/buttons/month_calendar.png" alt="Month Calendar"></button>
				<button class="icon"><img src="img/icons/buttons/mouse_wires.png" alt="Mouse Wires"></button>
				<button class="icon"><img src="img/icons/buttons/myspace_2.png" alt="MySpace 2"></button>
				<button class="icon"><img src="img/icons/buttons/note_book.png" alt="Note Book"></button>
				<button class="icon"><img src="img/icons/buttons/pacman_ghost.png" alt="Pacman Ghost"></button>
				<button class="icon"><img src="img/icons/buttons/pacman.png" alt="Pacman"></button>
				<button class="icon"><img src="img/icons/buttons/paint_brush.png" alt="Paint Brush"></button>
				<button class="icon"><img src="img/icons/buttons/pants.png" alt="Pants"></button>
				<button class="icon"><img src="img/icons/buttons/paperclip.png" alt="Paperclip"></button>
				<button class="icon"><img src="img/icons/buttons/paypal_2.png" alt="Paypal 2"></button>
				<button class="icon"><img src="img/icons/buttons/paypal_3.png" alt="PayPal 3"></button>
				<button class="icon"><img src="img/icons/buttons/paypal.png" alt="Paypal"></button>
				<button class="icon"><img src="img/icons/buttons/pdf_document.png" alt="PDF Document"></button>
				<button class="icon"><img src="img/icons/buttons/pdf_documents.png" alt="PDF Documents"></button>
				<button class="icon"><img src="img/icons/buttons/pencil.png" alt="Pencil"></button>
				<button class="icon"><img src="img/icons/buttons/phone_3.png" alt="Phone 3"></button>
				<button class="icon"><img src="img/icons/buttons/phone_hook.png" alt="Phone Hook"></button>
				<button class="icon"><img src="img/icons/buttons/phone.png" alt="Phone"></button>
				<button class="icon"><img src="img/icons/buttons/piggy_bank.png" alt="Piggy Bank"></button>
				<button class="icon"><img src="img/icons/buttons/plane_suitcase.png" alt="Plane Suitcase"></button>
				<button class="icon"><img src="img/icons/buttons/plixi.png" alt="Plixi"></button>
				<button class="icon"><img src="img/icons/buttons/post_card.png" alt="Post Card"></button>
				<button class="icon"><img src="img/icons/buttons/power.png" alt="Power"></button>
				<button class="icon"><img src="img/icons/buttons/powerpoint_document.png" alt="PowerPoint Document"></button>
				<button class="icon"><img src="img/icons/buttons/powerpoint_documents.png" alt="PowerPoint Documents"></button>
				<button class="icon"><img src="img/icons/buttons/presentation.png" alt="Presentation"></button>
				<button class="icon"><img src="img/icons/buttons/preview.png" alt="Preview"></button>
				<button class="icon"><img src="img/icons/buttons/price_tag.png" alt="Price Tag"></button>
				<button class="icon"><img src="img/icons/buttons/price_tags.png" alt="Price Tags"></button>
				<button class="icon"><img src="img/icons/buttons/printer.png" alt="Printer"></button>
				<button class="icon"><img src="img/icons/buttons/radio.png" alt="Radio"></button>
				<button class="icon"><img src="img/icons/buttons/record.png" alt="Record"></button>
				<button class="icon"><img src="img/icons/buttons/recycle_symbol.png" alt="Recycle Symbol"></button>
				<button class="icon"><img src="img/icons/buttons/refresh_2.png" alt="Refresh 2"></button>
				<button class="icon"><img src="img/icons/buttons/refresh_3.png" alt="Refresh 3"></button>
				<button class="icon"><img src="img/icons/buttons/refresh_4.png" alt="Refresh 4"></button>
				<button class="icon"><img src="img/icons/buttons/refresh.png" alt="Refresh"></button>
				<button class="icon"><img src="img/icons/buttons/repeat.png" alt="Repeat"></button>
				<button class="icon"><img src="img/icons/buttons/robot.png" alt="Robot"></button>
				<button class="icon"><img src="img/icons/buttons/rss.png" alt="RSS"></button>
				<button class="icon"><img src="img/icons/buttons/ruler_2.png" alt="Ruler 2"></button>
				<button class="icon"><img src="img/icons/buttons/ruler.png" alt="Ruler"></button>
				<button class="icon"><img src="img/icons/buttons/running_man.png" alt="Running Man"></button>
				<button class="icon"><img src="img/icons/buttons/safari.png" alt="Safari"></button>
				<button class="icon"><img src="img/icons/buttons/scan_label_2.png" alt="Scan Label 2"></button>
				<button class="icon"><img src="img/icons/buttons/sD_2.png" alt="SD 2"></button>
				<button class="icon"><img src="img/icons/buttons/sd_3.png" alt="SD 3"></button>
				<button class="icon"><img src="img/icons/buttons/sd.png" alt="SD"></button>
				<button class="icon"><img src="img/icons/buttons/settings_2.png" alt="Settings 2"></button>
				<button class="icon"><img src="img/icons/buttons/settings.png" alt="Settings"></button>
				<button class="icon"><img src="img/icons/buttons/shopping_bag.png" alt="Shopping Bag"></button>
				<button class="icon"><img src="img/icons/buttons/shopping_basket_1.png" alt="Shopping Basket 1"></button>
				<button class="icon"><img src="img/icons/buttons/shopping_basket_2.png" alt="Shopping Basket 2"></button>
				<button class="icon"><img src="img/icons/buttons/shopping_cart_2.png" alt="Shopping Cart 2"></button>
				<button class="icon"><img src="img/icons/buttons/shopping_cart_3.png" alt="Shopping Cart 3"></button>
				<button class="icon"><img src="img/icons/buttons/shopping_cart_4.png" alt="Shopping Cart 4"></button>
				<button class="icon"><img src="img/icons/buttons/shopping_cart.png" alt="Shopping Cart"></button>
				<button class="icon"><img src="img/icons/buttons/shuffle.png" alt="Shuffle"></button>
				<button class="icon"><img src="img/icons/buttons/sign_post.png" alt="Sign Post"></button>
				<button class="icon"><img src="img/icons/buttons/skype.png" alt="Skype"></button>
				<button class="icon"><img src="img/icons/buttons/sleeveless_shirt.png" alt="Sleeveless Shirt"></button>
				<button class="icon"><img src="img/icons/buttons/small_brush.png" alt="Small Brush"></button>
				<button class="icon"><img src="img/icons/buttons/socks.png" alt="Socks"></button>
				<button class="icon"><img src="img/icons/buttons/sound.png" alt="Sound"></button>
				<button class="icon"><img src="img/icons/buttons/speech_bubble_2.png" alt="Speech Bubble 2"></button>
				<button class="icon"><img src="img/icons/buttons/speech_bubble.png" alt="Speech Bubble"></button>
				<button class="icon"><img src="img/icons/buttons/speech_bubbles_2.png" alt="Speech Bubbles 2"></button>
				<button class="icon"><img src="img/icons/buttons/speech_bubbles.png" alt="Speech Bubbles"></button>
				<button class="icon"><img src="img/icons/buttons/sport_shirt.png" alt="Sport Shirt"></button>
				<button class="icon"><img src="img/icons/buttons/stop_watch.png" alt="Stop Watch"></button>
				<button class="icon"><img src="img/icons/buttons/strategy_2.png" alt="Strategy 2"></button>
				<button class="icon"><img src="img/icons/buttons/strategy.png" alt="Strategy"></button>
				<button class="icon"><img src="img/icons/buttons/stubleupon.png" alt="Stubleupon"></button>
				<button class="icon"><img src="img/icons/buttons/suitcase.png" alt="Suitcase"></button>
				<button class="icon"><img src="img/icons/buttons/sweater.png" alt="Sweater"></button>
				<button class="icon"><img src="img/icons/buttons/t-shirt.png" alt="T-Shirt"></button>
				<button class="icon"><img src="img/icons/buttons/table.png" alt="Table"></button>
				<button class="icon"><img src="img/icons/buttons/tag.png" alt="Tag"></button>
				<button class="icon"><img src="img/icons/buttons/tags_2.png" alt="Tags 2"></button>
				<button class="icon"><img src="img/icons/buttons/television.png" alt="Television"></button>
				<button class="icon"><img src="img/icons/buttons/timer.png" alt="Timer"></button>
				<button class="icon"><img src="img/icons/buttons/trashcan_2.png" alt="Trashcan 2"></button>
				<button class="icon"><img src="img/icons/buttons/trashcan.png" alt="Trashcan"></button>
				<button class="icon"><img src="img/icons/buttons/travel_suitcase.png" alt="Travel Suitcase"></button>
				<button class="icon"><img src="img/icons/buttons/tree.png" alt="Tree"></button>
				<button class="icon"><img src="img/icons/buttons/trolly.png" alt="Trolly"></button>
				<button class="icon"><img src="img/icons/buttons/truck.png" alt="Truck"></button>
				<button class="icon"><img src="img/icons/buttons/tumbler.png" alt="Tumbler"></button>
				<button class="icon"><img src="img/icons/buttons/twitter_2.png" alt="Twitter 2"></button>
				<button class="icon"><img src="img/icons/buttons/twitter.png" alt="Twitter"></button>
				<button class="icon"><img src="img/icons/buttons/umbrella.png" alt="Umbrella"></button>
				<button class="icon"><img src="img/icons/buttons/under_construction.png" alt="Under Construction"></button>
				<button class="icon"><img src="img/icons/buttons/unlocked.png" alt="Unlocked"></button>
				<button class="icon"><img src="img/icons/buttons/upload.png" alt="upload"></button>
				<button class="icon"><img src="img/icons/buttons/user_2.png" alt="User 2"></button>
				<button class="icon"><img src="img/icons/buttons/user_comment.png" alt="User Comment"></button>
				<button class="icon"><img src="img/icons/buttons/user.png" alt="User"></button>
				<button class="icon"><img src="img/icons/buttons/users_2.png" alt="Users 2"></button>
				<button class="icon"><img src="img/icons/buttons/users.png" alt="Users"></button>
				<button class="icon"><img src="img/icons/buttons/v-Card_2.png" alt="V-Card 2"></button>
				<button class="icon"><img src="img/icons/buttons/v-card.png" alt="V-Card"></button>
				<button class="icon"><img src="img/icons/buttons/vault.png" alt="Vault"></button>
				<button class="icon"><img src="img/icons/buttons/vimeo_2.png" alt="Vimeo 2"></button>
				<button class="icon"><img src="img/icons/buttons/vimeo.png" alt="Vimeo"></button>
				<button class="icon"><img src="img/icons/buttons/walking_man.png" alt="Walking Man"></button>
				<button class="icon"><img src="img/icons/buttons/wifi_signal_2.png" alt="Wifi signal 2"></button>
				<button class="icon"><img src="img/icons/buttons/wifi_signal.png" alt="Wifi signal"></button>
				<button class="icon"><img src="img/icons/buttons/windows.png" alt="Windows"></button>
				<button class="icon"><img src="img/icons/buttons/winner_podium.png" alt="Winner Podium"></button>
				<button class="icon"><img src="img/icons/buttons/word_document.png" alt="Word Document"></button>
				<button class="icon"><img src="img/icons/buttons/word_documents.png" alt="Word Documents"></button>
				<button class="icon"><img src="img/icons/buttons/wordpress_2.png" alt="Wordpress 2"></button>
				<button class="icon"><img src="img/icons/buttons/wordpress.png" alt="Wordpress"></button>
				<button class="icon"><img src="img/icons/buttons/youtube_2.png" alt="YouTube 2"></button>
				<button class="icon"><img src="img/icons/buttons/youtube.png" alt="YouTube"></button>
				<button class="icon"><img src="img/icons/buttons/zip_file.png" alt="ZIP File"></button>
				<button class="icon"><img src="img/icons/buttons/zip_files.png" alt="Zip Files"></button>
			</section>
		</article>
		<!-- /Full width content box -->
		
		<!-- Notification -->
		<div class="notification error">
			<a href="#" class="close-notification tooltip-wide" title="Hide Notification">x</a>
			<h4>Error notification</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.</p>
			<a href="#" class="show-notification-details">&#9658; Show Details</a>
			<ul class="notification-details">
				<li>Lorem ipsum dolor sit amet</li>
				<li>Suspendisse et dignissim metus</li>
				<li>Maecenas id augue ac metus tempus</li>
				<li>Sed pharetra placerat est suscipit</li>
				<li>Phasellus aliquam males</li>
				<li>Nunc at dui id purus lacinia tincidunt</li>
			</ul>
		</div>
		<!-- /Notification -->
		
		<!-- Notification -->
		<div class="notification success">
			<a href="#" class="close-notification tooltip-wide" title="Hide Notification">x</a>
			<h4>Success notification</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.</p>
			<a href="#" class="show-notification-details">&#9658; Show Details</a>
			<ul class="notification-details">
				<li>Lorem ipsum dolor sit amet</li>
				<li>Suspendisse et dignissim metus</li>
				<li>Maecenas id augue ac metus tempus</li>
				<li>Sed pharetra placerat est suscipit</li>
				<li>Phasellus aliquam males</li>
				<li>Nunc at dui id purus lacinia tincidunt</li>
			</ul>
		</div>
		<!-- /Notification -->
		
		<!-- Notification -->
		<div class="notification information">
			<a href="#" class="close-notification tooltip-wide" title="Hide Notification">x</a>
			<h4>Information notification</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.</p>
			<a href="#" class="show-notification-details">&#9658; Show Details</a>
			<ul class="notification-details">
				<li>Lorem ipsum dolor sit amet</li>
				<li>Suspendisse et dignissim metus</li>
				<li>Maecenas id augue ac metus tempus</li>
				<li>Sed pharetra placerat est suscipit</li>
				<li>Phasellus aliquam males</li>
				<li>Nunc at dui id purus lacinia tincidunt</li>
			</ul>
		</div>
		<!-- /Notification -->
		
		<!-- Notification -->
		<div class="notification attention">
			<a href="#" class="close-notification tooltip-wide" title="Hide Notification">x</a>
			<h4>Attention notification</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam.</p>
			<a href="#" class="show-notification-details">&#9658; Show Details</a>
			<ul class="notification-details">
				<li>Lorem ipsum dolor sit amet</li>
				<li>Suspendisse et dignissim metus</li>
				<li>Maecenas id augue ac metus tempus</li>
				<li>Sed pharetra placerat est suscipit</li>
				<li>Phasellus aliquam males</li>
				<li>Nunc at dui id purus lacinia tincidunt</li>
			</ul>
		</div>
		<!-- /Notification -->
		
		<!-- Notification -->
		<div class="notification note">
			<a href="#" class="close-notification tooltip-wide" title="Hide Notification">x</a>
			<h4>Note</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero. Suspendisse et dignissim metus. Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat est suscipit sagittis.</p>
			<a href="#" class="show-notification-details">&#9658; Show Details</a>
			<ul class="notification-details">
				<li>Lorem ipsum dolor sit amet</li>
				<li>Suspendisse et dignissim metus</li>
				<li>Maecenas id augue ac metus tempus</li>
				<li>Sed pharetra placerat est suscipit</li>
				<li>Phasellus aliquam males</li>
				<li>Nunc at dui id purus lacinia tincidunt</li>
			</ul>
		</div>
		<!-- /Notification -->
	
	</section>
	<!-- /Main Content -->
	
	<!-- Main Footer -->
	<footer id="footer">
		<div class="page-wrapper">
			<section>
				<h2>Vestibulum blandit massa</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dignissim auctor dolor. Curabitur a arcu nec massa malesuada eleifend vel sit amet magna. Nulla vel leo sit amet justo porttitor vulputate ut vel sapien. Sed quis enim augue, id elementum quam.</p>
				<p>Ut vel aliquet leo. Suspendisse quis fringilla ligula. Suspendisse potenti. Nam volutpat pellentesque est, sed mattis ante interdum et.</p>
				
				<!-- Social Sub Nav List Style -->
				<ul class="social-list">
					<li><a class="social rss" href="#">RSS</a></li>
					<li><a class="social twitter" href="#">Twitter</a></li>
					<li><a class="social facebook" href="#">Facebook</a></li>
					<li><a class="social forrst" href="#">Forrst</a></li>
					<li><a class="social tumblr" href="#">Tumblr</a></li>
				</ul>
				<!-- /Social Sub Nav List Style -->
				
			</section>
			<section>
				<h2>Praesent facilisis</h2>
				<ul>
					<li><a href="#">Appstorm</a></li>
					<li><a href="#">Mac.Appstorm</a></li>
					<li><a href="#">Web.Appstorm</a></li>
					<li><a href="#">iPhone.Appstorm</a></li>
					<li><a href="#">TheNetsetter</a></li>
					<li><a href="#">Snipplr</a></li>
					<li><a href="#">Rockable Press</a></li>
					<li><a href="#">FreelanceSwitch</a></li>
				</ul>
			</section>
			<section>
				<h2>Cras tellus nisi</h2>
				<form class="vertical-form">
					<dl>
						<dt>
							<label>Short Input</label>
						</dt>
						<dd>
							<input type="text" name="" value="">
						</dd>
						<dt>
							<label>Textarea</label>
						</dt>
						<dd>
							<textarea class="footer" rows="5" cols="40" name=""></textarea>
						</dd>
					</dl>
					<button type="submit" class="gray">Submit</button>
				</form>
			</section>
		</div>
	</footer>
	<!-- /Main Footer -->
	
	<!-- Main Loading Notification -->
	<div class="loading-notification">Loading&hellip;</div>
	<!-- /Main Loading Notification -->
	
	<!-- Sample Modal Window -->
	<div id="sample" class="modal-content">
		<h1>nyroModal</h1>
		<p>Ajax Call, Ajax Call with targeting content, Single Image, Images Gallery with arrow navigating, Gallery with any kind of content, Form, Form in iframe, Form with targeting content, Form with file upload, Form with file upload with targeting content, Dom Element, Manual Call, Iframe, Stacked Modals, Many embed element through Embed.ly API, Error handling, Modal will never goes outside the view port, Esc key to close the window, Customizable animation, Customizable look, Modal title.</p>
		<a href="http://nyromodal.nyrodev.com/" class="outside">http://nyromodal.nyrodev.com</a>
	</div>
	<!-- /Sample Modal Window -->

	<!-- JavaScript at the bottom for faster page loading -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script>!window.jQuery && document.write(unescape('%3Cscript src="js/libs/jquery-1.5.1.min.js"%3E%3C/script%3E'))</script>
	<!--[if IE]><script src="js/jquery/excanvas.js"></script><![endif]--><!-- IE Canvas Fix for Visualize Charts -->
	<script src="js/libs/selectivizr.js"></script>
	<script src="js/jquery/jquery.visualize.js"></script>
	<script src="js/jquery/jquery.adminmenu.js"></script>
	<script src="js/jquery/jquery.visualize.tooltip.js"></script>
	<script src="js/jquery/jquery.tipsy.js"></script>
	<script src="js/jquery/jquery.nyromodal.min.js"></script>
	<script src="js/jquery/jquery.wysiwyg.js"></script>
	<script src="js/jquery/jquery.datatables.js"></script>
	<script src="js/jquery/jquery.datepicker.js"></script>
	<script src="js/jquery/jquery.fileinput.js"></script>
	<script src="js/jquery/jquery.fullcalendar.min.js"></script>
	<script src="js/jquery/jquery.ui.totop.js"></script>
	<script src="js/jquery/jquery.snippet.js"></script>
	<script src="js/script.js"></script>
	
	<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2289947-4']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>