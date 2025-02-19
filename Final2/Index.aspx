﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Final2.Index" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Mr. Corte Barbershop</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="template/image/x-icon" href="img/favicon.png"/>
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="template/css/bootstrap.min.css">
    <link rel="stylesheet" href="template/css/owl.carousel.min.css">
    <link rel="stylesheet" href="template/css/magnific-popup.css">
    <link rel="stylesheet" href="template/css/font-awesome.min.css">
    <link rel="stylesheet" href="template/css/themify-icons.css">
    <link rel="stylesheet" href="template/css/nice-select.css">
    <link rel="stylesheet" href="template/css/flaticon.css">
    <link rel="stylesheet" href="template/css/gijgo.css">
    <link rel="stylesheet" href="template/css/animate.css">
    <link rel="stylesheet" href="template/css/slicknav.css">
    <link rel="stylesheet" href="template/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
    <form id="form1" runat="server">
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
    <!-- header-start -->
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid p-0">
                    <div class="row align-items-center no-gutters">
                        <div class="col-xl-3 col-lg-3">
                            <div class="logo-img">
                                <a href="index.html">
                                    <img src="template/img/mr corte logo text.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a class="active" href="Index.aspx">Home</a></li>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                            <div class="book_room">
                                <div class="book_btn d-none d-lg-block">
                                    <a href="CusLog.aspx">Login</a>
                                    <a href="CusSign.aspx">Sign Up</a>

                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->
    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="single_slider d-flex align-items-center justify-content-center slider_bg_1 overlay2">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="slider_text text-center">
                            <img src="img/banner/barber_text.png" alt="">
                            <h3>Mr. Corte</h3>
                            <p>Professional Care</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider_area_end -->
    <!-- about_area_start -->
    <div class="about_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-6 col-lg-6">
                    <div class="about_thumb">
                        <img src="template/img/about/about_lft.png" alt="">
                        <div class="opening_hour text-center">
                            <i class="flaticon-clock"></i>
                            <h3>Opening Hour</h3>
                            <p>
                                Sun - Mon &nbsp; 12pm - 6pm <br>
                                Tue-Wed &nbsp; 10:30am - 7pm<br>
                                Thur-Fri &nbsp; 10:30am - 8:30pm<br>
                                Sat &nbsp; 10:30am - 7pm<br>

                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="about_info">
                        <div class="section_title mb-20px">
                            <span>About Us</span>
                            <h3>
                                Experienced and <br>
                                Stylish <br>
                                Barber Shop
                            </h3>
                        </div>
                        <p>
                            We take the utmost care to provide customers with fresh and modern looks.
                            Situated near Monk Metro, we are open daily and serve customers of all ages.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about_area_end -->
    <div class="service_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title2 text-center mb-90">
                        <i class="flaticon-scissors"></i>
                        <h3>our services</h3>
                    </div>
                </div>
            </div>
            <div class="white_bg_pos">
                <div class="row">
                    <div class="col-xl-6">
                        <div class="single_service d-flex justify-content-between align-items-center">
                            <div class="service_inner d-flex align-items-center">
                                <div class="thumb">
                                    <img src="template/img/service/1.png" alt="">
                                </div>
                                <span>Cut</span>
                            </div>
                            <p>………………………..$18</p>
                        </div>
                        <div class="single_service d-flex justify-content-between align-items-center">
                            <div class="service_inner d-flex align-items-center">
                                <div class="thumb">
                                    <img src="template/img/service/2.png" alt="">
                                </div>
                                <span>Cut & Beard</span>
                            </div>
                            <p>………………………..$20</p>
                        </div>


                    </div>
                    <div class="col-xl-6">
                        <div class="single_service d-flex justify-content-between align-items-center">
                            <div class="service_inner d-flex align-items-center">
                                <div class="thumb">
                                    <img src="template/img/service/6.png" alt="">
                                </div>
                                <span>Kids 10 & Under</span>
                            </div>
                            <p>………………………..$14</p>
                        </div>
                        <div class="single_service d-flex justify-content-between align-items-center">
                            <div class="service_inner d-flex align-items-center">
                                <div class="thumb">
                                    <img src="template/img/service/7.png" alt="">
                                </div>
                                <span>Beard</span>
                            </div>
                            <p>………………………..$12</p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- gallery_area_start -->
    <div class="gallery_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title2 text-center mb-90">
                        <i class="flaticon-scissors"></i>
                        <h3>Gallery</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="gallery_active owl-carousel">
                        <div class="single_gallery">
                            <div class="thumb">
                                <img src="template/img/gallery/34452532_1811336118889346_45665853227663360_n.jpg" alt="">
                                <div class="image_hover">
                                    <a class="popup-image" href="template/img/gallery/34452532_1811336118889346_45665853227663360_n.jpg">
                                        <i class="ti-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="single_gallery">
                            <div class="thumb">
                                <img src="template/img/gallery/35519896_1828341083855516_6544294247904837632_o.jpg" alt="">
                                <div class="image_hover">
                                    <a class="popup-image" href="template/img/gallery/35519896_1828341083855516_6544294247904837632_o.jpg">
                                        <i class="ti-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="single_gallery">
                            <div class="thumb">
                                <img src="template/img/gallery/37880736_1891318227557801_6244619832608686080_o.jpg" alt="">
                                <div class="image_hover">
                                    <a class="popup-image" href="template/img/gallery/37880736_1891318227557801_6244619832608686080_o.jpg">
                                        <i class="ti-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="single_gallery">
                            <div class="thumb">
                                <img src="template/img/gallery/89561318_2943696548986625_4157846603899600896_o.jpg" alt="">
                                <div class="image_hover">
                                    <a class="popup-image" href="template/img/gallery/89561318_2943696548986625_4157846603899600896_o.jpg">
                                        <i class="ti-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="single_gallery">
                            <div class="thumb">
                                <img src="template/img/gallery/89920257_2943845418971738_1400329964661768192_o.jpg" alt="">
                                <div class="image_hover">
                                    <a class="popup-image" href="template/img/gallery/89920257_2943845418971738_1400329964661768192_o.jpg">
                                        <i class="ti-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- gallery_area_end -->
    <!-- cutter_muster_start -->
    <div class="cutter_muster">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title2 text-center mb-90">
                        <i class="flaticon-scissors"></i>
                        <h3>Our Barbers</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="single_master">
                        <div class="thumb">
                            <img src="template/img/team/1.png" alt="">
                            <div class="social_link">
                                <a href="#"><i class="fa fa-envelope"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                        <div class="master_name text-center">
                            <h3>Johnny</h3>
                            <p>Barber</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="single_master">
                        <div class="thumb">
                            <img src="template/img/team/2.png" alt="">
                            <div class="social_link">
                                <a href="#"><i class="fa fa-envelope"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                        <div class="master_name text-center">
                            <h3>Lucas</h3>
                            <p>Barber</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="single_master">
                        <div class="thumb">
                            <img src="template/img/team/3.png" alt="">
                            <div class="social_link">
                                <a href="#"><i class="fa fa-envelope"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                        <div class="master_name text-center">
                            <h3>Mark</h3>
                            <p>Barber</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="single_master">
                        <div class="thumb">
                            <img src="template/img/team/4.png" alt="">
                            <div class="social_link">
                                <a href="#"><i class="fa fa-envelope"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                        <div class="master_name text-center">
                            <h3>Esther</h3>
                            <p>Barber</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- cutter_muster_end -->
    <!-- find_us_area start -->
    <div class="find_us_area find_bg_1 ">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 offset-xl-7 col-lg-6 offset-lg-6">
                    <div class="find_info">
                        <h3 class="find_info_title">How to Find Us</h3>
                        <div class="single_find d-flex">
                            <div class="icon">
                                <i class="flaticon-placeholder"></i>
                            </div>
                            <div class="find_text">
                                <h3>Location</h3>
                                <p>2642 Rue Allard, Montréal, QC H4E 2L6</p>
                            </div>
                        </div>
                        <div class="single_find d-flex">
                            <div class="icon">
                                <i class="flaticon-phone-call"></i>
                            </div>
                            <div class="find_text">
                                <h3>Call Us</h3>
                                <p>(514) 746-1092</p>
                            </div>
                        </div>
                        <div class="single_find d-flex">
                            <div class="icon">
                                <i class="flaticon-paper-plane"></i>
                            </div>
                            <div class="find_text">
                                <h3>Message Us</h3>
                                <p><a href="http://www.m.me/Mr.corte"><font color="white">Facebook Messenger</font></a></p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- find_us_area_end -->
    <!-- footer -->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Join Us
                            </h3>
                            <p class="footer_text doanar">
                                <a class="first" href="#">Book Appointment</a> <br>
                                <a href="#">(514) 746-1092</a>
                            </p>

                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                address
                            </h3>
                            <p class="footer_text">
                                2642 Rue Allard, Montréal, QC H4E 2L6 <br>
                                (514) 746-1092 <br>
                                <a class="domain" href="#">Social Media:</a>
                                <div class="socail_links">
                                    <ul>
                                        <li>
                                            <a href="https://www.facebook.com/Mr.corte/">
                                                <i class="fa fa-facebook-square"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://www.instagram.com/mrcortemtl/">
                                                <i class="fa fa-instagram"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </p>

                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-lg-2">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Navigation
                            </h3>
                            <ul>
                                <li><a href="Index.aspx">Home</a></li>
                                <li><a href="CusLog.aspx">Customer Login</a></li>
                                <li><a href="CusSign.aspx">Customer Sign Up</a></li>
                                <li><a href="BarLog.aspx">Barber Login</a></li>
                                <li><a href="BarSign.aspx">Barber Sign Up</a></li>


                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;
                            <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer -->
    <!-- link that opens popup -->
    
    <%--<!-- Login-->
    <form id="test-form" class="white-popup-block mfp-hide">
        <div class="popup_box ">
            <div class="popup_inner">
                <h3>Login</h3>
                    <div class="row">
                        
                        <div class="col-xl-6 col-md-6">
                            <input type="text" placeholder="Username">
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <input type="text" placeholder="Password">
                        </div>
                            <button type="submit" class="boxed-btn3">Submit</button>
                        </div>
                        <div class="container signin">
                            <p>Don't have an account? <a href="#test-form2">Sign up</a>.</p>
                        </div>
                    </div>
             </div>
    </form>


    <!-- form itself end -->
    
    <!-- Sign Up-->
    <form id="test-form2" class="white-popup-block mfp-hide">
        <div class="popup_box ">
            <div class="popup_inner">
                <h3>Sign Up</h3>
                    <div class="row">
                        <div class="col-xl-6 col-md-6">
                            <input type="text" placeholder="First Name">
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <input type="text" placeholder="Last Name">
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <input type="tel" placeholder="Phone Number">
                        </div>
                        <div class="col-xl-12">
                            <input type="email" placeholder="Your email">
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <input type="text" placeholder="Username">
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <input type="password" placeholder="Password">
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <input type="password" placeholder="Confirm Password">
                        </div>
                        <div class="col-xl-12">
                            <button type="submit" class="boxed-btn3">Submit</button>
                        </div>
                        <div class="container signin">
                            <p>Already have an account? <a href="#test-form">Sign In</a>.</p>
                        </div>
                    </div>
                
            </div>
        </div>
    </form>--%>
    <!-- form itself end -->
    <!-- JS here -->
    <script src="template/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="template/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="template/js/popper.min.js"></script>
    <script src="template/js/bootstrap.min.js"></script>
    <script src="template/js/owl.carousel.min.js"></script>
    <script src="template/js/isotope.pkgd.min.js"></script>
    <script src="template/js/ajax-form.js"></script>
    <script src="template/js/waypoints.min.js"></script>
    <script src="template/js/jquery.counterup.min.js"></script>
    <script src="template/js/imagesloaded.pkgd.min.js"></script>
    <script src="template/js/scrollIt.js"></script>
    <script src="template/js/jquery.scrollUp.min.js"></script>
    <script src="template/js/wow.min.js"></script>
    <script src="template/js/nice-select.min.js"></script>
    <script src="template/js/jquery.slicknav.min.js"></script>
    <script src="template/js/jquery.magnific-popup.min.js"></script>
    <script src="template/js/plugins.js"></script>
    <script src="template/js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="template/js/contact.js"></script>
    <script src="template/js/jquery.ajaxchimp.min.js"></script>
    <script src="template/js/jquery.form.js"></script>
    <script src="template/js/jquery.validate.min.js"></script>
    <script src="template/js/mail-script.js"></script>

    <script src="template/js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            disableDaysOfWeek: [0, 0],
            //     icons: {
            //      rightIcon: '<span class="fa fa-caret-down"></span>'
            //  }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-caret-down"></span>'
            }

        });
        var timepicker = $('#timepicker').timepicker({
            format: 'HH.MM'
        });
    </script>
        </form>
</body>
    </html>