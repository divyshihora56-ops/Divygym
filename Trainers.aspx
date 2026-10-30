<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Trainers.aspx.vb" Inherits="Gym.Trainers" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Trainers</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" />
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f8f9fa; 
                background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url("Images/bg4.jpg");
                background-size : cover;
        }
        .page-header {
            
            padding: 60px 0;
            text-align: center;
        }

        .category-heading {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 50px 0 20px;
        }
        .category-heading i { font-size: 1.4rem; }
        .category-heading h4 { margin: 0; font-weight: 700; }
        .category-heading::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #dee2e6;
        }

        .trainer-card {
            background: #fff;
            border: 1px solid #eef0f2;
            border-radius: 14px;
            padding: 24px 16px;
            text-align: center;
            height: 100%;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            position: relative;
            overflow: hidden;
        }
        .trainer-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 30px rgba(0,0,0,0.09);
        }
        .trainer-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 4px;
        }
        .trainer-card.silver::before   { background: linear-gradient(90deg, #adb5bd, #6c757d); }
        .trainer-card.gold::before     { background: linear-gradient(90deg, #ffd35a, #d99b00); }
        .trainer-card.platinum::before { background: linear-gradient(90deg, #b794f6, #6f42c1); }

        .trainer-photo {
            width: 90px; height: 90px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 14px;
            border: 3px solid #f1f3f5;
        }

        .trainer-name { font-weight: 700; margin-bottom: 6px; }

        .cat-badge {
            display: inline-block;
            font-size: 0.7rem;
            font-weight: 700;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            padding: 4px 12px;
            border-radius: 100px;
            margin-bottom: 10px;
        }
        .cat-badge.silver   { background: #eceef0; color: #495057; }
        .cat-badge.gold     { background: #fff3d6; color: #b8860b; }
        .cat-badge.platinum { background: #f1e9ff; color: #6f42c1; }

        .trainer-meta { font-size: 0.85rem; color: #6c757d; margin-bottom: 4px; }
        .trainer-fee { font-weight: 700; color: #198754; margin-top: 8px; margin-bottom: 0; }

        @media (max-width: 400px) {
            .trainer-card { padding: 18px 10px; }
            .trainer-photo { width: 70px; height: 70px; }
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
                        <li class="nav-item"><a class="nav-link active" href="Trainers.aspx">Trainers</a></li>
                        <li class="nav-item"><a class="nav-link" href="Events.aspx">Events</a></li>
                        <li class="nav-item"><a class="nav-link" href="ContactUs.aspx">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="Feedback.aspx">Feedback</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="page-header">
            <div class="container">
                <h2 class="fw-bold mb-1" style="color : seagreen !important;">Our Trainers</h2>
                <p class="mb-0" style="color:white;">Choose a trainer that fits your goals and budget</p>
            </div>
        </div>
        <div class="container pb-5">
            <div class="category-heading">
                <i class="bi bi-award text-secondary"></i>
                <h4 style="color : seagreen !important;">Silver Trainers</h4>
            </div>
            <div class="row g-3">
                <asp:Repeater ID="rptSilver" runat="server">
                    <ItemTemplate>
                        <div class="col-6 col-md-3">
                            <div class="trainer-card silver">
                                <img src='<%# Eval("Photo") %>' class="trainer-photo" alt="Trainer" onerror="this.src='https://placehold.co/90x90/adb5bd/ffffff?text=%20'" />
                                <p class="trainer-name mb-1"><%# Eval("FullName") %></p>
                                <span class="cat-badge silver">Silver</span>
                                <p class="trainer-meta"><%# Eval("Specialization") %></p>
                                <p class="trainer-meta"><%# Eval("ExperienceYears") %> yrs experience</p>
                                <p class="trainer-fee">₹<%# Eval("MonthlyFee") %> / month</p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="category-heading">
                <i class="bi bi-award-fill" style="color:#d99b00;"></i>
                <h4 style="color : seagreen !important;">Gold Trainers</h4>
            </div>
            <div class="row g-3">
                <asp:Repeater ID="rptGold" runat="server">
                    <ItemTemplate>
                        <div class="col-6 col-md-3">
                            <div class="trainer-card gold">
                                <img src='<%# Eval("Photo") %>' class="trainer-photo" alt="Trainer" onerror="this.src='https://placehold.co/90x90/ffd35a/ffffff?text=%20'" />
                                <p class="trainer-name mb-1"><%# Eval("FullName") %></p>
                                <span class="cat-badge gold">Gold</span>
                                <p class="trainer-meta"><%# Eval("Specialization") %></p>
                                <p class="trainer-meta"><%# Eval("ExperienceYears") %> yrs experience</p>
                                <p class="trainer-fee">₹<%# Eval("MonthlyFee") %> / month</p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="category-heading">
                <i class="bi bi-gem" style="color:#6f42c1;"></i>
                <h4 style="color : seagreen !important;">Platinum Trainers</h4>
            </div>
            <div class="row g-3">
                <asp:Repeater ID="rptPlatinum" runat="server">
                    <ItemTemplate>
                        <div class="col-6 col-md-3">
                            <div class="trainer-card platinum">
                                <img src='<%# Eval("Photo") %>' class="trainer-photo" alt="Trainer" onerror="this.src='https://placehold.co/90x90/b794f6/ffffff?text=%20'" />
                                <p class="trainer-name mb-1"><%# Eval("FullName") %></p>
                                <span class="cat-badge platinum">Platinum</span>
                                <p class="trainer-meta"><%# Eval("Specialization") %></p>
                                <p class="trainer-meta"><%# Eval("ExperienceYears") %> yrs experience</p>
                                <p class="trainer-fee">₹<%# Eval("MonthlyFee") %> / month</p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <footer class="bg-dark text-white text-center py-3">
            <p class="mb-0">&copy; 2026 GymMS</p>
        </footer>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>