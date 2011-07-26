<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page
	import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.FetchOptions"%>
<%@ page import="com.google.appengine.api.datastore.Key"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="org.juru.arandu.dao.OauthPermission"%>
<%@ page import="com.google.gdata.client.authn.oauth.GoogleOAuthHelper"%>
<%@ page
	import="com.google.gdata.client.authn.oauth.GoogleOAuthParameters"%>
<%@ page import="com.google.gdata.client.authn.oauth.OAuthException"%>
<%@ page
	import="com.google.gdata.client.authn.oauth.OAuthHmacSha1Signer"%>
<%@ page import="com.google.gdata.client.contacts.ContactsService"%>
<%@ page import="com.google.gdata.data.Link"%>
<%@ page import="com.google.gdata.data.contacts.ContactEntry"%>
<%@ page import="com.google.gdata.data.contacts.ContactFeed"%>
<%@ page import="com.google.gdata.data.contacts.GroupMembershipInfo"%>
<%@ page import="com.google.gdata.data.extensions.Email"%>
<%@ page import="com.google.gdata.data.extensions.Name"%>
<%@ page import="com.google.gdata.util.ServiceException"%>
<!doctype html>
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<title>AranduJejogua Beta</title>

<meta charset="utf-8">
<meta name="description"
	content="Comparte con tu red de contactos tus compras y aprende de las compras de ellos.">
