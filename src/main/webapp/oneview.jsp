<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*,org. w3c.dom.*,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.ParserConfigurationException" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>재고 상세 정보</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<jsp:include page="menu.jsp"></jsp:include>

    <%
    String a = request.getParameter("id");     

    Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버
    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23","root","koposw23"); //커넥션
    Statement stmt = conn.createStatement(); //스테이트먼트

    ResultSet rset = stmt.executeQuery("select * from stockTable where id="+a+";");

    int regNum=0;
    String name ="";
    int quan=0;
    String reg_date ="";
    String chk_date ="";
    String info ="";
    String itemPhoto = "";

    while (rset.next()){
      regNum=rset.getInt(1);
      name=rset.getString(2);
      quan=rset.getInt(3);
      reg_date=rset.getString(4);
      chk_date=rset.getString(5);
      info=rset.getString(6);
      itemPhoto = rset.getString(7);
    }


    %>
    <div class='container-fluid'>
    <table class="table table-bordered">
      <thead>
        <tr>
          <th colspan="2"><center><b>(주)재형상사 재고현황 - 상품 정보 확인</b></center></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row" width="200px">상품 등록 번호</th>
          <td><%=regNum %></td>
        </tr>
        <tr>
          <th scope="row">상품 명</th>
          <td><%=name %></td>
        </tr>
        <tr>
          <th scope="row">재고 수</th>
          <td><%=quan %></td>
        </tr>
        <tr>
          <th scope="row">상품 등록 일자</th>
          <td><%=reg_date %></td>
        </tr>
        <tr>
          <th scope="row">재고 확인 일자</th>
          <td><%=chk_date %></td>
        </tr>
        <tr>
          <th scope="row">상품 설명</th>
          <td><%=info %></td>
        </tr>
        <tr>
          <th scope="row">상품 사진</th>
          <td height="650px"><img src="<%=itemPhoto%>"></td>
        </tr>
      </tbody>
    </table>
    </div>
      <table>
        <tr>
            <td width="1790px"></td>
            <td><input type="button" value="목록" onclick="location.href='allview.jsp?page=1'" style="margin-right: 20px;"></td>
            <td><input type="button" value="수정" onclick="location.href='update.jsp?id=<%=regNum %>'" style="margin-right: 20px;"></td>
        </tr>
    </table>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>