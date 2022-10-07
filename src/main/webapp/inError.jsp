<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<%@ page isErrorPage="true" %> <!--에러페이지는 나다! 라는것을 true로 인증-->
<html>
   <head>
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
    <%
        Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23","root","koposw23"); //커넥션
        Statement stmt = conn.createStatement(); //스테이트먼트
         
        int regId=1;
        String QueryTxt1 ="select id from stockTable;";
        ResultSet rset = stmt.executeQuery(QueryTxt1);
         
        while (rset.next()) {
            if(regId != rset.getInt(1)){
                break;
            }
            regId++;
        }
    %>
    
    <div id="containers">
        <center>
        <div style="margin-top: 100px;">데이터 입력 에러<br>등록번호가 중복되었습니다<br></div>
        <div>사용 가능한 등록번호는 <%=regId %> 입니다<br></div>
        <div><input type="button" value="재고리스트로" onClick="location.href='allview.jsp?page=1'" style="margin-top: 50px;"></center></div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    
   </body>
</html>