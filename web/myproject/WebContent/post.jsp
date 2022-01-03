<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <title>发布文章</title>

        <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
        <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script src="wangEditor.min.js"></script>

        <style>
        .mainHeader{

            padding-top: 1px;
            padding-bottom: 1px;
            background-color: white !important;
            border-bottom: 5px solid #0b6cb8;
        }

        .logo_icon{

            height: 38px;
        }

        .liColor{
            color: #4f4f4f

        }

        .toolbar {
            border: 1px solid #ccc;
        }
        .text {
            border: 1px solid #ccc;
            height: 500px;
        }
        #textareaId{
        height: 407px;
        width:300px;
        }

    </style>
<!--
        <script>
        $(function () {
            //富文本编辑器初始化代码
            var E = window.wangEditor;
            var editor = new E('#div1', '#div2');

            editor.customConfig.uploadImgShowBase64 = true;   // 使用 base64 保存图片
            editor.create();

            //创建replaceAll()函数,用于替换字符串中出现的所有某个字符
            String.prototype.replaceAll = function (FindText, RepText) {
                return this.replace(new RegExp(FindText, "g"), RepText);
            };

            //发布文章按钮的点击事件，即封装数据，向后台传递
            $("#publishBtn").click(function () {
                console.info("click");
                var postData={};
                postData.title=$("#titleInput").val();
                postData.category=$("#categoryInput").val();

                //替换双引号为两个单引号，方便编写SQL语句插入数据库中
                var content=editor.txt.html().replaceAll("\"","\'\'");
                postData.content=content;

                console.info(content);
                postData.author_acc="123";
                postData.author_name="admin";
                postData.create_time=new Date().toLocaleDateString();
                postData.last_edit_time=new Date().toLocaleDateString();
                console.info(postData);

                //向后台传递数据，需要根据具体后台来改
                $.post("http://localhost:8099/publishArticle",postData,function (data) {

                    alert(data);
                })

            })

        })

    </script>
-->
</head>
<body style="background-color: whitesmoke">

        <div class="container-fluid">
            <!--    顶部导航栏-->
            <div class="row">
                <div class="col-md-12" style="padding: 0">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light mainHeader">
                        <!--                <a class="navbar-brand" href="#">Navbar w/ text</a>-->
                        <div class="logoDiv" id="logoIcon" style="cursor:pointer">
                            <img class="logo_icon" src="logo_icon_white.png"/>
                        </div>

                        <div class="logoDiv" id="logoText">
                            <img class="logo_icon" src="logo_icon_white.png"/>  <!--放logo -->
                        </div>

                        <div class="collapse navbar-collapse" id="navbarText">

                            <ul class="navbar-nav mr-auto">
                                <!--                        <li class="nav-item" style="padding-left: 20px">-->
                                <!--                            <a class="nav-link nav-item"  href="#">首页 </a>-->
                                <!--                        </li>-->

                            </ul>

                            <span class="navbar-nav">
                        <a class="nav-link navbar-item active" href="#">聚友趣</a>

                    </span>
                        </div>
                    </nav>

                </div>

            </div>

            <div class="row" style="min-height: 10px"></div>

            <div class="row">
                <div class="col-md-1">


                </div>

                <div class="col-md-2" style="padding-right: 0px">

                    <div class="row">

                        <div class="col-md-3"></div>

                        <div class="col-md-9">
                            <div class="card">

                                <ul class="nav nav-pills nav-fill flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link active list-group-item" href="#">发布文章</a>
                                    </li>
<!--
                                    <li class="nav-item">
                                        <a class="nav-link liColor list-group-item" href="#">文章管理</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link liColor list-group-item" href="#">分类管理</a>
                                    </li>
-->
                                    <li class="nav-item">
                                        <a class="nav-link liColor list-group-item" href="#">退出</a>
                                    </li>
                                </ul>
                            </div>


                        </div>
                    </div>


                </div>

                <div class="col-md-6" style="padding-left: 0px">
                    <div class="card">
                        <div class="card-header" style="background-color: white">
                            <div class="row">
                                <div class="col-md-3" style="font-size: 18px">发布</div>
                                <!--                        <div class="col-md-9" style="margin-top: 8px;font-size: 12px;text-align: right">当前位置>专委会介绍>文件资料</div>-->
                            </div>
                        </div>

                        <form method="post" action="post_servlet" > <!-- 跳转界面-->

                        <div class="card-body" style="min-height: 1000px">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group mb-1 mt-2 ml-0 mr-1" >
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"  >文章标题</span>
                                             ${title}
                                        </div>
                                        <input id="title" name="title" type="text" class="form-control" placeholder="不多于100字" style="margin-right: 5px">
                                    </div>

                                </div>

                            </div>
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group mb-1 mt-2 ml-0 mr-1" >
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"  >用户名</span>
                                        </div>
                                        <input id="username" name="username" type="text" class="form-control" placeholder="不多于100字" style="margin-right: 5px">
                                    </div>

                                </div>

                            </div>


                            <div style="padding: 8px 0; color: #ccc"></div>
                            <div id="div1" class="toolbar">
                            </div>

                            <div >
                            <textarea  id="content" name="content" oninput="textareaFunc()"></textarea>
                                <script>

                            
                            </script>

                            </div>


                            <div class="row">

                                <div class="col-md-5">
                                    <div class="input-group mb-3 mt-3 ml-0" >
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">文章分类</span>
                                        </div>
                                        <input id="category" name="category" type="text" class="form-control" >
                                    </div>
                                </div>
                            </div>


                            <div class="row" style="padding: 15px">

                                <div class="col-md-1"></div>
                                <div class="col-md-2 ml-0">
                                    <button type="submit" class="btn btn-primary" id="publishBtn">发布</button>
                                </div>


                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-light">返回</button>
                                </div>


                            </div>

                        </div>
                </form>

                    </div>
                </div>

                <div class="col-md-2">
               


                </div>
            </div>

        </div>
</body>
</html>