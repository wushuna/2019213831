<%@page import="com.mysql.cj.Session"%>
<%@page import="user.Userprivate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*" %>
<%@page import="user.*" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="zh-CN" class="translated-ltr"><head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--个人界面-->
	<!-- CSS -->
	<link rel="stylesheet" href="css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/nouislider.min.css">
	<link rel="stylesheet" href="css/select2.min.css">
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="css/ionicons.min.css">
	<link rel="stylesheet" href="css/main.css">

	<!-- Favicons -->
	<link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/favicon-32x32.png">
	<link rel="apple-touch-icon" sizes="72x72" href="icon/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="icon/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="144x144" href="icon/apple-touch-icon-144x144.png">

	<!--引入Vue-->
	<script src="js/jquery-2.1.0.js"></script>
	<script src="https://unpkg.com/vue@2.5.2/dist/vue.min.js"></script>
	<script src="https://unpkg.com/vue-router@3.0.1/dist/vue-router.min.js"></script>
	<script src="https://unpkg.com/iview@3.4.0/dist/iview.min.js"></script>
	<script src="https://unpkg.com/axios@0.18.0/dist/axios.min.js"></script>
	<script src="https://unpkg.com/echarts@4.2.1/dist/echarts.min.js"></script>

	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="Dmitry Volkov">
	<title>聚友趣</title>
<link type="text/css" rel="stylesheet" charset="UTF-8" href="https://translate.googleapis.com/translate_static/css/translateelement.css">
	<style>
		body {
           font-family: Arial;
           margin: 0;
           background-image: url("./images/9.jpg");
           background-repeat: no-repeat;
           background-size: 100% 250%;
            }

            .sidebox__share{
		background-color:rgba(255,255,255,0.5);
}

		.new12{
		font-size: 14px;
    	line-height: 24px;
    	color:black;
		}

	</style>
	<!-- <script>
		window.location.href="show_servlet";
	</script> -->

</head>

<body>
	<% 
		User user=(User) session.getAttribute("user");
	    privateDao privateDao = new privateDao();
		Userprivate userprivate = privateDao.findUserprivate(user.getUsername());
		//out.print(userprivate);
		
		articleDao articleDao = new articleDao();
		int count = articleDao.countArticle(user.getUsername());
		ArrayList<Article> article = articleDao.findArticle(user.getUsername());
   	    
   	    
	%>
	<!-- header -->
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-7 col-md-9 col-lg-8 col-xl-9">
					<div class="header__content">
						<!-- header menu btn -->
						<button class="header__btn" type="button">
							<span></span>
							<span></span>
							<span></span>
						</button>
						<!-- end header menu btn -->

						<!-- header logo -->
						<a href="index.html" class="header__logo">
							<img src="./images/LOGO.png" alt="">
						</a>
						<!-- end header logo -->

						<!-- header nav -->    <!--分类-->
						<ul class="header__nav">
							<!-- dropdown -->
							<li class="header__nav-item">
								<a href="index.html" class="header__nav-link"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">首页</font></font></a>
							</li>
							<!-- end dropdown -->

							<!-- dropdown -->
							<li class="header__nav-item">
								<a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuProjects" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">娱乐</font></font></a>
<ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuProjects">
									<li><a href="projects.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">游戏</font></font></a></li>
									<li><a href="project.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">音乐</font></font></a></li>
										</ul>
							</li>
							<!-- end dropdown -->

							<!-- dropdown -->
							<li class="header__nav-item">
								<a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuJobs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">生活</font></font></a>

								<ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuJobs">
									<li><a href="jobs.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">美食</font></font></a></li>
									<li><a href="job.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">运动</font></font></a></li>
									</ul>
							</li>
							<!-- end dropdown -->

							<!-- dropdown -->
							<li class="header__nav-item">
								<a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuProfiles" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">个人资料</font></font></a>

								<ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuProfiles">
									<li><a href="profiles.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">好友</font></font></a></li>
									<li><a href="profile.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">个人界面</font></font></a></li>
								</ul>
							</li>
							<!-- end dropdown -->

							
						</ul>
						<!-- end header nav -->

						<!-- header search -->
						<form method="post" action="search_servlet" class="header__search">
							<input class="header__search-input" name="search" type="text" placeholder="搜索...">
							<button class="header__search-button" name="search" type="submit">
								<i class="icon ion-ios-search"></i>
							</button>
						</form>
						<!-- end header search -->
					</div>
				</div>

				<div class="col-5 col-md-3 col-lg-4 col-xl-3">
					<div class="header__content header__content--end">


						<div class="header__notifications">


							<div class="dropdown-menu dropdown-menu-right header__dropdown-menu header__dropdown-menu--right header__dropdown-menu--ntf" aria-labelledby="dropdownMenuNotifications">



							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</header>           <!--导航条-->
	<!-- end header -->
	<!-- main content -->
	<main class="main main--breadcrumb">
		<!-- breadcrumb -->
		<div class="breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<ul class="breadcrumb__wrap">
							<li class="breadcrumb__item"><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">首页</font></font></a></li>
							<li class="breadcrumb__item breadcrumb__item--active"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">个人界面</font></font></li>
						</ul>
					</div>
				</div>
			</div>
		</div>       <!--2导航条-->
		<!-- end breadcrumb -->

<div id="app5">
		<div class="container">
			<div class="row">
				<!-- 左边 -->
				<div class="col-12 col-md-5 col-lg-4 col-xl-3">
					<!-- user -->
					<div class="user">
						<div class="user__head">
							<div class="user__img">
								<img src="./images/9.jpg" alt="">
							</div>
							
						</div>
						<div class="user__title">
						<%
							String u = "<div>"
							+ user.getUsername()
							+ "</div>";
							out.println(u);	
							%>


							<div class="profile__actions">
								<div class="post__location">
								<!--	<i class="icon ion-ios-navigate"></i>
									<span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">越南</font></font></span>-->
								</div>

								<div class="post__actions">
					<!--				<a class="post__actions-btn post__actions-btn--green" href="#">
										<i class="icon ion-ios-bookmark"></i>
									</a>
									<a class="post__actions-btn post__actions-btn--red" href="#">
										<i class="icon ion-ios-mail"></i>
									</a>
									<a href="#" class="post__actions-btn post__actions-btn--blue"><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">关注</font></font></span></a>
					-->			</div>
							</div>
						</div>
						<!--
						<ul class="user__list">
							<li><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">性别：</font></font></span> <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">女</font></font></span></li>
							<li><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">年龄：</font></font></span> <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">100</font></font></span></li>
							<li><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">邮箱：</font></font></span> <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1234567544@qq.com</font></font></span></li>
							<li><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">电话：</font></font></span> <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2312313123</font></font></span></li>
						</ul>
						<ul class="user__stats">
							<li>
								<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">以下</font></font></p>
								<span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">26</font></font></span>
							</li>
							<li>
								<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">关注者</font></font></p>
								<span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">88</font></font></span>
							</li>
						</ul>
						-->
					</div>				<!--默认头像-->
					<!-- end user -->

					<!-- social -->
					<%
						String s = "<div class=\"sidebox\">"
						+ "<div class=\"sidebox__share\">"
						+ "<div class=\"new9\"> 性别:"
						+ userprivate.getSex()
						+ "</div></div></div>";
						out.println(s);	
					%>
					
					<%
						String a = "<div class=\"sidebox\">"
						+ "<div class=\"sidebox__share\">"
						+ "<div class=\"new9\"> 昵称:"
						+ userprivate.getName()
						+ "</div></div></div>";
						out.println(a);	
					%>
					
					<%
						String b = "<div class=\"sidebox\">"
						+ "<div class=\"sidebox__share\">"
						+ "<div class=\"new9\"> 年龄:"
						+ userprivate.getAge()
						+ "</div></div></div>";
						out.println(b);	
					%>
					
					<%
						String c = "<div class=\"sidebox\">"
						+ "<div class=\"sidebox__share\">"
						+ "<div class=\"new9\"> 电话:"
						+ userprivate.getPhone()
						+ "</div></div></div>";
						out.println(c);	
					%>
					
						
					
					
					
				     <!--用户邮箱-->
				     <!--
								<span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">社交：</font></font></span>
							<ul>
								<li class="facebook"><a href="#"><i class="icon ion-logo-facebook"></i></a></li>
								<li class="instagram"><a href="#"><i class="icon ion-logo-instagram"></i></a></li>
								<li class="twitter"><a href="#"><i class="icon ion-logo-twitter"></i></a></li>
								<li class="vk"><a href="#"><i class="icon ion-logo-vk"></i></a></li>
							</ul>    -->
					<!-- end social -->
				</div>
	<!--中间-->
				<div class="col-12 col-md-7 col-lg-8 col-xl-6">
					<ul class="nav nav-tabs main__nav" id="main__nav" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">我的动态</font></font></a>
						</li>

						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">设置</font></font></a>
						</li>

						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#tab-4" role="tab" aria-controls="tab-4" aria-selected="true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">发布</font></font></a>
						</li>
					</ul>

					<!--中间的三个分块-->
					<div class="tab-content">

						<!--动态-->
						<div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="tab-1">
							<!-- post -->
							
							<!-- end post -->

