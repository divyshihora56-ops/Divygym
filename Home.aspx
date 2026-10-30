<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Home.aspx.vb" Inherits="Gym.Home" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Management System - Home</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" />
    <style>
         body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url("Images/bg6.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color : white;
           }
        .navbar-brand { font-weight: bold; color: #198754; }
        .why-icon { font-size: 2.5rem; color: #198754; margin-bottom: 15px; }
        footer { background-color: #212529; color: #ffffff; padding: 30px 0 15px; }
        footer.row{row-gap : 20px;}
        footer h5 ,h6{margin-bottom : 10px;}
        footer a { color: #dee2e6; text-decoration: none; }
        footer p,footer li{margin-bottom : 4px;}
        
        footer a:hover { color: #198754; }
       .carousel-item img {
    height: 420px;
    object-fit: cover;
    width: 100%;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx">GYM<span class="text-success">MS</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarMain">
                    <ul class="navbar-nav ms-auto align-items-lg-center">
                        <li class="nav-item"><a class="nav-link" href="Default.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="AboutUs.aspx">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="Membership.aspx">Membership</a></li>
                        <li class="nav-item"><a class="nav-link" href="Trainers.aspx">Trainers</a></li>
                        <li class="nav-item"><a class="nav-link" href="Events.aspx">Programs</a></li>
                        <li class="nav-item"><a class="nav-link" href="ContactUs.aspx">Contact Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="Feedback.aspx">Feedback</a></li>
                       <li class="nav-item ms-lg-3 d-flex align-items-center">
    <asp:Panel ID="pnlGuest" runat="server">
        <asp:HyperLink ID="lnkLogin" runat="server" CssClass="btn btn-outline-light btn-sm" NavigateUrl="login.aspx">Login</asp:HyperLink>
        <asp:HyperLink ID="lnkRegister" runat="server" CssClass="btn btn-success btn-sm ms-2" NavigateUrl="Register.aspx">Register</asp:HyperLink>
    </asp:Panel>
   <asp:Panel ID="pnlMember" runat="server" CssClass="d-flex align-items-center" Visible="false">
    <span class="text-white me-3">
        Hi, <asp:Literal ID="litMemberName" runat="server" />
        <span class="badge bg-success ms-1"><asp:Literal ID="litPlanBadge" runat="server" /></span>
    </span>
    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-success btn-sm" OnClick="btnLogout_Click" />
</asp:Panel>
</li>
                    </ul>
                </div>
            </div>
        </nav> 
        <div id="carouselHero" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselHero" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#carouselHero" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#carouselHero" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <asp:Image ID="imgSlide1" runat="server" CssClass="d-block w-100" ImageUrl="https://cdn.wallpapersafari.com/30/61/x7Fz0I.jpg" AlternateText="Gym Interior" />
                    <div class="carousel-caption d-none d-md-block">
                        <h1><asp:Literal ID="litSlide1Title" runat="server" Text="Build The Strongest Version Of You" /></h1>
                        <p><asp:Literal ID="litSlide1Text" runat="server" Text="Join today and get a free 3-day trial." /></p>
                        <asp:HyperLink ID="lnkSlide1CTA" runat="server" CssClass="btn btn-success" NavigateUrl="Register.aspx">Get Started</asp:HyperLink>
                    </div>
                </div>
                <div class="carousel-item">
                    <asp:Image ID="imgSlide2" runat="server" CssClass="d-block w-100" ImageUrl="Images/cftrainer.jpg" AlternateText="Group Class" />
                    <div class="carousel-caption d-none d-md-block">
                        <h1><asp:Literal ID="litSlide2Title" runat="server" Text="Certified Trainers" /></h1>
                        <p><asp:Literal ID="litSlide2Text" runat="server" Text="Bronze, Silver and Gold trainers to match your goals." /></p>
                        <asp:HyperLink ID="lnkSlide2CTA" runat="server" CssClass="btn btn-success" NavigateUrl="Trainers.aspx">Meet Our Trainers</asp:HyperLink>
                    </div>
                </div>
                <div class="carousel-item">
                    <asp:Image ID="imgSlide3" runat="server" CssClass="d-block w-100" ImageUrl="Images/event.jpg" AlternateText="Fitness Programs" />
                    <div class="carousel-caption d-none d-md-block">
                        <h1><asp:Literal ID="litSlide3Title" runat="server" Text="Programs For Every Goal" /></h1>
                        <p><asp:Literal ID="litSlide3Text" runat="server" Text="Yoga, HIIT, CrossFit, Zumba and Strength Training." /></p>
                        <asp:HyperLink ID="lnkSlide3CTA" runat="server" CssClass="btn btn-success" NavigateUrl="Events.aspx">View Programs</asp:HyperLink>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselHero" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselHero" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>
        <section class="py-5">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="fw-bold" style="color : seagreen !important;">Why Choose Us</h2>
                    <p class="text-muted" style="color :seagreen !important;" >Everything a modern gym needs, under one roof.</p>
                </div>
                <div class="row g-4 text-center">
                    <div class="col-md-6 col-lg-3">
                        <div class="card h-100 p-3 shadow-sm">
                            <i class="bi bi-fire why-icon"></i>
                            <div class="card-body">
                                <h5 class="card-title">Premium Equipment</h5>
                                <p class="card-text text-muted">Full range of strength and cardio machines.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card h-100 p-3 shadow-sm">
                            <i class="bi bi-person-badge why-icon"></i>
                            <div class="card-body">
                                <h5 class="card-title">Certified Trainers</h5>
                                <p class="card-text text-muted">Hire a trainer that matches your goals and budget.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card h-100 p-3 shadow-sm">
                            <i class="bi bi-calendar-check why-icon"></i>
                            <div class="card-body">
                                <h5 class="card-title">Flexible Plans</h5>
                                <p class="card-text text-muted">1, 3, 6 or 12-month memberships available.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card h-100 p-3 shadow-sm">
                            <i class="bi bi-trophy why-icon"></i>
                            <div class="card-body">
                                <h5 class="card-title">Events &amp; Challenges</h5>
                                <p class="card-text text-muted">Push-up challenges, marathons and more.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
            <div class="container">
                <div class="row align-items-center g-4">
                    <div class="col-lg-5">
                        <asp:Image ID="imgAboutPreview" runat="server" CssClass="img-fluid rounded shadow" ImageUrl="https://linkspaces.co.uk/wp-content/uploads/2024/05/gb-botanica-gym-link-spaces-slough-1024x683.jpg" AlternateText="About Gym" />
                    </div>
                    <div class="col-lg-7">
                        <h2 class="fw-bold" style="color : seagreen !important;">More Than A Gym</h2>
                        <p class="text-muted" style="color : white !important;">
                            The Gym Management System helps you manage memberships, trainers, fitness programs
                            and events all in one place. Members get a clear path to their goals with structured
                            plans and real support.
                        </p>
                        <asp:HyperLink ID="lnkReadMore" runat="server" CssClass="btn btn-outline-success" NavigateUrl="AboutUs.aspx">Read More</asp:HyperLink>
                    </div>
                </div>
            </div>
        <footer>
            <div class="container">
                <div class="row g-4">
                    <div class="col-md-4">
                        <h5>GYM<span class="text-success">MS</span></h5>
                        <p class="text-muted small">Gym Management System - manage memberships, trainers and programs in one place.</p>
                    </div>
                    <div class="col-md-4">
                        <h6>Quick Links</h6>
                        <ul class="list-unstyled">
                            <li><a href="About.aspx">About Us</a></li>
                            <li><a href="Membership.aspx">Membership</a></li>
                            <li><a href="Trainers.aspx">Trainers</a></li>
                            <li><a href="Events.aspx">Events</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h6>Contact</h6>
                        <p class="text-muted small mb-1"><i class="bi bi-geo-alt"></i> 123 Fitness Ave, Your City</p>
                        <p class="text-muted small mb-1"><i class="bi bi-telephone"></i> +1 (555) 010-2030</p>
                        <p class="text-muted small mb-1"><i class="bi bi-envelope"></i> hello@gymms.com</p>
                    </div>
                </div>
                <hr class="border-secondary" />
                <p class="text-center text-muted small mb-0">&copy; 2026 GymMS. All rights reserved.</p>
            </div>
        </footer>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>