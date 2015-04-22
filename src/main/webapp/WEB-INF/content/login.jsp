<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"/>

    <title>分拣系统平台DEMO显示</title>

    <link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            background: url(${ctx}/static/dwz/themes/default/images/html-bg-x.jpg) repeat-x center top;
        }

        .form-signin {
            position: absolute;
            left: 50%;
            top: 40%;
            margin-left: -180px;
            margin-top: -160px;
            width: 300px;
            padding: 19px 30px 29px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
        }

        .login-tips-txt {
            position: absolute;
            left: 50%;
            top: 70%;
            margin-left: -400px;
            /*margin-top: -160px;*/
            width: 800px;
            text-align: center;
            color: #fff;
            font-size: 16px;
        }

        .login-tips-txt a,
        .login-tips-txt a:hover {
            color: #000;
        }

        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

        .sub-btn {
            border-radius: 0;
            background: #e8e8e8;
            outline: none;
            border: none;
            box-shadow: none;
            text-shadow: none;
            padding: 11px 19px;
            font-size: 17.5px;
            background: #2fade7;
            color: #fff;
            width: 100%;
        }

        .form-signin-heading {
            text-align: center;
        }

    </style>
    <link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="${ctx}/static/bootstrap/2.3.2/js/html5shiv.js"></script>
    <![endif]-->


    <%--<link href="themes/css/login.css" rel="stylesheet" type="text/css" />--%>
    <script src="${ctx}/static/jquery/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            //聚焦第一个输入框
            $("#j_username").focus();
        });
    </script>
</head>

<body>

<div class="container">
    <form class="form-signin" id="loginForm" name="loginForm" action="${ctx}/j_spring_security_check" method="post">
        <h2 class="form-signin-heading">分拣系统平台登录</h2>

        <p style="text-align: center; color: red;">
            <s:if test="#parameters.error">
                <%
                    Exception e = (Exception) session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
                    if (e != null)
                        out.println(e.getMessage());
                    else
                        out.println("用户名或密码错误");
                %>
            </s:if>
        </p>

        用户名 <input type='text' id='j_username' name='j_username' size="20" class="input-block-level"/>
        密码<input type='password' id='j_password' name='j_password' size="20" class="input-block-level"/>
        <label class="checkbox">
            <input type="checkbox" value="remember-me" name="_spring_security_remember_me"/> 两周内记住我
        </label>
        <button class="sub-btn" type="submit">登录</button>
    </form>

    <p class="login-tips-txt">推荐浏览器：Chrome <a class="download"
                                              href="http://dlsw.baidu.com/sw-search-sp/2014_12_15_22/bind1/14744/rj_tf0429.exe"
                                              target="_blank">点击下载</a> 或IE8以上</p>
</div>

</body>
</html>