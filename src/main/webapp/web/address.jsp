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
		<link rel="stylesheet" type="text/css" href="css/layout.css" />
		<link rel="stylesheet" type="text/css" href="css/top.css" />
		<link rel="stylesheet" type="text/css" href="css/footer.css" />
		<script src="js/adddel.js" type="text/javascript" charset="utf-8"></script>
	</head>

	<body>
		<script type="text/javascript">
			$(function () {


                $.ajax({
                    url:"addr/selectAddress.do",
                    type:"get",
                    dataType:"json",
                    success:function (reg) {
                        if (reg.state==1){
                            var str ='';
                            $.each(reg.result,function (i,n) {

                                str +='<tr>'
                                str +='<td>'+n.tag+'</td>'
                                str +='<td>'+n.name+'</td>'
                                str +='<td>'+n.address+'</td>'
                                str +='<td>'+n.phone+'</td>'
                                str +='<td><a class="btn btn-xs btn-info"><span class="fa fa-edit"></span> 修改</a></td>'
                                str +='<td><a class="btn btn-xs add-del btn-info"><span class="fa fa-trash-o"></span> 删除</a></td>'
                                str +='<td><a   class="btn btn-xs add-def btn-default">设为默认</a></td>'
                                str +='</tr>'
                            })

							$("#address-list").append(str)
                        } else {

                        }


                    }
                })

				$(".add-def:eq(0)").hide()

            })

		</script>


		<!--头部-->
		<header class="header">
			<!--电脑商城logo-->
			<div class="row">
				<div class="col-md-3">
					<a href="index.jsp">
						<img src="images/index/stumalllogo.png" />
					</a>
				</div>
				<!--快捷选项-->
				<div class="col-md-9 top-item">
					<ul class="list-inline pull-right">
						<li><a href="favorites.html"><span class="fa fa-heart"></span>&nbsp;收藏</a></li>
						<li class="li-split">|</li>
						<li><a href="orders.html"><span class="fa fa-file-text"></span>&nbsp;订单</a></li>
						<li class="li-split">|</li>
						<li><a href="web/cart.jsp"><span class="fa fa-cart-plus"></span>&nbsp;购物车</a></li>
						<li class="li-split">|</li>
						<li>
							<!--下列列表按钮 ：管理-->
							<div class="btn-group">
								<button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
									<span id="top-dropdown-btn"><span class="fa fa-gears"></span>&nbsp;管理 <span class="caret"></span></span>
								</button>
								<ul class="dropdown-menu top-dropdown-ul" role="menu">
									<li><a href="web/password.html">修改密码</a></li>
									<li><a href="web/userdata.jsp">个人资料</a></li>
									<li><a href="web/upload.jsp">上传头像</a></li>
									<li><a href="web/address.jsp">收货管理	</a></li>
								</ul>
							</div>
						</li>
						<li class="li-split">|</li>
						<li><a href="login.jsp"><span class="fa fa-user"></span>&nbsp;登录</a></li>
					</ul>
				</div>
			</div>
		</header>
		<!--导航 -->
		<!--分割导航和顶部-->
		<div class="row top-nav">
			<div class="col-md-6">
				<ul class="nav nav-pills">
					<li>
						<a href="#"></a>
					</li>
					<li class="active"><a href="index.jsp"><span class="fa fa-home"></span></a></li>
					<li><a href="#">秒杀</a></li>
					<li><a href="#">优惠券</a></li>
					<li><a href="#">电脑VIP</a></li>
					<li><a href="#">外卖</a></li>
					<li><a href="#">超市</a></li>
				</ul>
			</div>
			<div class="col-md-6">
				<form action="search.html" class="form-inline pull-right" role="form">
					<div class="form-group">
						<input type="text" class="form-control" id="search" name="search" placeholder="请输入商品名称进行搜索">
					</div>
					<button type="submit" class="btn btn-default btn-sm"><span class="fa fa-search"></span></button>
				</form>
			</div>
		</div>
		<!--头部结束-->
		<!--导航结束-->
		<div class="container">
			<div class="col-md-2">
				<!--左侧导航开始-->
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!--主选项：我的订单-->
							<p class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">我的订单</a>
							</p>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<div><a href="orders.html">全部订单</a></div>
								<div><a href="orders.html">待付款</a></div>
								<div><a href="orders.html">待收货</a></div>
								<div><a href="orders.html">待评价</a></div>
								<div><a href="orders.html">退货退款</a></div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<!--主选项：资料修改-->
							<p class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">资料修改</a>
							</p>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse in">
							<div class="panel-body">
								<div><a href="web/password.html">修改密码</a></div>
								<div><a href="web/userdata.jsp">个人资料</a></div>
								<div><a href="web/upload.jsp">上传头像</a></div>
								<div><a href="web/address.jsp"><b>收货管理</b></a></div>
							</div>
						</div>
					</div>
				</div>
				<!--左侧导航结束-->
			</div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<ul class="nav nav-tabs">
						<li><a href="web/password.html">修改密码</a></li>
						<li><a href="web/userdata.jsp">个人资料</a></li>
						<li><a href="web/upload.jsp">上传头像</a></li>
						<li class="active"><a href="web/address.jsp">收货管理</a></li>
					</ul>
					<div class="panel-body">
						<!--地址显示-->
						<table class="table table-striped">
							<caption>收货地址列表</caption>
							<thead>
								<tr>
									<th>地址类型</th>
									<th>收货人姓名</th>
									<th>详细地址</th>
									<th>联系电话</th>
									<th colspan="3">操作</th>
								</tr>
							</thead>
							<tbody id="address-list">

							</tbody>
						</table>
						<a href="web/addAddress.jsp" class="btn btn-sm btn-primary"><span class="fa fa-plus"></span>新增收货地址</a>
					</div>
				</div>
			</div>
		</div>
		<!--页脚开始-->
		<div class="clearfix"></div>
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
							<li>
								<a href="#">
									<p>买家帮助</p>
								</a>
							</li>
							<li><a href="#">新手指南</a></li>
							<li><a href="#">服务保障</a></li>
							<li><a href="#">常见问题</a></li>
						</ul>
					</div>
					<div class="col-md-4">
						<ul>
							<li>
								<a href="#">
									<p>商家帮助</p>
								</a>
							</li>
							<li><a href="#">商家入驻</a></li>
							<li><a href="#">商家后台</a></li>
						</ul>
					</div>
					<div class="col-md-4">
						<ul>
							<li>
								<a href="#">
									<p>关于我们</p>
								</a>
							</li>
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