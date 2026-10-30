<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="Gym.About" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
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
                        <li class="nav-item"><a class="nav-link active" href="About.aspx">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="Membership.aspx">Membership</a></li>
                        <li class="nav-item"><a class="nav-link" href="Trainers.aspx">Trainers</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- ===================== ABOUT CONTENT ===================== -->
        <div class="container my-5">

            <div class="text-center mb-4">
                <h2>About Us</h2>
                <p class="text-muted">
                    GymMS helps you train with structure and support - flexible memberships,
                    certified trainers, and programs for every fitness level.
                </p>
            </div>
            <div class="row g-3 mb-4">
                <div class="col-md-6">
                    <div class="card h-100 p-3">
                        <h6>Our Mission</h6>
                        <p class="mb-0 text-muted small">Make fitness accessible and results-driven for every member.</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100 p-3">
                        <h6>Our Vision</h6>
                        <p class="mb-0 text-muted small">Be the most trusted gym in the community.</p>
                    </div>
                </div>
            </div>
            <div class="row g-2 text-center mb-4">
                <div class="col-6 col-md-3">
                    <div class="border p-2 small">Certified Trainers</div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="border p-2 small">Modern Equipment</div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="border p-2 small">Flexible Plans</div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="border p-2 small">Clean Facility</div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <p class="mb-1"><strong>Mon - Sat:</strong> 5:00 AM - 11:00 PM</p>
                    <p class="mb-0"><strong>Sunday:</strong> 6:00 AM - 9:00 PM</p>
                </div>
            </div>
        </div>
        <!-- ===================== FOOTER ===================== -->
        <footer class="bg-dark text-white text-center py-3">
            <p class="mb-0">&copy; 2026 Gym Management System</p>
        </footer>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>