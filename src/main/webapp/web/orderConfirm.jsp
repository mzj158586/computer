<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
			request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>"/>
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
		<link rel="stylesheet" type="text/css" href="css/orderConfirm.css" />
		<link rel="stylesheet" type="text/css" href="css/cart.css" />
		<%--<script src="js/orderConfirm.js" type="text/javascript" charset="utf-8"></script>--%>
	</head>

	<body>

	<script type="text/javascript">

		$(function () {

            showAddressList()
			showGoodsList()

        })

		function showAddressList(){

            $.ajax({
                url:"addr/showAddressList.do",
                type:"post",
                dataType:"json",
                success:function (reg) {
                    if (reg.state==1){
                        $("#address-list").empty()
						var str = "";
						$.each(reg.result,function (i,n) {
                            str += '<option>'+n.name+'&nbsp;&nbsp;&nbsp;'+n.tag+'&nbsp;&nbsp;&nbsp;'+n.address+'&nbsp;&nbsp;&nbsp;'+n.phone+'</option>'
                        })
                        $("#address-list").append(str)

                    } else {
                        alert(reg.msg)
                    }

                }
            })

		}
		function showGoodsList () {
            $.ajax({
                url:"order/selectGoodsList.do",
                type:"post",
                dataType:"json",
                data:location.search.substr(1),
                success:function (reg) {
                    if (reg.state==1){
						var str = '';
						$("#cart-list").empty();
						var countNum = 0;
						var countPrice =0;
						$.each(reg.result,function (i,n) {

                            str +='<tr>'
                            str +='<td><img src="${pageContext.request.contextPath}'+n.image+'collect.png" class="img-responsive" /></td>'
                            str +='<td>'+n.title+'</td>'
                            str +='<td>¥<span>'+n.price+'</span></td>'
                            str +='<td>'+n.num+'</td>'
                            str +='<td><span>'+(n.price)*n.num+'</span></td>'
                            str +='</tr>'
							countNum += n.num
							countPrice += n.num*n.price;

                        })
						$("#all-count").html(countNum)
						$("#all-price").html(countPrice)
                        $("#cart-list").append(str)



                    } else {
                        alert(reg.msg)
                    }

                }
            })

        }


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
						<li><a href="cart.jsp"><span class="fa fa-cart-plus"></span>&nbsp;购物车</a></li>
						<li class="li-split">|</li>
						<li>
							<!--下列列表按钮 ：管理-->
							<div class="btn-group">
								<button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
									<span id="top-dropdown-btn"><span class="fa fa-gears"></span>&nbsp;管理 <span class="caret"></span></span>
								</button>
								<ul class="dropdown-menu top-dropdown-ul" role="menu">
									<li><a href="password.html">修改密码</a></li>
									<li><a href="userdata.jsp">个人资料</a></li>
									<li><a href="upload.jsp">上传头像</a></li>
									<li><a href="address.jsp">收货管理	</a></li>
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
			<div class="col-md-offset-1 col-md-10">
				<div class="col-md-4">
					<div class="col-md-12 order-bar-active">
						1.确认订单信息
						<span class="pull-right"><span class="fa fa-chevron-right"></span></span>
					</div>
				</div>
				<div class="col-md-4">
					<div class="col-md-12 order-bar-undo">
						2.在线支付
						<span class="pull-right"><span class="fa fa-chevron-right"></span></span>
					</div>
				</div>
				<div class="col-md-4">
					<div class="col-md-12 order-bar-undo">
						3.付款成功
					</div>
				</div>
				<div class="col-md-12">
					<form id="form-create-order" role="form">
						<div class="form-group">
							<label for="name">
								<p>选择收货地址：</p>
							</label>
							<select name="aid" id="address-list" class="form-control">

							</select>
						</div>
						<div class="panel panel-primary">
							<div class="panel-heading">
								<p class="panel-title">订单商品信息：</p>
							</div>
							<div class="panel-body">
								<table class="cart-table" width="100%">
									<thead>
										<tr>
											<th width="15%"></th>
											<th width="35%">商品</th>
											<th width="15%">单价</th>
											<th width="15%">数量</th>
											<th width="20%">金额</th>
										</tr>
									</thead>
									<tbody id="cart-list" class="cart-body">

									</tbody>
								</table>
								<div class="total-bar">
									&nbsp;
									<span class="pull-right">已选商品
										<span id="all-count">1</span>件 总价¥
										<span id="all-price">5298</span>元
									</span>
								</div>
							</div>
						</div>
						<div class="pay-bar">
							<a href="cart.jsp">返回购物车</a>
							<span class="pull-right"><input id="btn-create-order" type="button" value="在线支付" class="btn btn-primary btn-lg link-pay"/></span>
						</div>
					</form>
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