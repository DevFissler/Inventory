 <!--에러나면 이 페이지 띄워라-->
 <!DOCTYPE html>
 <html lang="en">
 <%@ page contentType="text/html; charset=utf-8" %>
 <%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Document</title>
     <style>
        #containers {
            position:relative;
            display: inline;
            margin-top: 40% ;
            margin-left: 20% ;
        }
     </style>
     <link
     href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <!-- Latest compiled JavaScript -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 
 </head>
 <body>
    <jsp:include page="menu.jsp"></jsp:include>
     <% //JSP문 시작
        
 
        Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23","root","koposw23"); //커넥션
        Statement stmt = conn.createStatement(); //스테이트먼트

        String getId = request.getParameter("num");
        
        String QueryTxt2="";
        QueryTxt2=String.format("delete from stockTable where id="+getId+";");
        stmt.execute(QueryTxt2); //테이블 생성
 
        stmt.close();
        conn.close();
       %> <!--jsp문 종료-->
       
        <div id="containers">
            <div style="margin-top: 100px;"><center>등록번호 : <%=getId %> 번 상품의 정보가 삭제 되었습니다</center><br></div>
            <div><center><input type="button" value="재고리스트로" onClick="location.href='allview.jsp?page=1'" style="margin-top: 50px;"></center></div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
 </body>
 </html>