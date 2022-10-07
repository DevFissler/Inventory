<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.*,javax.sql.*,java.io.*,java.net.*,org. w3c.dom.*,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.ParserConfigurationException" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script language="javascript">
        function inputCheck(){
            var myform = document.mod;
            var quanCheck = document.getElementById('quan').value;
            var num = document.getElementById('num').value;
            
            if((quanCheck.length !=0)&&(quanCheck.indexOf('.')== -1)){
                myform.action = "updateDB.jsp?id="+num;
                myform.submit();
            } else if ((quanCheck.length ==0)) {
                alert("입력값은 공백 일 수 없습니다");
            }
        }

        function del(){
            var myform = document.mod;
            var num = document.getElementById('num').value;
            
            myform.action = "deleteDB.jsp?id="+num;
            myform.submit();
        }
    </script>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>상품 재고량 수정</title>
</head>
<body>
  <%
  String a = request.getParameter("id");     

  Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버
  Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23","root","koposw23"); //커넥션
  Statement stmt = conn.createStatement(); //스테이트먼트

  ResultSet rset = stmt.executeQuery("select * from stockTable where id="+a+";");

  Date now=new Date(); 
  SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

  int regNum=0;
  String name ="";
  int quan=0;
  String reg_date ="";
  String chk_date ="";
  String info ="";
  String photo ="";

  String nowDate = format.format(now);

  while (rset.next()){
    regNum=rset.getInt(1);
    name=rset.getString(2);
    quan=rset.getInt(3);
    reg_date=rset.getString(4);
    chk_date=rset.getString(5);
    info=rset.getString(6);
    photo=rset.getString(7);
  }

  %>
    <jsp:include page="menu.jsp"></jsp:include>
    <form method="post" name="mod"><!--폼 하나 생성-->  
      <table class="table table-bordered">
        <thead>
          <tr>
            <th colspan="2"><center><b>(주)재형상사 재고현황 - 상품 정보 확인</b></center></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row" width="200px">상품 등록 번호</th>
            <td><input type="number" value="<%=regNum %>" readonly id="num" name="num"></td>
          </tr>
          <tr>
            <th scope="row">상품 명</th>
            <td><textarea name="name" id="name" style="width: 100%; height:30px" maxlength="60" readonly><%=name %></textarea></td>
          </tr>
          <tr>
            <th scope="row">재고 수</th>
            <td><input type="number" value="<%=quan %>" min=1 name="quan" id="quan"></td>
          </tr>
          <tr>
            <th scope="row">상품 등록 일자</th>
            <td><input type="text" value="<%=reg_date %>" readonly></td>
          </tr>
          <tr>
            <th scope="row">재고 확인 일자</th>
            <td><input type="text" value="<%=nowDate %>" readonly></td>
          </tr>
          <tr>
            <th scope="row">상품 설명</th>
            <td><input type="text" value="<%=info %>" readonly></td>
          </tr>
          <tr>
            <th scope="row">상품 사진</th>
            <td height="650px"><img src="<%=photo%>"></td>
          </tr>
        </tbody>
      </table>
      </form>
      <table>
        <tr>
            <td width="1770px"></td>
            <td><input type="button" value="취소" onClick="location.href='allview.jsp?page=1'" style="margin-right: 20px;"></td>
            <td><input type="button" value="삭제" onClick="del()" style="margin-right: 20px;"></td>
            <td><input type="button" value="쓰기" onclick="inputCheck()" style="margin-right: 10px;"></td>
        </tr>
    </table>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>