<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Membership.aspx.vb" Inherits="Gym.Membership" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership Plans</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
               body {
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url("Images/bg4.jpg");
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    color : white;
}
        /* Page title section */
        .page-header {
          
            padding: 50px 0;
            text-align: center;
        }
        /* Plan card base style */
        .plan-card {
            color : forestgreen ;
            border: 2px solid #dee2e6;
            border-radius: 10px;
            padding: 30px 20px;
            text-align: center;
            background-color: #ffffff;
            height: 100%;
            transition: transform 0.25s ease, box-shadow 0.25s ease, border-color 0.25s ease;
            position: relative;
        }
        /* Hover effect - card lifts up slightly */
        .plan-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
            border-color: #198754;
        }
        /* Highlighted middle plan */
        .plan-card.featured {
            color : forestgreen ;
            border-color: #198754;
            background-color: #f0fff4;
        }
        .featured-badge {
            position: absolute;
            top: -14px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #198754;
            color: #ffffff;
            font-size: 0.75rem;
            font-weight: 600;
            padding: 5px 15px;
            border-radius: 20px;
        }

        .plan-name {
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 10px;
        }

        .plan-price {
            font-size: 2.2rem;
            font-weight: bold;
            color: #198754;
            margin-bottom: 20px;
        }

        .plan-price span {
            font-size: 1rem;
            color: #6c757d;
            font-weight: normal;
        }

        .plan-features {
            list-style: none;
            padding: 0;
            margin-bottom: 25px;
            text-align: left;
        }

        .plan-features li {
            padding: 6px 0;
            border-bottom: 1px solid #f1f1f1;
        }

        .plan-features li:last-child {
            border-bottom: none;
        }

        /* Buttons grow slightly on hover */
        .plan-card .btn {
            width: 100%;
            font-weight: 600;
            transition: transform 0.2s ease;
        }

        .plan-card .btn:hover {
            transform: scale(1.03);
        }

        footer {
            background-color: #212529;
            color: #ffffff;
        }

        /* Responsive tweaks for small screens */
        @media (max-width: 767px) {
            .plan-card {
                margin-bottom: 20px;
            }

            .page-header h2 {
                font-size: 1.6rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- ===================== NAVBAR ===================== -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand fw-bold" href="Home.aspx">Gym<span class="text-success">MS</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navMenu">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="AboutUs.aspx">About Us</a></li>
                        <li class="nav-item"><a class="nav-link active" href="Membership.aspx">Membership</a></li>
                        <li class="nav-item"><a class="nav-link" href="Trainers.aspx">Trainers</a></li>
                        <li class="nav-item"><a class="nav-link" href="Events.aspx">Events</a></li>
                        <li class="nav-item"><a class="nav-link" href="ContactUs.aspx">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="Feedback.aspx">Feedback</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- ===================== PAGE HEADER ===================== -->
        <div class="page-header">
            <div class="container">
                <h2 class="fw-bold" style="color : seagreen !important;">Membership Plans</h2>
                <p class="text-muted mb-0" style="color : seagreen !important;">Choose the plan that suits you best</p>
            </div>
        </div>
        <!-- ===================== MEMBERSHIP PLANS ===================== -->
        <div class="container py-5">
            <div class="row g-4 justify-content-center">
               
               <!-- Bronze -->
<div class="col-md-4">
    <div class="plan-card">
        <div class="plan-name">Bronze</div>
        <div class="plan-price">₹999 <span>/ month</span></div>
        <ul class="plan-features">
            <li>✔ Gym Access</li>
            <li>✔ Locker Facility</li>
            <li>✔ Cardio Area</li>
        </ul>
        <asp:Button ID="btnSelectBronze" runat="server" Text="Select Bronze" CssClass="btn btn-outline-success" OnClick="btnSelectBronze_Click" />
    </div>
</div>
<!-- Silver (Featured) -->
<div class="col-md-4">
    <div class="plan-card featured">
        <span class="featured-badge">Most Popular</span>
        <div class="plan-name">Silver</div>
        <div class="plan-price">₹1,999 <span>/ month</span></div>
        <ul class="plan-features">
            <li>✔ Everything in Bronze</li>
            <li>✔ Fitness Programs</li>
            <li>✔ Diet Consultation</li>
            <li>✔ Priority Booking</li>
        </ul>
        <asp:Button ID="btnSelectSilver" runat="server" Text="Select Silver" CssClass="btn btn-success" OnClick="btnSelectSilver_Click" />
    </div>
</div>
<!-- Gold -->
<div class="col-md-4">
    <div class="plan-card">
        <div class="plan-name">Gold</div>
        <div class="plan-price">₹2,999 <span>/ month</span></div>
        <ul class="plan-features">
            <li>✔ Everything in Silver</li>
            <li>✔ Premium Equipment</li>
            <li>✔ Max Trainer Discount</li>
            <li>✔ Unlimited Programs</li>
        </ul>
        <asp:Button ID="btnSelectGold" runat="server" Text="Select Gold" CssClass="btn btn-outline-success" OnClick="btnSelectGold_Click" />
    </div>
</div>
            <!-- Message area -->
            <div class="text-center mt-4">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>
            </div>
        </div>
        <!-- ===================== FOOTER ===================== -->
        <footer class="text-center py-3">
            <p class="mb-0">&copy; 2026 GymMS</p>
        </footer>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>