<!-- 第二个 -->
							<!-- post -->
							
							
    							<%
    							    for (int i = article.size()-1; i >=0; i--) { 
									String t = "<div class=\"post\">"
									+ "<div class=\"post__head\">"
									+ "<a class=\"post__head-img\">"								
					                + "<img src=\"./images/9.jpg\">"
									+ "</a>"
									+ "<div class=\"post__head-title\">"
									+"<h5>"
									+"<font style=\"vertical-align: inherit;\">"
									+article.get(i).getusername()
									+"</font></h5>"
									+"<li><a href=\"delete_servlet?id="+article.get(i).getID()
									+ "\">"
									+ "<font style=\"vertical-align: inherit;\">"
									+ "<font style=\"vertical-align: inherit;\">删除"
									+ "</font></font></a></li>"
									+ "</div></div>"
									+"<h2 class=\"post__title\">"
									+"<font style=\"vertical-align: inherit;\">"
									+ article.get(i).getTitle()
									+ "</font></h2>"
									+ "<div class=\"post__description\">"
									+ "<p>"
									+"<font style=\"vertical-align: inherit;\">"
									+ article.get(i).get_content()
									+ "</font></p>"
									+ "</div></div>";
									
								    
						
									out.println(t);	
    							}
								%>	
								</div>
 							
							<!-- end post -->

							
<!--设置-->
						<div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="tab-3">
							<!-- form -->
							<form method="post" action="private_servlet" class="form">
								<div class="row">
									<div class="col-12">
										<h2 class="form__title">资料</h2>
									</div>

									<div class="col-12 col-lg-6">
										<div class="form__group">
											<label for="login" class="form__label">性别:</label>
											<input name="sex" id="sex" type="text" class="form__input" placeholder="男">
										</div>
									</div>

									<div class="col-12 col-lg-6">
										<div class="form__group">
											<label for="name" class="form__label">昵称:</label>
											<input name="name" id="name" type="text" class="form__input" placeholder="Doe">
										</div>
									</div>

									<div class="col-12 col-lg-6">
										<div class="form__group">
											<label for="age" class="form__label">年龄:</label>
											<input name="age" id="age" type="text" class="form__input" placeholder="20">
										</div>
									</div>

									<div class="col-12 col-lg-6">
										<div class="form__group">
											<label for="phone" class="form__label">电话:</label>
											<input name="phone" id="phone" type="text" class="form__input" placeholder="13876818452">
										</div>
									</div>

									<div class="col-12">

										<button class="form__btn" type="submit" onclick ="alert('保存成功！');"><span>保存</span></button>
									</div>
								</div>
							</form>
							<!-- end form -->
	
							<!-- form -->
							<form action="#" class="form">
								<div class="row">
									<div class="col-12">
										<div class="new10">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp感谢您使用聚友趣平台！</div>
									</div>

								</div>
							</form>
							<!-- end form -->
