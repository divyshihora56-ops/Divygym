<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AboutUs.aspx.vb" Inherits="Gym.AboutUs" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" />
    <style>
       body {
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url("Images/bg4.jpg");
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    color : white;
}

      .about-hero {
        padding: 60px 0;
        text-align: center;
}
        .about-img { width: 100%; border-radius: 10px; aspect-ratio: 4/3; object-fit: cover; background-color: #e9ecef; }
        .value-icon { font-size: 1.6rem; color: #198754; margin-bottom: 8px; }
        .stat-box { text-align: center; }
        .stat-box h3 { color: #198754; font-weight: bold; margin-bottom: 0; }
        .text-muted{color : white !important ;}
        .card,.card h6 .card p{color : forestgreen !important;}
    
       
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- ===================== NAVBAR ===================== -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="Home.aspx">Gym<span class="text-success">MS</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navMenu">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="AboutUs.aspx">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="Membership.aspx">Membership</a></li>
                        <li class="nav-item"><a class="nav-link" href="Trainers.aspx">Trainers</a></li>
                        <li class="nav-item"><a class="nav-link" href="ContactUs.aspx">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="Feedback.aspx">Feedback</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- ===================== HERO ===================== -->
        <div class="about-hero">
            <div class="container">
                <h2 class="fw-bold"style="color : seagreen !important;">About GymMS</h2>
                <p class="mb-0 text-white-50">Training with structure, support, and real results</p>
            </div>
        </div>

        <div class="container my-5">

            <!-- INTRO: IMAGE + TEXT -->
            <div class="row align-items-center g-4 mb-5">
                <div class="col-md-5">
                    <img src="Images/about-gym.jpg" class="about-img" alt="Gym"
                        onerror="this.src='https://linkspaces.co.uk/wp-content/uploads/2024/05/gb-botanica-gym-link-spaces-slough-1024x683.jpg'" />
                </div>
                <div class="col-md-7">
                    <h4 style="color : seagreen !important;">Who We Are</h4>
                    <p class="text-muted">
                        GymMS is built to remove the friction between you and your goals - flexible
                        memberships, certified trainers, and fitness programs designed for every level,
                        all managed in one place.
                    </p>
                    <div class="row text-center mt-4">
                        <div class="col-4 stat-box">
                            <h3>1200+</h3>
                            <small class="text-muted">Members</small>
                        </div>
                        <div class="col-4 stat-box">
                            <h3>24</h3>
                            <small class="text-muted">Trainers</small>
                        </div>
                        <div class="col-4 stat-box">
                            <h3>8</h3>
                            <small class="text-muted">Years</small>
                        </div>
                    </div>
                </div>
            </div>

            <!-- MISSION & VISION -->
            <div class="row g-3 mb-5">
                <div class="col-md-6">
                    <div class="card h-100 p-4 border-0 shadow-sm">
                        <i class="bi bi-bullseye value-icon"></i>
                        <h6>Our Mission</h6>
                        <p class="mb-0 text-muted small" style="color : #000000 !important;">Make fitness accessible and results-driven for every member.</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100 p-4 border-0 shadow-sm" >
                        <i class="bi bi-eye value-icon"></i>
                        <h6>Our Vision</h6>
                        <p class="mb-0 text-muted small" style="color : #000000 !important;">Be the most trusted gym in the community.</p>
                    </div>
                </div>
            </div>

            <!-- WHY CHOOSE US -->
            <h5 class="mb-3">Why Choose Us</h5>
            <div class="row g-3 text-center mb-5">
                <div class="col-6 col-md-3">
                    <div class="p-3 border-0 shadow-sm">
                        <i class="bi bi-person-badge value-icon"></i>
                        <p class="small mb-0">Certified Trainers</p>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="p-3 border-0 shadow-sm">
                        <i class="bi bi-lightning-charge value-icon"></i>
                        <p class="small mb-0">Modern Equipment</p>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="p-3 border-0 shadow-sm">
                        <i class="bi bi-calendar-check value-icon"></i>
                        <p class="small mb-0">Flexible Plans</p>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="p-3 border-0 shadow-sm">
                        <i class="bi bi-stars value-icon"></i>
                        <p class="small mb-0">Clean Facility</p>
                    </div>
                </div>
            </div>

            <!-- HOURS -->
            <div class="row">
                <div class="col-md-6">
                    <h6><i class="bi bi-clock text-success me-1"></i> Opening Hours</h6>
                    <p class="mb-1 text-muted small">Mon - Sat: 5:00 AM - 11:00 PM</p>
                    <p class="mb-0 text-muted small">Sunday: 6:00 AM - 9:00 PM</p>
                </div>
            </div>

        </div>

        <!-- ===================== FOOTER ===================== -->
        <footer class="bg-dark text-white text-center py-3">
            <p class="mb-0">&copy; 2026 GymMS</p>
        </footer>

    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>