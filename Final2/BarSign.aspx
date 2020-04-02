<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarSign.aspx.cs" Inherits="Final2.BarSign" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head runat ="server">
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Barber Sign Up</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png"/>
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
        <link rel="stylesheet" href="template/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="template/css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="template/css/magnific-popup.css"/>
    <link rel="stylesheet" href="template/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="template/css/themify-icons.css"/>
    <link rel="stylesheet" href="template/css/nice-select.css"/>
    <link rel="stylesheet" href="template/css/flaticon.css"/>
    <link rel="stylesheet" href="template/css/gijgo.css"/>
    <link rel="stylesheet" href="template/css/animate.css"/>
    <link rel="stylesheet" href="template/css/slicknav.css"/>
    <link rel="stylesheet" href="template/css/style.css"/>
    <link rel="stylesheet" href="template/css/table.css"/>

    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    <style type="text/css">
        .auto-style1 {
            width: 213px;
        }
        .auto-style2 {
            width: 152%;
        }
    </style>
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
  <form id="form1" runat="server">

    <header>
            <div class="header-area ">
                <div id="sticky-header" class="main-header-area">
                    <div class="container-fluid p-0">
                        <div class="row align-items-center no-gutters">
                                <div class="col-xl-3 col-lg-3">
                                    <div class="logo-img">
                                        <a href="index.html">
                                            <img src="Template/img/mr corte logo text.png" alt="">
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
    <!-- ================ contact section start ================= -->
    <section class="contact-section">
            <div class="col-12">
                <div class="d-none d-sm-block mb-5 pb-4">
                   <h3 align="center">Sign Up</h3>
                   <div style="text-align:center;">
                    <div style="width:50%; margin: 0 auto; text-align:left;">
                    <table class="auto-style2">
            <tr>
                <td class="auto-style1">First Name:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="tb_barbFirstName" runat="server"></asp:TextBox>
                </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_barbFirstName" ErrorMessage="First name is required" CssClass="required" ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Last Name: </td>
                <td class="auto-style5">
                    <asp:TextBox ID="tb_barbLastName" runat="server"></asp:TextBox>
                </td>
                <td>    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_barbLastName" ErrorMessage="Last name is required" CssClass="required" ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Address:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="tb_barbAddress" runat="server"></asp:TextBox>
                
                </td>
                            <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_barbAddress" ErrorMessage="Address is required" CssClass="required" ></asp:RequiredFieldValidator>
                            </td>
                        </tr>
            <tr>
                <td class="auto-style1">Postal Code</td>
                <td class="auto-style3">
                    <asp:TextBox ID="tb_barbPostalCode" runat="server"></asp:TextBox>
                </td>
                    <%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_barbPostalCode" ErrorMessage="Postal Code is required"></asp:RequiredFieldValidator>--%>
                  <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tb_barbPostalCode" ErrorMessage="Please enter a valid postal code" CssClass="required" ValidationExpression="^([A-Za-z]\d[A-Za-z][-]?\d[A-Za-z]\d)"></asp:RegularExpressionValidator>
                </td>

            </tr>
            <tr>
                <td class="auto-style1">SIN </td>
                <td class="auto-style3">
                    <asp:TextBox ID="tb_barbSIN" runat="server"></asp:TextBox>
               </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tb_barbSIN" ErrorMessage="Please enter a valid SIN " CssClass="required" ValidationExpression="^(\d{3}-\d{3}-\d{3})|(\d{9})$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Phone Number: </td>
                <td class="auto-style3">
                    <asp:TextBox ID="tb_barbPhone" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tb_barbPhone" ErrorMessage="Phone number is required" CssClass="required" ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Username</td>
                <td class="auto-style3">
                    <asp:TextBox ID="tb_barbUsername" runat="server"></asp:TextBox>
                </td>
                    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_barbUsername" ErrorMessage="Username is required" CssClass="required" ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Password: </td>
                <td class="auto-style5">
                    <asp:TextBox ID="tb_barbPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                            <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tb_barbPassword" ErrorMessage="Password must be between 8-15 characters, with at least one upper case and one lower case letter, and one number" CssClass="required" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$"></asp:RegularExpressionValidator>

                            </td>
                        </tr>
            <tr>
                <td class="auto-style1">Confirm Password</td>
                <td class="auto-style3">
                    <asp:TextBox ID="tb_barbConfirmPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tb_barbPassword" ErrorMessage="Password confirmation does not match" CssClass="required" ControlToValidate="tb_barbConfirmPass"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Email</td>
                <td class="auto-style3">
                    <asp:TextBox ID="tb_barbEmail" runat="server"></asp:TextBox>
               </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tb_barbEmail" ErrorMessage="Please enter a valid email" CssClass="required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <br />
                    <asp:Button class="btn-outline-dark" ID="btn_BarberLogIn" runat="server" Text="Sign Up" OnClick="barberRegisterEventMethod"/>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>

</div>
</div>
</div>
</div>
        </section>
    <!-- ================ contact section end ================= -->
    
  
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
