<%-- 
    Document   : login
    Created on : Oct 9, 2019, 8:55:44 PM
    Author     : Nguyen Minh Dang
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <div class="banner-top">
        <div class="container">
            <h1>Login</h1>
            <em></em>
            <h2><a href="index.jsp">Home</a><label>/</label>Login</h2>
        </div>
    </div>
    <!--login-->
    <div class="container">
        <div class="login">

            <form action="LoginServlet" method="post">
                <div class="col-md-6 login-do">
                    <div class="login-mail">
                        <input name="email" id="email" type="text" placeholder="Email" required="">
                        <i class="glyphicon glyphicon-envelope"></i>
                    </div>
                    <div class="login-mail">
                        <input name="password" id="password" type="password" placeholder="Password" required="">
                        <i class="glyphicon glyphicon-lock"></i>
                    </div>
                    <a class="news-letter " href="#">
                        <label class="checkbox1">
                            <input type="checkbox" name="checkbox"><i> </i>Forget Password</label>
                    </a>
                    <label class="hvr-skew-backward">
                        <input type="submit" value="login">
                    </label>
                </div>
                <div class="col-md-6 login-right">
                    <h3>Completely Free Account</h3>

                    <p>Pellentesque neque leo, dictum sit amet accumsan non, dignissim ac mauris. Mauris rhoncus, lectus tincidunt tempus aliquam, odio libero tincidunt metus, sed euismod elit enim ut mi. Nulla porttitor et dolor sed condimentum. Praesent porttitor lorem dui, in pulvinar enim rhoncus vitae. Curabitur tincidunt, turpis ac lobortis hendrerit, ex elit vestibulum est, at faucibus erat ligula non neque.</p>
                    <a href="register.jsp" class=" hvr-skew-backward">Register</a>

                </div>

                <div class="clearfix"> </div>
            </form>
        </div>

    </div>

    <!--//login-->

    <!--brand-->
    <div class="container">
        <div class="brand">
            <div class="col-md-3 brand-grid">
                <img src="images/ic.png" class="img-responsive" alt="">
            </div>
            <div class="col-md-3 brand-grid">
                <img src="images/ic1.png" class="img-responsive" alt="">
            </div>
            <div class="col-md-3 brand-grid">
                <img src="images/ic2.png" class="img-responsive" alt="">
            </div>
            <div class="col-md-3 brand-grid">
                <img src="images/ic3.png" class="img-responsive" alt="">
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <script src="js/simpleCart.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>
