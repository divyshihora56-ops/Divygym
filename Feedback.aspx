<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Feedback.aspx.vb" Inherits="Gym.Feedback" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" />
    <style>
        html, body { height: 100%; font-family: 'Segoe UI', sans-serif;  background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url("Images/bg4.jpg");}
        form { display: flex; flex-direction: column; min-height: 100vh; }
        footer { margin-top: auto; }

        .page-header {
         
            padding: 55px 0;
            text-align: center;
        }
        .page-header i { font-size: 2.2rem; color: #ffc107; margin-bottom: 10px; }

        .feedback-card {
            background: #fff;
            border: 1px solid #eef0f2;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        .form-label i { color: #198754; margin-right: 6px; }

        .star-rating {
    display: flex;
    gap: 8px;
    font-size: 2.1rem;
}
.star-rating i {
    color: #d1d5db;
    cursor: pointer;
    transition: color 0.12s ease, transform 0.1s ease;
    text-shadow: 0 1px 1px rgba(0,0,0,0.08);
}
.star-rating i:hover,
.star-rating i.active {
    color: #f5a623;
    transform: scale(1.12);
    text-shadow: 0 1px 2px rgba(245,166,35,0.35);
}

        .btn-submit-feedback {
            background: #198754;
            border: none;
            font-weight: 600;
            padding: 10px 0;
        }
        .btn-submit-feedback:hover { background: #157347; }
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
                        <li class="nav-item"><a class="nav-link" href="ContactUs.aspx">Contact</a></li>
                        <li class="nav-item"><a class="nav-link active" href="Feedback.aspx">Feedback</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="page-header">
            <div class="container">
                <i class="bi bi-chat-heart d-block"></i>
                <h2 class="fw-bold mb-1" style="color : seagreen !important;">We'd Love Your Feedback</h2>
                <p class="mb-0" style="color : white !important;">Help us make GymMS even better</p>
            </div>
        </div>
        <div class="container py-5" style="max-width:560px;">
            <div class="feedback-card">
                <div class="mb-3">
                    <label class="form-label"><i class="bi bi-person"></i>Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your name" />
                </div>
                <div class="mb-3">
                    <label class="form-label"><i class="bi bi-star"></i>Your Rating</label>
                   <div class="star-rating" id="starRating">
                     <i class="bi bi-star-fill" data-value="1"></i>
                     <i class="bi bi-star-fill" data-value="2"></i>
                     <i class="bi bi-star-fill" data-value="3"></i>
                     <i class="bi bi-star-fill" data-value="4"></i>
                     <i class="bi bi-star-fill" data-value="5"></i>
                    </div>
                    <asp:HiddenField ID="hdnRating" runat="server" Value="" />
                </div>
                <div class="mb-3">
                    <label class="form-label"><i class="bi bi-chat-square-text"></i>Comments</label>
                    <asp:TextBox ID="txtComments" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Tell us about your experience..." />
                </div>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" CssClass="btn btn-submit-feedback text-white w-100" OnClick="btnSubmit_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="d-block mt-3 text-center fw-bold" />
            </div>
        </div>
        <footer class="bg-dark text-white text-center py-3">
            <p class="mb-0">&copy; 2026 GymMS</p>
        </footer>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script>
        const stars = document.querySelectorAll('#starRating i');
        const hiddenRating = document.getElementById('<%= hdnRating.ClientID %>');

        function highlightStars(count) {
            stars.forEach(function (star) {
                const val = parseInt(star.getAttribute('data-value'));
                if (val <= count) {
                    star.classList.add('active');
                } else {
                    star.classList.remove('active');
                }
            });
        }
        stars.forEach(function (star) {
            star.addEventListener('click', function () {
                const val = star.getAttribute('data-value');
                hiddenRating.value = val;
                highlightStars(parseInt(val));
            });
        });
    </script>
</body>
</html>