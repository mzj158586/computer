<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>"/>
		<meta charset="UTF-8">
		<!--edge浏览器H5兼容设置-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!--360浏览器H5兼容设置-->
		<meta name="renderer" content="webkit" />
		<title>电脑商城</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--导入核心文件-->
		<script src="bootstrap3/js/holder.js"></script>
		<link href="bootstrap3/css/bootstrap.css" rel="stylesheet" type="text/css">
		<script src="bootstrap3/jquery-1.9.1.min.js"></script>
		<script src="bootstrap3/js/bootstrap.js"></script>
		<!-- 字体图标 -->
		<link rel="stylesheet" href="bootstrap3/font-awesome-4.7.0/css/font-awesome.css" />
		<link rel="stylesheet" type="text/css" href="css/top.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<link rel="stylesheet" type="text/css" href="css/layout.css" />
		<link rel="stylesheet" type="text/css" href="css/reg.css" />
		<link rel="stylesheet" type="text/css" href="css/footer.css" />
	</head>
	<body>
	<script type="text/javascript">
		$(function () {

		    $("#btn-reg").click(function () {
				var username =$.trim($("#username").val())
				var password =$.trim($("#password").val())
				$.ajax({
					url:"user/register.do",
					type:"post",
					dataType:"json",
					data:{
					  username:username,
					  password:password
					},
					success:function (reg) {
						if (reg.state==1){
						    alert(reg.msg);
						} else {
                            alert(reg.msg)
						}
                        $("#password").val("")

                    }
				})
            })



        })
	</script>


		<!--头部-->
		<header class="header">
			<img src="images/index/stumalllogo.png" alt="" />
			<span class="pull-right"><small>欢迎访问</small><b>电脑商城</b></span>
		</header>
		<!--主体-->
		<div class="container mycontent text-left">
			<!--透明层 -->
			<div class="regDiv">
				<p>新用户注册</p>
				<!--表单开始-->
				<form id="form-reg" class="form-horizontal" role="form">
					<!--用户名-->
					<div class="form-group">
						<label class="col-md-3 control-label">名字：</label>
						<div class="col-md-8">
							<input  id="username" name="username" type="text" class="form-control" placeholder="请输入用户名">
						</div>
					</div>
					<!--密码-->
					<div class="form-group">
						<label class="col-md-3 control-label"> 密码：</label>
						<div class="col-md-8">
							<input  id="password" name="password" type="text" class="form-control" placeholder="请输入密码">
						</div>
					</div>
					<!--确认密码-->
					<div class="form-group">
						<label class="col-md-3 control-label"> 确认密码：</label>
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="请再次输入密码">
						</div>
					</div>
					<!--提交按钮-->
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							<input id="btn-reg" class="btn btn-primary" type="button" value="立即注册" />
							<span class="pull-right"><small>已经有账号？</small><a href="web/login.jsp">登录</a></span>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--页脚开始-->
		<footer class="footer">
			<!-- 品质保障，私人定制等-->
			<div class="text-center rights container">
				<div class="col-md-offset-2 col-md-2">
					<span class="fa fa-thumbs-o-up"></span>
					<p>品质保障</p>
				</div>
				<div class="col-md-2">
					<span class="fa fa-address-card-o"></span>
					<p>私人订制</p>
				</div>
				<div class="col-md-2">
					<span class="fa fa-graduation-cap"></span>
					<p>学生特供</p>
				</div>
				<div class="col-md-2">
					<span class="fa fa-bitcoin"></span>
					<p>专属特权</p>
				</div>
			</div>
			<!--联系我们、下载客户端等-->
			<div class="container beforeBottom">
				<div class="col-md-offset-1 col-md-3">
					<div><img src="images/index/stumalllogo.png" alt="" class="footLogo" /></div>
					<div><img src="images/index/footerFont.png" alt="" /></div>
				</div>
				<div class="col-md-4 callus text-center">
					<div class="col-md-4">
						<ul>
							<li><a href="#"><p>买家帮助</p></a></li>
							<li><a href="#">新手指南</a></li>
							<li><a href="#">服务保障</a></li>
							<li><a href="#">常见问题</a></li>
						</ul>
					</div>
					<div class="col-md-4">
						<ul>
							<li><a href="#"><p>商家帮助</p></a></li>
							<li><a href="#">商家入驻</a></li>
							<li><a href="#">商家后台</a></li>
						</ul>
					</div>
					<div class="col-md-4">
						<ul>
							<li><a href="#"><p>关于我们</p></a></li>
							<li><a href="#">关于圆心</a></li>
							<li><a href="#">联系我们</a></li>
							<li>
								<span class="fa fa-wechat"></span>
								<span class="fa fa-weibo"></span>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="col-md-5">
						<p>电脑商城客户端</p>
						<img src="images/index/ios.png" class="lf">
						<img src="images/index/android.png" alt="" class="lf" />
					</div>
					<div class="col-md-6">
						<img src="images/index/erweima.png">
					</div>
				</div>
			</div>
			<!-- 页面底部-备案号 #footer -->
			<div class="col-md-12 text-center bottom">
				Copyright © 2022 dnsc.cn All Rights Reserved 京ICP备08963888号-45 <a target="_blank" href="http://www.dnsc.cn/">圆心科技集团有限公司</a> 版权所有
			</div>
		</footer>
		<!--页脚结束-->
	</body>

</html>