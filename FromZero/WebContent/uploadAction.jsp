<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*" %>
<%@page import="java.util.Properties"%>
<%@page import="model.DBUtil"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>From zero</title>
</head>
<body style="overflow-x: hidden">
<script>
	alert("제품을 등록하였습니다.")
	location.href="update_stock.jsp"; 
</script>
<%@ include file="./fz_header.jsp" %>
	<%
	//DB연결하기
	request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
	response.setCharacterEncoding("UTF-8");
	
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

	//파일 경로 설정하기
	String store_id = (String) session.getAttribute("store_id");
	String directory=this.getClass().getResource("").getPath();
	directory=directory.substring(1,directory.indexOf(".metadata"))+"FromZero/WebContent/offline_store_img/Store"+store_id;

	//업로드 파일 형식 설정
	int maxSize = 1024 * 1024 * 100;
	String encoding = "UTF-8";

	//파일 넣기
	
	MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
			new DefaultFileRenamePolicy());
	
	//새로운 상품(파일=이미지, 이름, 가격, 수량)
	//이전 jsp에서 <form enctype="multipart/form-data">으로 데이터를 받았기때문에
	// request->multiparReqeust로 바꾸어야한다.
	String fileName = multipartRequest.getOriginalFileName("file");
	String name = multipartRequest.getParameter("name");
	int price = Integer.parseInt(multipartRequest.getParameter("price"));
	int num = Integer.parseInt(multipartRequest.getParameter("num"));
	
	
	try {
		conn = DriverManager.getConnection(DBUrl, connectionProps);
		String sqlSt = null;
		sqlSt = "SELECT LAST_VALUE(offlineproduct_id) OVER (ORDER BY offlineproduct_id DESC) FROM fz_webapp.offline_product WHERE storeid="
		+ store_id + " limit 1"; // store 마지막 요소 반환
		pstmt = conn.prepareStatement(sqlSt);
		rset = pstmt.executeQuery();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	int product_id=0;
	while(rset.next()){
	product_id = rset.getInt("LAST_VALUE(offlineproduct_id) OVER (ORDER BY offlineproduct_id DESC)") + 1; 
	}
	
	//storeid가 string으로 DB에 들어가려면 int형이어야한다.
	int storeid=product_id/100;
	try {
		DBUtil.insertOfflineStock(conn, product_id, storeid, name, price, num, fileName);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	%>
</body>
</html>