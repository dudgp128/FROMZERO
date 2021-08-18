<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

#slider-wrap {
	width: 600px;
	height: 600px; 
	position: relative;
	overflow: hidden;
	margin: 0 auto;
}

#slider-wrap ul#slider {
	height: 100%;
	position: absolute;
	left: 0;
}

#slider-wrap ul#slider li {
	float: left;
	position: relative;
	width: 600px;
}

#slider-wrap ul#slider li>div {
	position: absolute;
	top: 20px;
	left: 35px;
}

#slider-wrap ul#slider li>div h3 {
	font-size: 36px;
	text-transform: uppercase;
}

#slider-wrap ul#slider li>div span {
	font-size: 21px;
}

#slider-wrap ul#slider li img {
	display: block;
	width: 100%;
	height: 100%;
}

.slider-btns {
	position: absolute;
	width: 50px;
	height: 60px;
	top: 50%;
	margin-top: -25px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	background: rgba(0, 0, 0, 0.1);
	z-index: 100;
	-webkit-user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-ms-user-select: none;
	-webkit-transition: all 0.1s ease;
	-o-transition: all 0.1s ease;
	transition: all 0.1s ease;
}

.slider-btns:hover {
	background: rgba(0, 0, 0, 0.3);
}

#next {
	right: -50px;
	border-radius: 7px 0px 0px 7px;
	color: #eee;
}

#previous {
	left: -50px;
	border-radius: 0px 7px 7px 7px;
	color: #eee;
}

#slider-wrap.active #next {
	right: 0px;
}

#slider-wrap.active #previous {
	left: 0px;
}

#slider-pagination-wrap {
	min-width: 20px;
	margin-top: 350px;
	margin-left: auto;
	margin-right: auto;
	height: 15px;
	position: relative;
	text-align: center;
}

#slider-pagination-wrap ul {
	width: 100%;
}

#slider-pagination-wrap ul li {
	margin: 0 4px;
	display: inline-block;
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background: #fff;
	opacity: 0.5;
	position: relative;
	top: 200px;
}

#slider-pagination-wrap ul li.active {
	width: 12px;
	height: 12px;
	top: 200px;
	opacity: 1;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
	box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}

#slider-wrap img {
	display: block;
	margin: 0px auto;
	z-index: 2;
}

#slider-wrap ul, #slider-pagination-wrap ul li {
	-webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}

div, table {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
#slider-wrap form {
	width:100%;
}
#slider-wrap button{
	border:0;
	outline:0;
}

