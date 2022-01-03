<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login1</title>
        <link rel="stylesheet" href="./cess/reset.css">
        <style>
            * {
                box-sizing: border-box;
            }

            /* body 样式 */
            body {
                font-family: Arial;
                margin: 0;
                background-image: url("./images/4.jpg");
                background-repeat: no-repeat;
                background-size: 100%;
            }
            
            /* 标题 */
            .header{
                padding:40px;
                text-align:center;
                  background-repeat:no-repeat;
                  background-size:130%
                  
            }
            
            /*标题字体*/
            .header h1{
                font-size:50px;
               background:linear-gradient(to right,rgb(255,168,186),rgb(141,232,255));
                -webkit-background-clip:text;
                color:transparent;
            }
			p{
			font-size:20px;
                background:linear-gradient(to right,rgb(255,168,186),rgb(141,232,255));
                -webkit-background-clip:text;
                color:transparent;
			}
			/*字体*/
			
            
            /* 列容器 */
            .row{
                display: -ms-flexbox;
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;  
            }
            
            /* 中间部分 */
            .side{
            	
                -ms-flex: 30%;
                flex: 30%;
                background-color:green;
                padding:100px 180px;
                background:linear-gradient(to right,rgba(26,65,123,0),rgba(22,32,71,0));
              color:transparent;
               border-radius:12px 12px 12px 12px;
            }
            
          
            
            .main{
                -ms-flex: 70%;
                flex: 70%;
                padding:220px;
              
            }
            
            /*登录*/
            .login{
                position: absolute;
                top:380px;
                left:650px;
                margin: -165px 0 0 -150px;
                width: 300px;
                height: 200px;
            }
            
            .login h2{
            	padding:0px 110px;
                color: white;
                letter-spacing: 1px;
            }

            h2{
            margin: 0.67em 0;
            }

            input{
            width: 280px;
            height: 30px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 13px;
            color: #ffff
            text-shadow:1px 1px 1px;
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            background-color: white;
            }

            .but{
            width: 280px;
            min-height: 15px;
            display: block;
            background-color: rgb(107,80,124);
            border: 1px solid #3762bc;
            color: #fff;
            padding: 9px 14px;
            font-size: 15px;
            line-height: normal;
            border-radius: 5px;
            margin: 0;
            }
            
        	.register,dt{
        	background:linear-gradient(to right,rgb(255,168,186),rgb(121,245,255));
                -webkit-background-clip:text;
                color:transparent;
        	font-size:15px;
        	}
        </style>
        
    </head>
    <body>
    		<audio src="./source/background.mp4" autoplay></audio>
        <div class="header">
            <h1>聚友趣</h1>
            <p>为每一个孤独的灵魂提供交流的平台</p>
        </div>


        <div class="row">
            <div class="side">
                <div class="login">
                    <h2>登录</h2>
                    	<div >
                    
       					<a class="register" href="./zhuce.jsp"><dt title="点击进入注册界面">快速注册</dt></a>
       	 				</div>
                    <form method="post" action="login_servlet" onSubmit="return login(this)"> <!-- 跳转地址 -->
                        <input type="text" name="username" required="required" placeholder="用户名" ></input>
                        <input type="password" name="password" required="required" placeholder="密码" ></input>
                        <button class="but" type="submit">登录</button>
                       		<a class="register" href="./Managerlogin.jsp"><dt title="点击进入管理员界面">管理员登录</dt></a>
                    </form>
                </div>
                			
            </div>
				
            <div class="main">
                
            </div>
            
        </div>

    </body>
</html>
