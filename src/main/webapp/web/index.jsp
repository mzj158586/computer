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
		<script src="bootstrap3/jquery-1.8.3.min.js"></script>
		<script src="bootstrap3/js/bootstrap.js"></script>
		<%--<script src="js/menu.js" type="text/javascript" charset="utf-8"></script>--%>
		<!-- 字体图标 -->
		<link rel="stylesheet" href="bootstrap3/font-awesome-4.7.0/css/font-awesome.css" />
		<link rel="stylesheet" type="text/css" href="css/layout.css" />
		<link rel="stylesheet" type="text/css" href="css/webindex.css" />
		<link rel="stylesheet" type="text/css" href="css/footer.css" />
		<link rel="stylesheet" type="text/css" href="css/top.css" />
	</head>

	<body>

	<script type="text/javascript">

        $(function () {

            $.ajax({
                url:"sale/selectProducts.do",
                type:"get",
                dataType:"json",
                success:function (reg) {
                    if (reg.state==1){
                     var str ='';
                     $("#hot-list").empty()
                     $.each(reg.result,function (i,n) {
                         str +='<div class="col-md-12">'
                         str +='<div class="col-md-7 text-row-2"><a href="sale/selectProductById.do?id='+n.id+'">'+n.title+'</a></div>'
                         str +='<div class="col-md-2">'+n.price+'</div>'
                         str +='<div class="col-md-3"><img src="${pageContext.request.contextPath}'+n.image+'collect.png" class="img-responsive" /></div> '
                         str +='</div>'

                     })
                        $("#hot-list").append(str)

                    } else {
                        alert(reg.msg)
                    }

                }
            })

        })


	</script>

		<!--头部-->
		<header class="header">
			<!--电脑商城logo-->
			<div class="row">
				<div class="col-md-3">
					<a href="index.jspo">
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
									<li><a href="password.html">修改密码</a></li>
									<li><a href="web/userdata.jsp">个人资料</a></li>
									<li><a href="web/upload.jsp">上传头像</a></li>
									<li><a href="web/address.jsp">收货管理	</a></li>
								</ul>
							</div>
						</li>
						<li class="li-split">|</li>
						<li><a href="web/login.jsp"><span class="fa fa-user"></span>&nbsp;登录</a></li>
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
					<li class="active"><a href="index.jspo"><span class="fa fa-home"></span></a></li>
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
			<div class="row">
				<div class="col-md-2" id="indexMenu">
					<ul class="index-menu">
					</ul>
					<div id="showIndex">
						<ul class="second-menu">
							<li class="second-menu-li">####s</li>
						</ul>
					</div>
					<div id="showSecond">
						<ul class="third-menu">
						</ul>
					</div>
				</div>
				<div class="col-md-10">
					<div id="myCarousel" class="carousel slide">
						<!-- 轮播（Carousel）指标 -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
							<li data-target="#myCarousel" data-slide-to="3"></li>
							<li data-target="#myCarousel" data-slide-to="4"></li>
						</ol>
						<!-- 轮播（Carousel）项目 -->
						<div class="carousel-inner" align="center">
							<div class="item active">
								<img src="images/index/index_banner1.png">
							</div>
							<div class="item">
								<img src="images/index/index_banner2.png">
							</div>
							<div class="item">
								<img src="images/index/index_banner3.png">
							</div>
							<div class="item">
								<img src="images/index/index_banner4.png">
							</div>
							<div class="item">
								<img src="images/index/index_banner5.png">
							</div>
						</div>
						<!-- 轮播（Carousel）导航 -->
						<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
			
			<!--推荐栏目-->
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<p class="panel-title">新到好货</p>
						</div>
						<div class="panel-body panel-item">
							<div class="col-md-12">
								<div class="col-md-7 text-row-2"><a href="product.jsp">齐心（COMIX）C5902 A5优品商务笔记本子记事本日记本122张</a></div>
								<div class="col-md-2">¥18</div>
								<div class="col-md-3"><img src="images/portal/02COMIXC5902A5122blue/collect.png" class="img-responsive" /></div>
							</div>
							<div class="col-md-12">
								<div class="col-md-7  text-row-2"><a href="product.jsp">得力（deli）1548A商务办公桌面计算器 太阳能双电源</a></div>
								<div class="col-md-2">¥50</div>
								<div class="col-md-3"><img src="images/portal/002calculator1548A/collect.png" class="img-responsive" /></div>
							</div>
							<div class="col-md-12">
								<div class="col-md-7 text-row-2"><a href="product.jsp">戴尔(DELL)XPS13-9360-R1609 13.3</a></div>
								<div class="col-md-2">¥6299</div>
								<div class="col-md-3"><img src="images/portal/12(DELL)XPS13gold/collect.png" class="img-responsive" /></div>
							</div>
							<div class="col-md-12">
								<div class="col-md-7 text-row-2"><a href="product.jsp">联想（Lenovo）IdeaPad310高配版</a></div>
								<div class="col-md-2">¥5298</div>
								<div class="col-md-3"><img src="images/portal/13LenovoIdeaPad310_black/collect.png" class="img-responsive" /></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<p class="panel-title">热销排行</p>
						</div>
						<div id="hot-list" class="panel-body panel-item">


						</div>
					</div>
				</div>
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