<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ConfirmMembership.aspx.vb" Inherits="Gym.ConfirmMembership" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Membership</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand fw-bold" href="Home.aspx">Gym<span class="text-success">MS</span></a>
            </div>
        </nav>

        <div class="container py-5" style="max-width:500px;">
            <div class="card p-4 shadow-sm">
                <h3 class="text-center mb-4">Confirm Your Membership</h3>

                <p><strong>Plan Selected:</strong> <asp:Literal ID="litPlanName" runat="server" /></p>
                <p><strong>Price:</strong> ₹<asp:Literal ID="litPricePerMonth" runat="server" /> / month</p>

                <div class="mb-3">
                    <label for="ddlDuration" class="form-label fw-bold">Select Duration:</label>
                    <asp:DropDownList ID="ddlDuration" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlDuration_SelectedIndexChanged">
                        <asp:ListItem Text="1 Month" Value="1"></asp:ListItem>
                        <asp:ListItem Text="3 Months" Value="3"></asp:ListItem>
                        <asp:ListItem Text="6 Months" Value="6"></asp:ListItem>
                        <asp:ListItem Text="12 Months" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
    <label for="ddlPayment" class="form-label fw-bold">Payment Method:</label>
    <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-select">
      
        <asp:ListItem Text="Credit/Debit Card" Value="Card"></asp:ListItem>
        <asp:ListItem Text="UPI" Value="UPI"></asp:ListItem>
    </asp:DropDownList>
</div>

                <h4 class="text-success">Total: ₹<asp:Literal ID="litTotal" runat="server" /></h4>

                <asp:Button ID="btnConfirm" runat="server" Text="Confirm Purchase" CssClass="btn btn-success w-100 mt-3" OnClick="btnConfirm_Click" />

                <div class="text-center mt-3">
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>
                </div>
            </div>
        </div>

    </form>
</body>
</html>