<!--  文章发布 -->
						</div>

						<!--发布-->
						<div class="tab-pane fade" id="tab-4" role="tabpanel" aria-labelledby="tab-4">
							<form method="post" action="post_servlet" >
								<div class="main__box">
									<h3 class="main__box-title">发布文章</h3>

									<div class="col-12 col-lg-6">
										<div class="form__group">

											<label for="title" class="form_
											label">标题:</label>
											<input name="title" id="title" type="text" class="form__input" v-model="name">

										</div>
									</div>

									<div class="form__group">
										<!--
										<label for="text" class="form__label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">信息：</font></font></label>
										-->
										<textarea name="content" id="text" class="form__textarea" v-bind:message="message" v-model="message"></textarea>

									</div>

									<div class="filter__group">
										<label for="categoty" class="filter__label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">类别：</font></font></label>
<!-- 发布里的动态分类 -->
										<div class="filter__select-wrap">
											<select name="category" id="categoty" class="filter__select">
												<option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">游戏</font></font></option>
												<option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">音乐</font></font></option>
												<option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">摄影</font></font></option>
												<option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">美食</font></font></option>
												<option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">运动</font></font></option>
												<option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">旅游</font></font></option>
												<option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">二次元文化</font></font></option>
												<option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">绘画</font></font></option>
											</select>
										</div>
									</div>

									<div class="col-12">

										<button class="form__btn" type="submit" onclick ="alert('发布成功！');"><span>发布</span></button>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
	

				<!-- 右边栏 -->
				<div class="col-12 col-md-5 col-lg-4 col-xl-3">
					<!-- sidebox -->
					<div class="sidebox sidebox--desk">
						<h4 class="sidebox__title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">可能感兴趣的人</font></font></h4>
						<div class="sidebox__content">
							<div class="sidebox__user">
								<a href="#" class="sidebox__user-img">
									<img src="./images/13.jpg" alt="">
								</a>
								<div class="sidebox__user-title">
									<h5><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">德莉莎</font></font></a></h5>
									<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">绘画达人</font></font></p>
								</div>
								<button class="sidebox__user-btn" type="button">
									<i class="icon ion-ios-add"></i>
								</button>
							</div>

							<div class="sidebox__user">
								<a href="#" class="sidebox__user-img">
									<img src="img/user2.jpg" alt="">
								</a>
								<div class="sidebox__user-title">
									<h5><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">托尼</font></font></a></h5>
									<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">外科医生</font></font></p>
								</div>
								<button class="sidebox__user-btn" type="button">
									<i class="icon ion-ios-add"></i>
								</button>
							</div>

							<div class="sidebox__user">
								<a href="#" class="sidebox__user-img">
									<img src="./images/9.jpg" alt="">
								</a>
								<div class="sidebox__user-title">
									<h5><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">安德鲁</font></font></a></h5>
									<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">时装设计师</font></font></p>
								</div>
								<button class="sidebox__user-btn" type="button">
									<i class="icon ion-ios-add"></i>
								</button>
							</div>

							<div class="sidebox__user">
								<a href="#" class="sidebox__user-img">
									<img src="./images/15.jpg" alt="">
								</a>
								<div class="sidebox__user-title">
									<h5><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">索菲亚</font></font></a></h5>
									<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">教学助手</font></font></p>
								</div>
								<button class="sidebox__user-btn" type="button">
									<i class="icon ion-ios-add"></i>
								</button>
							</div>

							<div class="sidebox__user">
								<a href="#" class="sidebox__user-img">
									<img src="img/user6.jpg" alt="">
								</a>
								<div class="sidebox__user-title">
									<h5><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">玛莎</font></font></a></h5>
									<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">园丁</font></font></p>
								</div>
								<button class="sidebox__user-btn" type="button">
									<i class="icon ion-ios-add"></i>
								</button>
							</div>
						</div>

					</div>
					<!-- end sidebox -->
				</div>
			</div>
		</div>
		</div>
		<script>
		
			var e = new Vue({
				el:"#app5",
				data:{
					name:"请输入标题~",
					message:"分享你的趣点吧~",
				},
			});
		</script>
	</main>
	<!-- end main content -->

	<!-- JS -->
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/wNumb.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/jquery.mousewheel.min.js"></script>
	<script src="js/jquery.mCustomScrollbar.min.js"></script>
	<script src="js/main.js"></script><div id="goog-gt-tt" class="skiptranslate" dir="ltr">
		<div style="padding: 8px;"><div><div class="logo"></div></div></div>
		<div class="bottom" style="padding: 8px;"><div class="started-activity-container"></div></div></div>
</body>
</html>