<%-- 
    Document   : single
    Created on : Oct 9, 2019, 8:56:27 PM
    Author     : Nguyen Minh Dang
--%>

<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    session.setAttribute("view", "/productDetail");
    Product pr = (Product) session.getAttribute("prods");
%>
    <div class="banner-top">
        <div class="container">
            <h1>${prods.getName()}</h1>
            <em></em>
            <h2><a href="index.jsp">Home</a><label>/</label>${prods.getName()}</h2>
        </div>
    </div>
    <div class="single">

        <div class="container">
            <div class="col-md-9">
                <div class="col-md-5 grid">
                    <div class="flexslider">
                        <ul class="slides">
                            <li data-thumb="${initParam.imgProductPath}${prods.getThumbImage()}">
                                <div class="thumb-image"> <img src="${initParam.imgProductPath}${prods.getThumbImage()}" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <li data-thumb="${initParam.imgProductPath}${prods.getProductDetail().getImage1()}">
                                <div class="thumb-image"> <img src="${initParam.imgProductPath}${prods.getProductDetail().getImage1()}" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <li data-thumb="${initParam.imgProductPath}${prods.getProductDetail().getImage2()}">
                                <div class="thumb-image"> <img src="${initParam.imgProductPath}${prods.getProductDetail().getImage2()}" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-7 single-top-in">
                    <div class="span_2_of_a1 simpleCart_shelfItem">
                        <h3>${prods.getName()}</h3>
                        <p class="in-para">${prods.getProductDetail().getInfo()}</p>
                        <div class="price_single">
                            <span class="reducedfrom item_price">$${prods.getPrice()}</span>
                            <a href="#">click for offer</a>
                            <div class="clearfix"></div>
                        </div>
                        <h4 class="quick">Description</h4>
                        <p class="quick_desc"> ${prods.getProductDetail().getDescription()}</p>
                        <div class="wish-list">
                            <ul>
                                <li class="wish"><a href="#"><span class="glyphicon glyphicon-check" aria-hidden="true"></span>Add to Wishlist</a></li>
                                <li class="compare"><a href="#"><span class="glyphicon glyphicon-resize-horizontal" aria-hidden="true"></span>Add to Compare</a></li>
                            </ul>
                        </div>
                        <div class="quantity">
                            <div class="quantity-select">
                                <div class="entry value-minus">&nbsp;</div>
                                <div class="entry value"><span>1</span></div>
                                <div class="entry value-plus active">&nbsp;</div>
                            </div>
                        </div>
                        <!--quantity-->
                        <script>
                            $('.value-plus').on('click', function() {
                                var divUpd = $(this).parent().find('.value'),
                                    newVal = parseInt(divUpd.text(), 10) + 1;
                                divUpd.text(newVal);
                            });

                            $('.value-minus').on('click', function() {
                                var divUpd = $(this).parent().find('.value'),
                                    newVal = parseInt(divUpd.text(), 10) - 1;
                                if (newVal >= 1) divUpd.text(newVal);
                            });
                        </script>
                        <!--quantity-->

                        <a href="#" class="add-to item_add hvr-skew-backward">Add to cart</a>
                        <div class="clearfix"> </div>
                    </div>

                </div>
                <div class="clearfix"> </div>
                <!---->
                <div class="tab-head">
                    <nav class="nav-sidebar">
                        <ul class="nav tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab">Product Description</a></li>
                            <li class=""><a href="#tab2" data-toggle="tab">Additional Information</a></li>
                            <li class=""><a href="#tab3" data-toggle="tab">Reviews</a></li>
                        </ul>
                    </nav>
                    <div class="tab-content one">
                        <div class="tab-pane active text-style" id="tab1">
                            <div class="facts">
                                <p> There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined </p>
                                <ul>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Research</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Design and Development</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Porting and Optimization</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>System integration</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Verification, Validation and Testing</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Maintenance and Support</li>
                                </ul>
                            </div>

                        </div>
                        <div class="tab-pane text-style" id="tab2">

                            <div class="facts">
                                <p> Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections </p>
                                <ul>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Multimedia Systems</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Digital media adapters</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Set top boxes for HDTV and IPTV Player </li>
                                </ul>
                            </div>

                        </div>
                        <div class="tab-pane text-style" id="tab3">

                            <div class="facts">
                                <p> There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined </p>
                                <ul>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Research</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Design and Development</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Porting and Optimization</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>System integration</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Verification, Validation and Testing</li>
                                    <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Maintenance and Support</li>
                                </ul>
                            </div>

                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <!---->
            </div>
            <!----->
            <div class="clearfix"> </div>
        </div>

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
    </div>

    <script src="js/imagezoom.js"></script>
    <script defer src="js/jquery.flexslider.js"></script>
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
    <script>
        // Can also be used with $(document).ready()
        $(window).load(function() {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>
    <script src="js/simpleCart.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
