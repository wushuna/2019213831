<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>注册</title>

        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="this is my page">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">

        <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

        <style type="text/css">
		
		
		/*插入背景图*/
		body{
			background-image: url("./images/4.jpg");
			background-repeat: no-repeat;
			/* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
			background-attachment: fixed;  /*此条属性必须设置否则可能无效*/
			/* 让背景图基于容器大小伸缩 */
			background-size: 100%;
           
		}
		
		
        /* 标题 */
		#user_reg h2{
        background:linear-gradient(to right,rgb(255,168,186),rgb(121,245,255));
                -webkit-background-clip:text;
                color:transparent;
        letter-spacing: 4px;
        text-align: center;
        }
        h2{
        font-size: 2em;
        margin: 0.67em 0;
        }

		#user_reg{
		background:linear-gradient(to right,rgb(255,168,186),rgb(121,245,255));
                -webkit-background-clip:text;
                color:transparent;
		
			font-family: 微软雅黑;
			font-size: 20px;
			text-align: center;
			margin-top: 80px;
		}
		
		
		form{
			width: 500px;
			margin: 50px auto auto auto;

		}
		/* 输入框 */
		input{
		    height: 30px;
			width: 15em;
			margin-top: 5px;
			margin-left:30px;
			margin-bottom: 5px;
			background-color: white;
			border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A ;
            border-radius: 4px;

		}
		/*input标签下的属性选择器*/
		input[type="submit"],input[type="reset"]{
		    height: 25px;
			width: 5em;
			margin-top: 5px;
			margin-left: 7px;
			font-size: 15px;
			background-color: #4a77d4;
			color: #fff;
			border: 1px solid #3762bc;

		}
	</style>
    </head>

    <script type="text/javascript">
	//onblur失去焦点事件，用户离开输入框时执行 JavaScript 代码：
	//函数1：验证邮箱格式
  	function validate_username(username){
  		//定义正则表达式的变量:邮箱正则
  		var emailReg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
  		//console.log(username);
  		if(username !="" && username.search(emailReg) != -1)
  		{
  			document.getElementById("test_user").innerHTML = "<font color='white' size='1px'>√</font>";
  		}else{
  			document.getElementById("test_user").innerHTML = "<font color='white' size='1px'>邮箱格式错误</font>";
  		}
  	}
  
 	//函数2：验证密码是否符合要求：匹配6位密码，由数字和字母组成：
  	function validate_password(password){
  		//^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6-10}$
		//测试密码：12345y
  		var passwordReg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6}$/;
  		if(password != "" && password.search(passwordReg) != -1)
  		{
  			document.getElementById("test_pw").innerHTML = "<font color='white' size='1px'>√</font>";
  		}else{
  			document.getElementById("test_pw").innerHTML = "<font color='white' size='1px'>密码格式错误</font>";
  			alert("密码有6位，由数字和字母组成!");
  		}
  	}
  	
	//函数3：验证两次输入的密码是否一样
  	 function validate_password2(password2){
  		var password = document.getElementById("password").value;
  		//测试：console.log(password);
  		//测试：console.log(password2);
  		if (password == ""){
			document.getElementById("is_test_pw").innerHTML = "<font color='white' size='1px'>密码不为空</font>";
		}else if(password==password2){
  			document.getElementById("is_test_pw").innerHTML = "<font color='white' size='1px'>√</font>";
  		}else{
  			document.getElementById("is_test_pw").innerHTML = "<font color='white' size='1px'>两次输入的密码不相同</font>";
  			//console.log("密码有6位，由数字和字母组成!");
  		}
  	} 
  	
	//函数4：验证表单是否已经填好
  	function validate_form(){
  		var username = document.getElementById("username").value;
  		var password = document.getElementById("password").value;
  		var password2 = document.getElementById("password2").value;
  		//console.log("表单填写正确，可以正常提交！");
  	
  		//这三个，如果任何一个有问题，都返回false
  		//18128@qq.com		12345y
  		var emailReg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
  		var passwordReg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6}$/;
  		
  		if(username != "" && emailReg.test(username)){
  			if(password !="" && passwordReg.test(password)){
  				if(password2==password){
  					alert("信息填写正确，可以正常提交！");
  					console.log("信息填写正确，可以正常提交！");
  					return true;
  				}else{
  					alert("密码不一致，提交失败，请重新填写！");
  					console.log("密码不一致，提交失败，请重新填写！");
  					return false;
  				}
  			}else{
  				alert("密码格式错误，提交失败，请重新填写！");
  				console.log("密码格式错误，提交失败，请重新填写！");
  				return false;
  			}
  		}else{
  			alert("注册的账号不符合要求，提交失败，请重新填写！");
  			console.log("注册的账号不符合要求，提交失败，请重新填写！");
  			return false;
  		}
  	}
  </script>

    <body>
        <div id="user_reg">
            <h2>注册账户</h2>
        <form action="zhuce_servlet" method="post" name="form" >
            <table>
                <tr>
                    <td>账号：</td>
                    <td><input type="text" id="username" name="username" placeholder="只能用邮箱注册" onblur="validate_username(this.value)"/></td>
                    <td id="test_user"></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input type="password" id="password" name="password" placeholder="6位密码由数字和字母组成" onblur="validate_password(this.value)"/></td>
                    <td id="test_pw"></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td><input type="password" id="password2" name="password2" onblur="validate_password2(this.value)" /></td>
                    <td id="is_test_pw"></td>
                </tr>
                <tr>
                    <td></td>
                    <td ><input type="submit" id="submit_form" value="注册" onclick="return validate_form()"/>
                        <input type="reset" value="重置"/>
                    </td>
                </tr>
            </table>
        </form>
        </div>
    </body>
</html>