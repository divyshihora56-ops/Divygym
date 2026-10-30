<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ContactUs.aspx.vb" Inherits="Gym.ContactUs" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" />
    <style>
        html,        body {
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url("Images/bg4.jpg");
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    color : white;
}
        form { display: flex; flex-direction: column; min-height: 100vh; }
        footer { margin-top: auto; }

        .page-header {
            padding: 60px 0;
            text-align: center;
        }

        .contact-card {
            background: #fff;
            border: 1px solid #eef0f2;
            border-radius: 16px;
            padding: 34px 22px;
            text-align: center;
            height: 100%;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .contact-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 16px 32px rgba(0,0,0,0.08);
        }
        .contact-icon {
            width: 64px; height: 64px;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.7rem;
            margin: 0 auto 16px;
        }
        .icon-whatsapp { background: #e6f7ed; color: #25D366; }
        .icon-email    { background: #e6f4ec; color: #198754; }
        .icon-location { background: #fde8ea; color: #dc3545; }

        .contact-title { font-weight: 700; margin-bottom: 4px; }
        .contact-sub { color: #6c757d; font-size: 0.9rem; }

        .hours-strip {
            background: #14532d;
            color: #fff;
            border-radius: 16px;
            padding: 26px 30px;
            margin-top: 40px;
        }
        .hours-strip .row > div {
            border-left: 1px solid rgba(255,255,255,0.15);
        }
        .hours-strip .row > div:first-child { border-left: none; }
        .hours-label { font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.05em; opacity: 0.7; }
        .hours-value { font-weight: 700; font-size: 1.05rem; }

        @media (max-width: 767px) {
            .hours-strip .row > div { border-left: none; border-top: 1px solid rgba(255,255,255,0.15); padding-top: 12px; margin-top: 12px; }
            .hours-strip .row > div:first-child { border-top: none; padding-top: 0; margin-top: 0; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="Home.aspx">Gym<span class="text-success">MS</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navMenu">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="AboutUs.aspx">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="Membership.aspx">Membership</a></li>
                        <li class="nav-item"><a class="nav-link" href="Trainers.aspx">Trainers</a></li>
                        <li class="nav-item"><a class="nav-link" href="Events.aspx">Events</a></li>
                        <li class="nav-item"><a class="nav-link active" href="ContactUs.aspx">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="Feedback.aspx">Feedback</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="page-header">
            <div class="container">
                <h2 class="fw-bold mb-1" style="color : seagreen !important;">Get In Touch</h2>
                <p class="mb-0" style="color : white !important;">We'd love to hear from you — reach out anytime</p>
            </div>
        </div>
        <div class="container py-5">
            <div class="row g-4 justify-content-center">
                <div class="col-md-4">
                    <asp:HyperLink ID="lnkWhatsApp" runat="server" Target="_blank" CssClass="text-decoration-none text-dark">
                        <div class="contact-card">
                            <div class="contact-icon icon-whatsapp"><i class="bi bi-whatsapp"></i></div>
                            <p class="contact-title">Chat on WhatsApp</p>
                            <p class="contact-sub mb-0"><asp:Literal ID="litPhoneDisplay" runat="server" /></p>
                        </div>
                    </asp:HyperLink>
                </div>
                <div class="col-md-4">
                    <asp:HyperLink ID="lnkEmail" runat="server" CssClass="text-decoration-none text-dark">
                        <div class="contact-card">
                            <div class="contact-icon icon-email"><i class="bi bi-envelope"></i></div>
                            <p class="contact-title">Email Us</p>
                            <p class="contact-sub mb-0"><asp:Literal ID="litEmailDisplay" runat="server" /></p>
                        </div>
                    </asp:HyperLink>
                </div>
                <div class="col-md-4">
                    <asp:HyperLink ID="lnkLocation" runat="server" Target="_blank" CssClass="text-decoration-none text-dark">
                        <div class="contact-card">
                            <div class="contact-icon icon-location"><i class="bi bi-geo-alt"></i></div>
                            <p class="contact-title">Visit Us</p>
                            <p class="contact-sub mb-0"><asp:Literal ID="litAddressDisplay" runat="server" /></p>
                        </div>
                    </asp:HyperLink>
                </div>
            </div>
            <div class="hours-strip">
                <div class="row text-center">
                    <div class="col-6 col-md-3">
                        <p class="hours-label mb-1">Mon - Fri</p>
                        <p class="hours-value mb-0">5 AM - 11 PM</p>
                    </div>
                    <div class="col-6 col-md-3">
                        <p class="hours-label mb-1">Saturday</p>
                        <p class="hours-value mb-0">6 AM - 10 PM</p>
                    </div>
                    <div class="col-6 col-md-3">
                        <p class="hours-label mb-1">Sunday</p>
                        <p class="hours-value mb-0">7 AM - 9 PM</p>
                    </div>
                    <div class="col-6 col-md-3">
                        <p class="hours-label mb-1">Response Time</p>
                        <p class="hours-value mb-0">Within 1 hour</p>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-dark text-white text-center py-3">
            <p class="mb-0">&copy; 2026 GymMS </p>
        </footer>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>