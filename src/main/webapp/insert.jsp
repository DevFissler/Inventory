<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.*,javax.sql.*,java.io.*,java.net.*,org. w3c.dom.*,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.ParserConfigurationException" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script language="javascript">
        function inputCheck(){
            var myform = document.add;
            var nameCheck = document.getElementById('gName').value;
            var conCheck= document.getElementById('info').value;
            var numCheck= document.getElementById('regNum').value;
            var quanCheck= document.getElementById('quan').value;

            if( (nameCheck.indexOf('/')== -1) && (conCheck.indexOf('/')== -1) && (nameCheck.indexOf('>')== -1) && (conCheck.indexOf('>')== -1) &&
                (nameCheck.indexOf('<')== -1) && (conCheck.indexOf('<')== -1)  && (numCheck.indexOf('.')== -1) && (quanCheck.indexOf('.')== -1) &&
                (nameCheck.length !=0) && (conCheck.length !=0) && (numCheck.length !=0) && (quanCheck.length !=0) &&(numCheck >0) && (quanCheck >0)){   
            	
            	myform.action = "insertDB.jsp";
            	
                myform.submit();
            } else if (!((nameCheck.indexOf('/')== -1) && (conCheck.indexOf('/')== -1) && (nameCheck.indexOf('>')== -1) && (conCheck.indexOf('>')== -1)  &&
                (nameCheck.indexOf('<')== -1) && (conCheck.indexOf('<')== -1))) {
                alert(`입력값이 잘못되었습니다 (상품명, 상품정보에  < , > , / 사용이 제한되어 있습니다!)`);
            } else if ((nameCheck.length ==0) || (conCheck.length ==0) || (numCheck.length ==0) || (quanCheck.length ==0)) {
                alert("입력값은 공백 일 수 없습니다");
            } else if (!(numCheck.indexOf('.')== -1) || !(quanCheck.indexOf('.')== -1)){
                alert(`입력값이 잘못되었습니다 (번호, 수량에 . 사용이 제한되어 있습니다)`);
            } else if (!(numCheck >0) || !(quanCheck >0)){
            	alert("등록번호나 수량은 음수 일 수 없습니다!")
            }
        }
    </script>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>신규 상품 등록</title>
</head>
<body>
    <%

    Date now=new Date(); 
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    
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
    <jsp:include page="menu.jsp"></jsp:include>
    <!--폼 하나 생성-->  
     <form method="post" name="add" enctype="multipart/form-data">
    <table class="table table-bordered">
        <thead>
          <tr>
            <th colspan="2"><center><b>(주)재형상사 재고현황 - 재고 등록</b></center></th>
          </tr>
        </thead>
        <tbody>   
          <tr>
            <th scope="row" width="200px">상품 등록 번호</th>
            <td><input type="number" name="regNum" value="<%=regId %>" id="regNum" min='0' max='999999'></td>
          </tr>
          <tr>
            <th scope="row">상품 명</th>
            <td><textarea name="gName" id="gName" style="width: 100%; height:30px" maxlength="60"></textarea></td>
          </tr>
          <tr>
            <th scope="row">재고 수</th>
            <td><input type="number" value="" name="quan" id="quan" min=1></td>
          </tr>
          <tr>
            <th scope="row">상품 등록 일자</th>
            <td><input type="text" value="<%=format.format(now) %>" name="reg_date" id="reg_date" readonly></td>
          </tr>
          <tr>
            <th scope="row">재고 확인 일자</th>
            <td><input type="text" value="<%=format.format(now) %>" name="chk_date" id="chk_date" readonly></td>
          </tr>
          <tr>
            <th scope="row">상품 설명</th>
            <td><textarea name="info" id="info" style="width: 100%; height:30px" maxlength="60"></textarea></td>
          </tr>
          <tr>
            <th scope="row">상품 사진</th>
            <td height="650px"><input type="file" id="pic" name="pic" accept="image/*"></td>
          </tr>
          
        </tbody>
       
      </table>
      </form>
      <table>
        <tr>
            <td width="1790px"></td>
            <td><input type="button" value="취소" onClick="location.href='allview.jsp?page=1'" style="margin-right: 20px;"></td>
            <td><input type="button" value="쓰기" onclick="inputCheck()" style="margin-right: 10px;"></td>
        </tr>
    </table>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>