<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="dao.*" %>
<%@page import="user.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>聚友趣</title>
  <!--搜索界面-->
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

  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="author" content="Dmitry Volkov">
  <link type="text/css" rel="stylesheet" charset="UTF-8" href="https://translate.googleapis.com/translate_static/css/translateelement.css">
  <style>
		body {
           font-family: Arial;
           margin: 0;
           background-image: url("./juyouqu/WebContent/images/9.jpg");
           background-repeat: no-repeat;
           background-size: 100% 195%;
            }

            .sidebox__share{
		background-color:rgba(255,255,255,0.5);
}


	</style>
</head>
<body>
<%
ArrayList<Article> search_article=(ArrayList<Article>)session.getAttribute("search_article");
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
            <img src="img/logo.svg" alt="">
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
                <li><a href="add-project.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">摄影</font></font></a></li>
              </ul>
            </li>
            <!-- end dropdown -->

            <!-- dropdown -->
            <li class="header__nav-item">
              <a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuJobs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">生活</font></font></a>

              <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuJobs">
                <li><a href="jobs.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">美食</font></font></a></li>
                <li><a href="job.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">运动</font></font></a></li>
                <li><a href="add-job.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">旅游</font></font></a></li>
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
            <li class="breadcrumb__item breadcrumb__item--active"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">搜索界面</font></font></li>
          </ul>
        </div>
      </div>
    </div>
  </div>       <!--2导航条-->
  <!-- end breadcrumb -->




    <div class="container">
      <div class="row">
        <!-- 左边 -->
        <div class="col-12 col-md-5 col-lg-4 col-xl-3">
          <!-- user -->
          <div class="user">
            <div class="user__head">
              <div class="user__img">

              </div>
            </div>
            <div class="user__title">


              <div class="profile__actions">
                <div class="post__location">
                  <!--	<i class="icon ion-ios-navigate"></i>
                      <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">越南</font></font></span>-->
                </div>

                <div class="post__actions">

                		</div>
              </div>
            </div>

          </div>				<!--默认头像-->
          <!-- end user -->

          <!-- social -->
          <div class="sidebox">
            <div class="sidebox__share">


            </div>
          </div>            <!--用户邮箱-->
          <!-- end social -->
        </div>


        <!--中间-->
        <div class="col-12 col-md-7 col-lg-8 col-xl-6">

          <!--中间的三个分块-->
          <div class="tab-content">

            <!--动态-->
            <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="tab-1">
              <!-- post -->
             <%
		    for (int i = search_article.size()-1; i>=0; i--) { 
			String t = "<div class=\"post\">"
			+ "<div class=\"post__head\">"
			+ "<a class=\"post__head-img\">"								
	        + "<img src=\"./images/9.jpg\">"
			+ "</a>"
			+ "<div class=\"post__head-title\">"
			+"<h5>"
			+"<font style=\"vertical-align: inherit;\">"
			+search_article.get(i).getusername()
			+"</font></h5></div></div>"
			+"<h2 class=\"post__title\">"
			+"<font style=\"vertical-align: inherit;\">"
			+ search_article.get(i).getTitle()
			+ "</font></h2>"
			+ "<div class=\"post__description\">"
			+ "<p>"
			+"<font style=\"vertical-align: inherit;\">"
			+ search_article.get(i).get_content()
			+ "</font></p>"
			+ "</div></div>";
						
			out.println(t);	
    		}
							%>	
              <!-- end post -->

             
              

              <!-- view more -->
              <button class="main__btn" type="button"><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">装载更多</font></font></span></button>
              <!-- end view more -->
            </div>



        </div>
      </div>
    </div>
  </div>
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