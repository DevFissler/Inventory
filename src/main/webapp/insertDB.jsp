 <!--에러나면 이 페이지 띄워라-->
 <!DOCTYPE html>
 <html lang="en">
 <%@ page contentType="text/html; charset=utf-8" %>
 <%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
 <%@ page import="java.text.SimpleDateFormat"%>
 <%@ page import="java.util.Date,java.util.Enumeration,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,com.oreilly.servlet.MultipartRequest" %> 
  <%@ page errorPage="inError.jsp" %>
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
        
        Class.forName("com.mysql.jdbc.Driver");
      //JDBC 연결하기
      	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23","root","koposw23");
      //mysql,DB접속하기
      	Date nowTime = new Date();

      	Statement stmt = conn.createStatement(); //정보 입력용
      	Statement stmt2 = conn.createStatement();//중복 체크용

      // 이미지 등록
      	String path = request.getRealPath("./images");
      	int size = 1024 * 1024 * 5; // 5MB
      	String str, filename, original_filename;

      	String imageAdd = "";
      	MultipartRequest multiRequest = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
      	String regNum = multiRequest.getParameter("regNum");
      	String sName = multiRequest.getParameter("gName");
      	String quan = multiRequest.getParameter("quan");
      	String sInfo = multiRequest.getParameter("info");
      	String itemPhoto = multiRequest.getParameter("pic");
      	
      	Enumeration files = multiRequest.getFileNames();
      	str = (String)files.nextElement();
      	filename = multiRequest.getFilesystemName(str);
      	original_filename = multiRequest.getOriginalFileName(str);
      	imageAdd = "images/" + filename;

        String reg_date=format.format(now);

        String chk_date=format.format(now);
      
   	    String id = "";
    	String subject = "";
    	String fileName1 = "";
    	String fileName2 = "";
    	String orgfileName1 = "";

        String QueryTxt2="";
        QueryTxt2=String.format("insert into stockTable values ("+regNum+",'"+sName+"',"+quan+",'"+reg_date+"','"+chk_date+"','"+sInfo+"','"+imageAdd+"');");
        stmt.execute(QueryTxt2); //테이블 생성
 		      
        stmt.close();
        conn.close();
       %> <!--jsp문 종료-->
       <script>
            alert("<%= sName %> 상품 등록 완료 되었습니다!");
            window.location="allview.jsp?page=1"; 
    </script>
 </body>
 </html>