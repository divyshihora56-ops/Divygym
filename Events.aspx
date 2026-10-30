<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Events.aspx.vb" Inherits="Gym.Events" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events & Challenges</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url("Images/bg4.jpg");
    background-size : cover;
}
.navbar-brand { font-weight: bold; color: #4CD964 !important; }
.navbar-brand span { color: #ffffff; }
.page-header {
    background-color: #0d0f10;
    border-bottom: 1px solid #2a2e30;
    padding: 55px 0;
    text-align: center;
}
.page-header h2 {
    color: #4CD964;
    font-weight: 800;
}
.page-header p {
    color: #adb5bd;
}
.event-card {
    background-color: #1a1d1f;
    border: 1px solid #2a2e30;
    border-radius: 14px;
    padding: 26px;
    height: 100%;
    transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
    position: relative;
    overflow: hidden;
}
.event-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 4px;
    background: linear-gradient(90deg, #4CD964, #2ea84a);
}
.event-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 14px 30px rgba(0,0,0,0.4);
    border-color: #4CD964;
}
.event-card h5 {
    color: #ffffff;
    font-weight: 700;
    margin-bottom: 8px;
}
.event-date {
    color: #4CD964;
    font-weight: 700;
    font-size: 0.9rem;
    margin-bottom: 10px;
}
.event-date i { margin-right: 5px; }
.event-desc {
    color: #adb5bd;
    font-size: 0.9rem;
    margin-bottom: 16px;
}
.event-fee {
    color: #ffffff;
    font-weight: 700;
    font-size: 1.1rem;
    border-top: 1px solid #2a2e30;
    padding-top: 12px;
}

.footer {
    background-color: #0d0f10;
    border-top: 1px solid #2a2e30;
    padding: 25px 0;
    margin-top :auto;
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
                        <li class="nav-item"><a class="nav-link active" href="Events.aspx">Events</a></li>
                        <li class="nav-item"><a class="nav-link" href="ContactUs.aspx">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container text-center my-5">
            <h2  style="color : seagreen !important;">Events & Challenges</h2>
            <p class="text-muted"  style="color : white !important;">Take part in our upcoming events</p>
        </div>
        <div class="container mb-5">
            <div class="row g-4">
                <asp:Repeater ID="rptEvents" runat="server">
                    <ItemTemplate>
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100 p-3">
                                <h5><%# Eval("EventName") %></h5>
                                <p class="text-success fw-bold mb-1"><%# Eval("EventDate", "{0:dd MMM yyyy}") %></p>
                                <p class="text-muted small mb-2"><%# Eval("Description") %></p>
                                <p class="fw-bold mb-0">₹<%# Eval("Fee") %></p>
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
