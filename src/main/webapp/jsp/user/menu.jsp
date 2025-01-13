<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 12.
  Time: 오후 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box; /* 레이아웃 계산을 더 직관적으로 */

        }

        #title1{
            display: flex;
            text-align: center;
            height: 100px;
            width: 100%;
            justify-content: center;
            align-items: center;

            position: relative;
        }
        #menu{
            display: flex;
        }

        #title1 strong{

            background: url("../../img/gigabox.png");
            width: 140px;
            height: 47px;
            text-indent: -9999px;

        }
        #menu a{
            padding: 20px 40px 0 40px ;
            color: black;
            font-weight: bold;
            font-size:15px;
        }
        #login{
            display: flex;
        }
        #login a{
            color: gray;
            font-size: 12px;
            padding: 0 3px 40px 3px ;

        }
        #member{
                 display: flex;
             }
        #member a{
            color: gray;
            font-size: 12px;
            padding: 0 3px 40px 3px ;

        }
        #header{
            background-color: lightgray;
            color: dimgray;
            font-size: 12px;
            margin: 0;
            height: 20px;
            padding-top: 0;
            padding-bottom: 20px;
        }
        hr{
            padding-bottom: 0;
            margin: 0;

        }
        .txt_c{text-align: center}
        a:link{text-decoration:none; color:navy}
        a:visited{text-decoration:none; color:navy}
        a:hover{text-decoration:none; color:red}
    </style>
</head>

<body>

<div id="title1" class="txt_c">
    <div id="member">
        <a href="">맴버십</a>
        <a href="">고객센터</a>
    </div>

    <div id="menu">
        <a href="">영화</a>
        <a href="">예매</a>
        <a href="">극장</a>
        <strong>로고이미지</strong>
        <a href="">이벤트</a>
        <a href="">스토어</a>
        <a href="">혜택</a>
    </div>

    <div id="login">
        <a href="">로그인</a>
        <a href="">회원가입</a>
    </div>
</div>


<hr width="4000px" border="1" noshade color="black">
<div id="header" class="txt_c">
    <p>
       <%--여기부터 손대기--%>
    </p>
</div>

</body>
</html>