<meta name="keywords"
	content="supermercado compartir aprender negociar central compras hogar social red">
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
<link
	href='http://fonts.googleapis.com/css?family=Droid+Sans+Mono|Open+Sans:400,400italic,700,700italic&amp;v2'
	rel='stylesheet' type='text/css'>

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
					<li><a href="/" title="">INICIO</a>
					</li>
					<li><a href="#submenu-1" title="" class="nav-main-subnav">Reportes</a>
					</li>
					<li><a href="#submenu-2" title="" class="nav-main-subnav">Red</a>
					</li>
					<li><a href="#submenu-3" title="" class="nav-main-subnav">Lugares</a>
					</li>
				</ul>
				<!-- /Main Navigation -->

				<!-- User Navigation -->
				<ul id="nav-main-user">
					<%
				    UserService userService = UserServiceFactory.getUserService();
    				User user = userService.getCurrentUser();
    				if (user != null) {
    					
					%>
					<li>Hola, <a href="#" title=""><%= user.getNickname() %></a>
					</li>
					<li><a href="/settings" title="Messages" class="actions"><img
							alt="Messages" src="img/icons/icon_user_message.png">
					</a>
					</li>
					<li><a href="#" title="Settings" class="actions"><img
							alt="Settings" src="img/icons/icon_user_settings.png">
					</a>
					</li>
					<li><a
						href="<%= userService.createLogoutURL(request.getRequestURI())%>"
						title="Logout" class="actions"><img alt="Logout"
							src="img/icons/icon_user_logout.png">
					</a>
					</li>
					<%
					    } else {
					%>
					<li>Hola, <a
						href="<%= userService.createLoginURL(request.getRequestURI()) %>"
						title="">inicia sesi&oacute;n</a>
					</li>
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
						<li class="standard-list-header"><h2>Some Links</h2>
						</li>
						<li><a href="#">Envato</a>
						</li>
						<li><a href="#">ActiveDen</a>
						</li>
						<li><a href="#">AudioJungle</a>
						</li>
						<li><a href="#">ThemeForest</a>
						</li>
						<li><a href="#">VideoHive</a>
						</li>
						<li><a href="#">GraphicRiver</a>
						</li>
						<li><a href="#">3DOcean</a>
						</li>
						<li><a href="#">CodeCanyon</a>
						</li>
						<li><a href="#">Creattica</a>
						</li>
					</ul>
					<!-- /Standard Sub Nav List Style -->

					<ul class="standard-list">
						<li class="standard-list-header"><h2>Useful Links</h2>
						</li>
						<li><a href="#">Appstorm</a>
						</li>
						<li><a href="#">Mac.Appstorm</a>
						</li>
						<li><a href="#">Web.Appstorm</a>
						</li>
						<li><a href="#">iPhone.Appstorm</a>
						</li>
						<li><a href="#">TheNetsetter</a>
						</li>
						<li><a href="#">Snipplr</a>
						</li>
						<li><a href="#">Rockable Press</a>
						</li>
						<li><a href="#">FreelanceSwitch</a>
						</li>
					</ul>
					<ul class="standard-list">
						<li class="standard-list-header"><h2>More Links</h2>
						</li>
						<li><a href="#">Psdtuts+</a>
						</li>
						<li><a href="#">Nettuts+</a>
						</li>
						<li><a href="#">Vectortuts+</a>
						</li>
						<li><a href="#">Audiotuts+</a>
						</li>
						<li><a href="#">Aetuts+</a>
						</li>
						<li><a href="#">Activetuts+</a>
						</li>
						<li><a href="#">Cgtuts+</a>
						</li>
						<li><a href="#">Phototuts+</a>
						</li>
						<li><a href="#">Mobiletuts+</a>
						</li>
					</ul>

					<!-- If you don't want headers in lists use class .header-fit to indent list verticaly to fit lists with headers -->
					<ul class="standard-list header-fit">
						<li><a href="#">Webdesigntuts+</a>
						</li>
						<li><a href="#">Noupe</a>
						</li>
						<li><a href="#">Six Revisions</a>
						</li>
						<li><a href="#">Drawar</a>
						</li>
						<li><a href="#">DesignShack</a>
						</li>
						<li><a href="#">Cats Who Code</a>
						</li>
						<li><a href="#">Onextrapixel</a>
						</li>
						<li><a href="#">Vanseodesign</a>
						</li>
						<li><a href="#">Webdesigner Depot</a>
						</li>
					</ul>
					<ul class="standard-list header-fit">
						<li><a href="#">VandelayDesign</a>
						</li>
						<li><a href="#">Web Designer Wall</a>
						</li>
						<li><a href="#">Impressive Webs</a>
						</li>
						<li><a href="#">Hongkiat</a>
						</li>
						<li><a href="#">Yoast</a>
						</li>
						<li><a href="http://www.parallaq.com" class="outside">Parallaq</a>
						</li>
					</ul>
				</div>
				<!-- /Sub Nav Block #submenu-1 -->

				<!-- Sub Nav Block #submenu-2 -->
				<div id="submenu-2" class="submenu">
					<ul class="standard-list menu-fit">
						<li class="standard-list-header"><h2>Some Links</h2>
						</li>
						<li><a href="#">Envato</a>
						</li>
						<li><a href="#">ActiveDen</a>
						</li>
						<li><a href="#">AudioJungle</a>
						</li>
						<li><a href="#">ThemeForest</a>
						</li>
						<li><a href="#">VideoHive</a>
						</li>
						<li><a href="#">GraphicRiver</a>
						</li>
						<li><a href="#">3DOcean</a>
						</li>
						<li><a href="#">CodeCanyon</a>
						</li>
						<li><a href="#">Creattica</a>
						</li>
					</ul>

					<!-- Box Sub Nav List Style -->
					<ul class="box-list">
						<li class="box-list-header"><h2>Useful Links</h2>
						</li>
						<li><a href="#">Appstorm</a>
						</li>
						<li><a href="#">Mac.Appstorm</a>
						</li>
						<li><a href="#">Web.Appstorm</a>
						</li>
						<li><a href="#">iPhone.Appstorm</a>
						</li>
						<li><a href="#">TheNetsetter</a>
						</li>

					</ul>
					<!-- /Box Sub Nav List Style -->

					<ul class="box-list header-fit">
						<li><a href="#">FreelanceSwitch</a>
						</li>
						<li><a href="#">WorkAwesome</a>
						</li>
						<li><a href="#">DrinkAwesome</a>
						</li>
						<li><a href="#">LiveAwesome</a>
						</li>
						<li><a href="#">SleepAwesome</a>
						</li>
					</ul>
					<ul class="box-list header-fit">
						<li><a href="#">Psdtuts+</a>
						</li>
						<li><a href="#">Nettuts+</a>
						</li>
						<li><a href="#">Vectortuts+</a>
						</li>
						<li><a href="#">Audiotuts+</a>
						</li>
						<li><a href="#">Aetuts+</a>
						</li>
					</ul>

					<!-- You can also use articles in submenu, they will automatically align to the right or use class .perex to align left  -->
					<article>
						<h2>Header H2</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Suspendisse et dignissim metus. Maecenas id augue ac metus tempus
							aliquam.</p>
					</article>
				</div>
				<!-- /Sub Nav Block #submenu-2 -->

				<!-- Sub Nav Block #submenu-3 -->
				<div id="submenu-3" class="submenu">

					<!-- Thumbnail Sub Nav List Style -->
					<ul class="thumbnail-list menu-fit">
						<li class="thumbnail-list-header"><h2>Image Content</h2>
						</li>
						<li><img src="img/_sample-data/sample_image_1.png"
							alt="Sample Image">
							<h3>Some image examples</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Suspendisse et dignissim metus.</p> <a class="thumbnail-list-more">Read
								more &raquo;</a></li>
						<li><img src="img/_sample-data/sample_image_2.png"
							alt="Sample Image">
							<h3>One more example</h3>
							<p>Sed pharetra placerat est suscipit sagittis. Phasellus
								aliquam malesuada blandit.</p> <a class="thumbnail-list-more">Read
								more &raquo;</a></li>
					</ul>
					<!-- /Thumbnail Sub Nav List Style -->

					<!-- You can also use articles in submenu, they will automatically align to the right or use class .perex to align left  -->
					<article>
						<h2>Header H2</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Suspendisse et dignissim metus. Maecenas id augue ac metus tempus
							aliquam.</p>
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
				<li><a href="/" title="Inicio">Inicio</a>
				</li>
				<li><a href="#">Mis Listas</a>
				</li>
				<li><a href="#">Productos</a>
				</li>
				<li><a href="#">Lugares de Compra</a>
				</li>
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
						<li><a class="default-tab tooltip" href="#tab1"
							title="Switch to next tab">Graph</a>
						</li>
						<li><a class="tooltip" href="#tab2" title="Form styles">Form</a>
						</li>
						<li><a class="tooltip" href="#tab3" title="Sample tables">Table</a>
						</li>
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
									<label>Focused Input <span>*</span>
									</label>
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
									<input type="text" class="medium" disabled name=""
										value="This input was disabled">
								</dd>
								<dt>
									<label>Ghost Input</label>
								</dt>
								<dd>
									<input class="ghost medium" type="text" name=""
										value="This is ghost input acting like pure text">
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
									<p>Sometimes you need pure text in forms. Use class .text
										for &lt;dd&gt; to correct text alignment.</p>
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
								<dt class="checkbox">
									<label>Checkbox A</label>
								</dt>
								<dd>
									<input type="checkbox" name="">
								</dd>
								<dt class="checkbox">
									<label>Checkbox B</label>
								</dt>
								<dd>
									<input type="checkbox" name="">
								</dd>
								<dt class="checkbox">
									<label>Checkbox C</label>
								</dt>
								<dd>
									<input type="checkbox" name="">
								</dd>
							</dl>
						</fieldset>
						<fieldset>
							<legend>Choose one of these</legend>
							<dl>
								<dt class="radio">
									<label>Option 1</label>
								</dt>
								<dd>
									<input type="radio" name="test">
								</dd>
								<dt class="radio">
									<label>Option 2</label>
								</dt>
								<dd>
									<input type="radio" name="test">
								</dd>
								<dt class="radio">
									<label>Option 3</label>
								</dt>
								<dd>
									<input type="radio" name="test">
								</dd>
							</dl>
						</fieldset>
						<fieldset>
							<legend>Choose one of these</legend>
							<dl>
								<dt>
									<label>Select</label>
								</dt>
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
						<button type="submit">Submit</button>
						or <a href="#">Cancel</a>
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
									<p>Sometimes you need pure text in forms. Use class .text
										for &lt;dd&gt; to correct text alignment.</p>
								</dd>
							</dl>
						</fieldset>
						<fieldset>
							<legend>Check-in some of these</legend>
							<dl>
								<dt class="checkbox">
									<label>Checkbox A</label>
								</dt>
								<dd class="checkbox">
									<input type="checkbox">
								</dd>
								<dt class="checkbox">
									<label>Checkbox B</label>
								</dt>
								<dd class="checkbox">
									<input type="checkbox">
								</dd>
								<dt class="checkbox">
									<label>Checkbox C</label>
								</dt>
								<dd class="checkbox">
									<input type="checkbox">
								</dd>
							</dl>
						</fieldset>
						<fieldset>
							<legend>Choose one of these</legend>
							<dl>
								<dt class="radio">
									<label>Option 1</label>
								</dt>
								<dd class="radio">
									<input type="radio" name="test">
								</dd>
								<dt class="radio">
									<label>Option 2</label>
								</dt>
								<dd class="radio">
									<input type="radio" name="test">
								</dd>
								<dt class="radio">
									<label>Option 3</label>
								</dt>
								<dd class="radio">
									<input type="radio" name="test">
								</dd>
							</dl>
						</fieldset>
						<fieldset>
							<legend>Choose one of these</legend>
							<dl>
								<dt class="clear-tm">
									<label>Select</label>
								</dt>
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
						<button type="submit">View</button>
						<button type="submit" class="gray">Submit</button>
						or <a href="#">Cancel</a>
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
								<td>4</td>
								<td>X</td>
							</tr>
							<tr class="gradeC">
								<td>Trident</td>
								<td>Internet Explorer 5.0</td>
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
								<td>C/A<sup>1</sup>
								</td>
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
									<th><input type="checkbox" class="check-all">
									</th>
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
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Trident</td>
									<td>Internet Explorer 4.0</td>
									<td>Win 95+</td>
									<td>4</td>
									<td><span class="tag red">High</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Trident</td>
									<td>Internet Explorer 5.0</td>
									<td>Win 95+</td>
									<td>5</td>
									<td><span class="tag orange">Medium</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Trident</td>
									<td>Internet Explorer 5.5</td>
									<td>Win 95+</td>
									<td>5.5</td>
									<td><span class="tag green">Low</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Trident</td>
									<td>Internet Explorer 6</td>
									<td>Win 98+</td>
									<td>6</td>
									<td><span class="tag gray">Closed</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Trident</td>
									<td>Internet Explorer 7</td>
									<td>Win XP SP2+</td>
									<td>7</td>
									<td><span class="tag blue">#337</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Trident</td>
									<td>AOL browser (AOL desktop)</td>
									<td>Win XP</td>
									<td>6</td>
									<td><span class="tag gray">Closed</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Gecko</td>
									<td>Firefox 1.0</td>
									<td>Win 98+ / OSX.2+</td>
									<td>1.7</td>
									<td><span class="tag gray">Closed</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Gecko</td>
									<td>Firefox 1.5</td>
									<td>Win 98+ / OSX.2+</td>
									<td>1.8</td>
									<td><span class="tag gray">Closed</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Gecko</td>
									<td>Firefox 2.0</td>
									<td>Win 98+ / OSX.2+</td>
									<td>1.8</td>
									<td><span class="tag black">Foo</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Gecko</td>
									<td>Firefox 3.0</td>
									<td>Win 2k+ / OSX.3+</td>
									<td>1.9</td>
									<td><span class="tag gray">Closed</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Gecko</td>
									<td>Camino 1.0</td>
									<td>OSX.2+</td>
									<td>1.8</td>
									<td><span class="tag gray">Closed</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td><input type="checkbox">
									</td>
									<td>
										<!-- Table actions --> <a class="toggle-table-switch tooltip"
										href="#" title="Show options">Options</a>
										<ul class="table-switch">
											<li><a href="#">view</a>
											</li>
											<li><a href="#">edit</a>
											</li>
											<li><a href="#">delete</a>
											</li>
										</ul> <!-- /Table actions --></td>
									<td>Gecko</td>
									<td>Camino 1.5</td>
									<td>OSX.3+</td>
									<td>1.8</td>
									<td><span class="tag gray">Closed</span>
									</td>
									<td>
										<ul class="actions">
											<li><a class="view tooltip" href="#" title="View Item">view</a>
											</li>
											<li><a class="edit tooltip" href="#" title="Edit Item">edit</a>
											</li>
											<li><a class="delete tooltip" href="#"
												title="Delete Item">delete</a>
											</li>
										</ul></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="8">
										<!-- Pagination -->
										<ul class="pagination">
											<li><a class="button gray" href="#">&laquo; first</a>
											</li>
											<li><a class="button gray" href="#">&lt; next</a>
											</li>
											<li class="hellip">&hellip;</li>
											<li><a class="button gray" href="#">5</a>
											</li>
											<li><a class="button gray" href="#">6</a>
											</li>
											<li><a class="button" href="#">7</a>
											</li>
											<li><a class="button gray" href="#">8</a>
											</li>
											<li><a class="button gray" href="#">9</a>
											</li>
											<li class="hellip">&hellip;</li>
											<li><a class="button gray" href="#">prev &gt;</a>
											</li>
											<li><a class="button gray" href="#">last &raquo;</a>
											</li>
										</ul> <!-- /Pagination --></td>
								</tr>
							</tfoot>
						</table>
					</form>
					<!-- /Basic Table  -->

				</div>
				<!-- /Tab Content #tab3 -->

			</section>
			<footer>Lorem ipsum dolor sit amet, consectetur adipiscing
				elit. Vestibulum aliquet nisi ac risus tincidunt gravida. Cras
				imperdiet mattis nisl et suscipit.</footer>
		</article>
		<!-- /Full width content box with minimizer -->

		<div class="clearfix"></div>
		<!-- We're really sorry for this, but because of IE7 we still need separated div with clearfix -->


	</section>
	<!-- /Main Content -->

	<!-- Main Footer -->
	<footer id="footer">
		<div class="page-wrapper">
			<section>
				<h2>Vestibulum blandit massa</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Mauris dignissim auctor dolor. Curabitur a arcu nec massa malesuada
					eleifend vel sit amet magna. Nulla vel leo sit amet justo porttitor
					vulputate ut vel sapien. Sed quis enim augue, id elementum quam.</p>
				<p>Ut vel aliquet leo. Suspendisse quis fringilla ligula.
					Suspendisse potenti. Nam volutpat pellentesque est, sed mattis ante
					interdum et.</p>

				<!-- Social Sub Nav List Style -->
				<ul class="social-list">
					<li><a class="social rss" href="#">RSS</a>
					</li>
					<li><a class="social twitter" href="#">Twitter</a>
					</li>
					<li><a class="social facebook" href="#">Facebook</a>
					</li>
					<li><a class="social forrst" href="#">Forrst</a>
					</li>
					<li><a class="social tumblr" href="#">Tumblr</a>
					</li>
				</ul>
				<!-- /Social Sub Nav List Style -->

			</section>
			<section>
				<h2>Praesent facilisis</h2>
				<ul>
					<li><a href="#">Appstorm</a>
					</li>
					<li><a href="#">Mac.Appstorm</a>
					</li>
					<li><a href="#">Web.Appstorm</a>
					</li>
					<li><a href="#">iPhone.Appstorm</a>
					</li>
					<li><a href="#">TheNetsetter</a>
					</li>
					<li><a href="#">Snipplr</a>
					</li>
					<li><a href="#">Rockable Press</a>
					</li>
					<li><a href="#">FreelanceSwitch</a>
					</li>
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


	<!-- Sample Modal Window -->
	<div id="sample" class="modal-content">
		<h1>nyroModal</h1>
		<p>Ajax Call, Ajax Call with targeting content, Single Image,
			Images Gallery with arrow navigating, Gallery with any kind of
			content, Form, Form in iframe, Form with targeting content, Form with
			file upload, Form with file upload with targeting content, Dom
			Element, Manual Call, Iframe, Stacked Modals, Many embed element
			through Embed.ly API, Error handling, Modal will never goes outside
			the view port, Esc key to close the window, Customizable animation,
			Customizable look, Modal title.</p>
		<a href="http://nyromodal.nyrodev.com/" class="outside">http://nyromodal.nyrodev.com</a>
	</div>
	<!-- /Sample Modal Window -->

	<!-- JavaScript at the bottom for faster page loading -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script>
		!window.jQuery
				&& document
						.write(unescape('%3Cscript src="js/libs/jquery-1.5.1.min.js"%3E%3C/script%3E'))
	</script>
	<!--[if IE]><script src="js/jquery/excanvas.js"></script><![endif]-->
	<!-- IE Canvas Fix for Visualize Charts -->
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
		_gaq.push([ '_setAccount', 'UA-2289947-4' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
</html>