</style>
<meta charset="UTF-8">
<title>From zero</title>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>
	<div>

		<div style="margin-left: 10%; width: 70%; margin-top: 15px">
			<div id="slider-wrap" style="float: left">
				<ul id="slider">
					<%
						PreparedStatement pstmt = null;
					ResultSet rset = null;
					Connection conn = null;
					Properties connectionProps = new Properties();

					String DBUrl = "jdbc:mysql://localhost:3306/fz_webapp";
					String DBuser = "fz_webapp";
					String DBpasswd = "fz_webapp";
					String DBTimeZone = "UTC";

					connectionProps.put("user", DBuser);
					connectionProps.put("password", DBpasswd);
					connectionProps.put("serverTimezone", DBTimeZone);
					String name = null;
					try {
						conn = DriverManager.getConnection(DBUrl, connectionProps);

						String sqlSt = "select * from eco_tip";
						pstmt = conn.prepareStatement(sqlSt);
						rset = pstmt.executeQuery();
					} catch (SQLException e) {
						e.printStackTrace();
					}

					String eco_name = null;
					String title = null;
					String img_path = null;

					if (rset.next()) {
						name = rset.getString("name");
						title = rset.getString("title");
						img_path = "card_news/" + name + " (1).jpg";
					%>


					<li>
						
						<form method="post" action="doCardNews" style="width:100%">
							<button type="hidden" value="bangle" name="name">
							<div style="text-align:center">
								<img src="card_news/bangle (1).jpg"></div>
							</button>
						</form>
					</li>



					<li>

						
						<form method="post" action="doCardNews">
							<button type="hidden" value="cotton_pad" name="name">
								<img src="card_news/cotton_pad (1).jpg">
							</button>
						</form>

					</li>


					<li>
						
						<form method="post" action="doCardNews">
							<button type="hidden" value="food" name="name">
								<img src="card_news/food (1).jpg">
							</button>
						</form>
					</li>

					<li>
						<form method="post" action="doCardNews">
							<button type="hidden" value="hand_washing" name="name">
								<img src="card_news/hand_washing (1).jpg">
							</button>
						</form>
					</li>

					<li>
						<form method="post" action="doCardNews">
							<button type="hidden" value="mask" name="name">
								<img src="card_news/mask (1).jpg">
							</button>
						</form>
					</li>
					<%
						}
					%>

				</ul>

				<div class="slider-btns" id="next">
					<span>▶</span>
				</div>
				<div class="slider-btns" id="previous">
					<span>◀</span>
				</div>

				<div id="slider-pagination-wrap">
					<ul>
					</ul>
				</div>
			</div>

			<div style="float: left; width: 30%; margin-left: 30px">
				<table style="width: 600px; background-color: white">
					<tr>
						<td style="padding: 0"><a href="test.jsp"><img
								style="display: block; width: 100%; margin: 0"
								src="big_category_img/ECO_LEVELTEST.jpg"></a></td>
						<td style="padding: 0"><a href="exchange.jsp"><img
								style="display: block; width: 100%; margin: 0"
								src="big_category_img/ECO_POINT.jpg"></a></td>
					<tr>
						<td style="padding: 0"><a href="recycling_method.jsp"><img
								style="display: block; width: 100%; margin: 0"
								src="big_category_img/RECYCLE_METHOD.jpg"></a></td>
						<td style="padding: 0"><a href="eco_tip.jsp"><img
								style="display: block; width: 100%; margin: 0"
								src="big_category_img/ECO_TIPS.jpg"></a></td>
					</tr>
				</table>
			</div>
		</div>

		<div doz_type="widget" id="w20200430557f107c8695a"
			style="position: absoulte; top: 90%; margin-left: 10%; width: 81%; text-aling: center">
			<div class="_widget_data " data-widget-name="갤러리"
				data-widget-type="gallery2" data-widget-anim="none"
				data-widget-anim-duration="0.7" data-widget-anim-delay="0"
				data-widget-parent-is-mobile="N">
				<div class="widget _gallery_wrap ">
					<div id="container_w20200430557f107c8695a"
						class="img_rendering grid_02 type_grid img_border gallery2 "
						style="padding-bottom: 0px; height: auto; margin: 0px -15px;">
						<div class="_gallery_row gallery_row tabled">
							<div class="_item item_gallary"
								style="position: relative; padding: 15px;"
								data-org="S2017101059dc82fe9c146/e535a7276e76f.png">
								<div id="caption_3884542" style="display: none">
									<h4></h4>
									<br />
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">ALL
										PRODUCT</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>전체 상품.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p>
									<p></p>
									<h6 class="m_picker_btn_go picker_btn_go">
										<span><a href="shop.jsp">go →</a></span>
									</h6>
									<p></p>
								</div>
								<a class="item_container _item_container _fade_link "
									href="shop.jsp" style="display: block">
									<div class="img_wrap _img_wrap " id="gal_item_"
										style="background-image: url(https://post-phinf.pstatic.net/MjAyMDA2MTFfMTA3/MDAxNTkxODYzMjE5NDI2.P2mnQSNdHqEljR_3FXElm_d0NAR0CdkRQMgKOzSuXCAg.EfTy0pcdv0cCp32jQFt90wvaD_48mzw7KKu5PdsVaBMg.JPEG/%EB%A9%94%EC%9D%B8_1980.jpg?type=w1200;); 
										background-repeat: no-repeat;
										min-height: 270px;
										background-size: contain;"
										data-bg="url(https://cdn.imweb.me/thumbnail/20200502/1812d3ebea70c.png)"
										data-src="https://cdn.imweb.me/thumbnail/20200502/76f65282799e2.png"
										data-sub-html="#caption_3884542" data-no="0"></div>
								</a>
								<div class="text_wrap _text_wrap " id="gal_item_"
									data-src="https://cdn.imweb.me/thumbnail/20200502/76f65282799e2.png"
									data-sub-html="#caption_3884542" style="display: table;">
									<a class="item_container _item_container _fade_link "
										href="all.html" style="display: block">
										<p class="title"></p>
										<br />
										<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">ALL
											PRODUCT</h6>
										<h5 style="margin: 0; line-height: 1.6;">
											<strong>전체 상품.</strong>
										</h5>
										<p class="hidden-xs hidden-sm">
											<br> <br>
										</p> <span class="body"></span>
									</a>
									<h6 class="m_picker_btn_go picker_btn_go">
										<a class="item_container _item_container _fade_link "
											href="shop.jsp" style="display: block"><span></span></a><a
											href="shop.jsp">go →</a>
									</h6>
									<p></p>
								</div>
								<div class="slide_overlay"></div>
							</div>
							<div class="_item item_gallary"
								style="position: relative; padding: 15px;"
								data-org="S2017101059dc82fe9c146/42179990e4d51.jpg">
								<div id="caption_3838152" style="display: none">
									<h4></h4>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">LIVING</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>일상에서.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p>
									<p></p>
									<h6 class="m_picker_btn_go picker_btn_go">
										<span><a href="living.jsp">go →</a></span>
									</h6>
									<p></p>
								</div>
								<a class="item_container _item_container _fade_link "
									href="living.jsp" style="display: block">
									<div class="img_wrap _img_wrap " id="gal_item_"
										style="background-image: url(https://tumblbug-pci.imgix.net/ed20e46c8042780d76af2e556c713104e934fe29/77f1f632125ddea92714a670d08c5bd9536c9c89/e7808840b57ca6e9d1f2768557a56619c5fb04ae/1b0d3243-8712-4ef9-b92c-008d8c7fd958.jpg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=b37f9a352cb5de643e5092536a51aeca;); 
										background-repeat: no-repeat;
										min-height: 270px;
										background-size: cover;"
										data-bg="url(https://cdn.imweb.me/thumbnail/20200521/ca2f5493f3604.jpg)"
										data-src="https://cdn.imweb.me/thumbnail/20200521/77694d969bc9a.jpg"
										data-sub-html="#caption_3838152" data-no="1"></div>
								</a>
								<div class="text_wrap _text_wrap " id="gal_item_"
									data-src="https://cdn.imweb.me/thumbnail/20200521/77694d969bc9a.jpg"
									data-sub-html="#caption_3838152" style="display: table;">
									<a class="item_container _item_container _fade_link "
										href="living.jsp" style="display: block">
										<p class="title"></p>
										<br />
										<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">LIVING</h6>
										<h5 style="margin: 0; line-height: 1.6;">
											<strong>일상에서.</strong>
										</h5>
										<p class="hidden-xs hidden-sm">
											<br> <br>
										</p> <span class="body"></span>
									</a>
									<h6 class="m_picker_btn_go picker_btn_go">
										<a class="item_container _item_container _fade_link "
											href="living.jsp" style="display: block"><span></span></a><a
											href="living.jsp">go →</a>
									</h6>
									<p></p>
								</div>
								<div class="slide_overlay"></div>
							</div>
							<div class="_item item_gallary"
								style="position: relative; padding: 15px;"
								data-org="S2017101059dc82fe9c146/74d47eda697d6.jpg">
								<div id="caption_3838093" style="display: none">
									<h4></h4>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">BATHROOM
									</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>욕실에서.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p>
									<p></p>
									<h6 class="m_picker_btn_go picker_btn_go">
										<span><a href="bathroom.jsp">go →</a></span>
									</h6>
									<p></p>
								</div>
								<a class="item_container _item_container _fade_link "
									href="bathroom.jsp" style="display: block">
									<div class="img_wrap _img_wrap " id="gal_item_"
										style="background-image: url(&quot;https://cdn.imweb.me/thumbnail/20200521/884887fbae7da.jpg&quot;); 
										background-repeat: no-repeat;
										min-height: 270px;
										background-size: contain;"
										data-bg="url(https://cdn.imweb.me/thumbnail/20200521/06038cc8092a7.jpg)"
										data-src="https://cdn.imweb.me/thumbnail/20200521/0ff49d3b24d1d.jpg"
										data-sub-html="#caption_3838093" data-no="2"></div>
								</a>
								<div class="text_wrap _text_wrap " id="gal_item_"
									data-src="https://cdn.imweb.me/thumbnail/20200521/0ff49d3b24d1d.jpg"
									data-sub-html="#caption_3838093" style="display: table;">
									<a class="item_container _item_container _fade_link "
										href="bathroom.jsp" style="display: block">
										<p class="title"></p>
										<br />
										<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">BATHROOM
										</h6>
										<h5 style="margin: 0; line-height: 1.6;">
											<strong>욕실에서.</strong>
										</h5>
										<p class="hidden-xs hidden-sm">
											<br> <br>
										</p> <span class="body"></span>
									</a>
									<h6 class="m_picker_btn_go picker_btn_go">
										<a class="item_container _item_container _fade_link "
											href="bathroom.jsp" style="display: block"><span></span></a><a
											href="bathroom.jsp">go →</a>
									</h6>
									<p></p>
								</div>
								<div class="slide_overlay"></div>
							</div>
						</div>
						<div class="_gallery_row gallery_row tabled">
							<div class="_item item_gallary"
								style="position: relative; padding: 15px;"
								data-org="S2017101059dc82fe9c146/ec5a57b06213f.jpg">
								<div id="caption_3838142" style="display: none">
									<h4></h4>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">KITCHEN</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>부엌에서.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p>
									<p></p>
									<h6 class="m_picker_btn_go picker_btn_go">
										<span><a href="kitchen.jsp">go →</a></span>
									</h6>
									<p></p>
								</div>
								<a class="item_container _item_container _fade_link "
									href="kitchen.jsp" style="display: block">
									<div class="img_wrap _img_wrap " id="gal_item_"
										style="background-image: url(https://post-phinf.pstatic.net/MjAyMDA2MTJfMTQy/MDAxNTkxOTQ5ODcwNDgw.XWHTxq56-cHHogt2mD5_A1UPAe59vBTemqcIy4Wy0M8g.XKo2Lm3Ol36dQDuU3NbDjYqfMV6IcO94Zf28f8aAI4kg.JPEG/Zero_Waste.jpg?type=w1200;); 
										background-repeat: no-repeat;
										min-height: 270px;
										background-size: contain;"
										data-bg="url(https://cdn.imweb.me/thumbnail/20200521/35dab18b68bc3.jpg)"
										data-src="https://cdn.imweb.me/thumbnail/20200521/db2e758a70105.jpg"
										data-sub-html="#caption_3838142" data-no="3"></div>
								</a>
								<div class="text_wrap _text_wrap " id="gal_item_"
									data-src="https://cdn.imweb.me/thumbnail/20200521/db2e758a70105.jpg"
									data-sub-html="#caption_3838142" style="display: table;">
									<a class="item_container _item_container _fade_link "
										href="kithen.jsp" style="display: block">
										<p class="title"></p>
										<br />
										<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">KITCHEN</h6>
										<h5 style="margin: 0; line-height: 1.6;">
											<strong>부엌에서.</strong>
										</h5>
										<p class="hidden-xs hidden-sm">
											<br> <br>
										</p> <span class="body"></span>
									</a>
									<h6 class="m_picker_btn_go picker_btn_go">
										<a class="item_container _item_container _fade_link "
											href="kitchen.jsp" style="display: block"><span></span></a><a
											href="kithen.jsp">go →</a>
									</h6>
									<p></p>
								</div>
								<div class="slide_overlay"></div>
							</div>
							<div class="_item item_gallary"
								style="position: relative; padding: 15px;"
								data-org="S2017101059dc82fe9c146/580422ca58936.png">
								<div id="caption_3838094" style="display: none">
									<h4></h4>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">KIT</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>다양한 키트.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p>
									<p></p>
									<h6 class="m_picker_btn_go picker_btn_go">
										<span><a href="kit.jsp">go →</a></span>
									</h6>
									<p></p>
								</div>
								<a class="item_container _item_container _fade_link "
									href="kit.jsp" style="display: block">
									<div class="img_wrap _img_wrap " id="gal_item_"
										style="background-image: url(https://tumblbug-pci.imgix.net/8047a90aa1bf9936012f741d35e13f6ef3f80c24/39e21856949716787891eeef2c246ef751f78b0e/d0ea5938ea140147d732b060f8b0aec188d70cfb/9dd81feb-66b2-4e24-bb89-bacad9d35998.jpeg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=b4228c49a7a31f9771260ef46a371d6f;); 
										background-repeat: no-repeat;
										min-height: 270px;
										background-size: cover;"
										data-bg="url(https://cdn.imweb.me/thumbnail/20200502/75743900a9ff6.pnghttp://localhost:8080/WebappLogin/kit/5.jpg)"
										data-src="http://localhost:8080/WebappLogin/kit/5.jpg"
										data-sub-html="#caption_3838094" data-no="4"></div>
								</a>
								<div class="text_wrap _text_wrap " id="gal_item_"
									data-src="https://cdn.imweb.me/thumbnail/20200502/12e77bd028f3c.png"
									data-sub-html="#caption_3838094" style="display: table;">
									<a class="item_container _item_container _fade_link "
										href="kit.jsp" style="display: block">
										<p class="title"></p>
										<br />
										<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">KIT</h6>
										<h5 style="margin: 0; line-height: 1.6;">
											<strong>다양한 키트.</strong>
										</h5>
										<p class="hidden-xs hidden-sm">
											<br> <br>
										</p> <span class="body"></span>
									</a>
									<h6 class="m_picker_btn_go picker_btn_go">
										<a class="item_container _item_container _fade_link "
											href="kit.jsp" style="display: block"><span></span></a><a
											href="kit.jsp">go →</a>
									</h6>
									<p></p>
								</div>
								<div class="slide_overlay"></div>
							</div>
							<div class="_item item_gallary"
								style="position: relative; padding: 15px;"
								data-org="S2017101059dc82fe9c146/2369049e4d258.jpg">
								<div id="caption_3838108" style="display: none">
									<h4></h4>
									<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">ETC</h6>
									<h5 style="margin: 0; line-height: 1.6;">
										<strong>그 외의 것들.</strong>
									</h5>
									<p class="hidden-xs hidden-sm">
										<br> <br>
									</p>
									<p></p>
									<h6 class="m_picker_btn_go picker_btn_go">
										<span><a href="etc.jsp">go →</a></span>
									</h6>
									<p></p>
								</div>
								<a class="item_container _item_container _fade_link "
									href="etc.jsp" style="display: block">
									<div class="img_wrap _img_wrap " id="gal_item_"
										style="background-image: url(https://northumberlandhoney.co.uk/wp-content/uploads/2021/02/Honey21-020-scaled.jpg;); 
										background-repeat: no-repeat;
										min-height: 270px;
										background-size: cover;"
										data-bg="url(https://cdn.imweb.me/thumbnail/20200521/884887fbae7da.jpg)"
										data-src="https://cdn.imweb.me/thumbnail/20200521/6b6c8e53b2830.jpg"
										data-sub-html="#caption_3838108" data-no="5"></div>
								</a>
								<div class="text_wrap _text_wrap " id="gal_item_"
									data-src="https://cdn.imweb.me/thumbnail/20200521/6b6c8e53b2830.jpg"
									data-sub-html="#caption_3838108" style="display: table;">
									<a class="item_container _item_container _fade_link "
										href="etc.jsp" style="display: block">
										<p class="title"></p>
										<br />
										<h6 style="margin: 0; line-height: 1.6; font-weight: 600;">ETC</h6>
										<h5 style="margin: 0; line-height: 1.6;">
											<strong>그 외의 것들.</strong>
										</h5>
										<p class="hidden-xs hidden-sm">
											<br> <br>
										</p> <span class="body"></span>
									</a>
									<h6 class="m_picker_btn_go picker_btn_go">
										<a class="item_container _item_container _fade_link "
											href="etc.jsp" style="display: block"><span></span></a><a
											href="etc.jsp">go →</a>
									</h6>
									<p></p>
								</div>
								<div class="slide_overlay"></div>
							</div>
						</div>

						<div class="dummy_col item_gallary _item _dummy_item"></div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	<script>

		var slideWrapper = document.getElementById('slider-wrap');

		var slideIndex = 0;

		var slides = document.querySelectorAll('#slider-wrap ul li');

		var totalSlides = slides.length;

		var sliderWidth = slideWrapper.clientWidth;

		slides.forEach(function(element) {
			element.style.width = sliderWidth + 'px';
		})
		var slider = document.querySelector('#slider-wrap ul#slider');
		slider.style.width = sliderWidth * totalSlides + 'px';

		var nextBtn = document.getElementById('next');
		var prevBtn = document.getElementById('previous');
		nextBtn.addEventListener('click', function() {
			plusSlides(1);
		});
		prevBtn.addEventListener('click', function() {
			plusSlides(-1);
		});

		slideWrapper.addEventListener('mouseover', function() {
			this.classList.add('active');
			clearInterval(autoSlider);
		});
		slideWrapper.addEventListener('mouseleave', function() {
			this.classList.remove('active');
			autoSlider = setInterval(function() {
				plusSlides(1);
			}, 3000);
		});

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlides(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			slideIndex = n;
			if (slideIndex == -1) {
				slideIndex = totalSlides - 1;
			} else if (slideIndex === totalSlides) {
				slideIndex = 0;
			}

			slider.style.left = -(sliderWidth * slideIndex) + 'px';
			pagination();
		}

		slides.forEach(function() {
			var li = document.createElement('li');
			document.querySelector('#slider-pagination-wrap ul')
					.appendChild(li);
		})

		function pagination() {
			var dots = document
					.querySelectorAll('#slider-pagination-wrap ul li');
			dots.forEach(function(element) {
				element.classList.remove('active');
			});
			dots[slideIndex].classList.add('active');
		}

		pagination();
		var autoSlider = setInterval(function() {
			plusSlides(1);
		}, 3000);
	</script>

</body>
</html>