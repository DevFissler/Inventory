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
 </head>
 <body>
     <% //JSP문 시작
        Date now=new Date(); 
        SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
 
        Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23","root","koposw23"); //커넥션
        Statement stmt = conn.createStatement(); //스테이트먼트


        String reg_date=format.format(now);

        String chk_date=format.format(now);
        
        String imageName=" ";
        
        ResultSet rset = stmt.executeQuery("select max(id) from stockTable;");
        int newId = 0;
        while(rset.next()){
        	newId=rset.getInt(1)+1;
        }

        String QueryTxt2="";
        for (int i=newId;i<newId+327;i++){
            QueryTxt2=String.format("insert into stockTable values ("+i+",'"+i+"',"+i+",'"+reg_date+"','"+chk_date+"','"+i+"','"+imageName+"');");
            stmt.execute(QueryTxt2); //테이블 생성
        }
 
        stmt.close();
        conn.close();
       %> <!--jsp문 종료-->
       <script>
            alert("상품 등록 완료 되었습니다!");
            window.location="allview.jsp?page=1";
    </script>
 </body>
 </html>