<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="Gym.Register" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Layer Fitness | Register</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="register.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="overlay">
            <div class="auth-card">
                <h1 class="logo">
                    GymMS FITNESS
                </h1>
                <p class="subtitle">
                    Create Your Account
                </p>
                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="errorLabel">
                </asp:Label>
                <asp:TextBox
                    ID="txtFullName"
                    runat="server"
                    CssClass="textbox"
                    placeholder="Full Name">
                </asp:TextBox>
                <asp:TextBox
                    ID="txtEmail"
                    runat="server"
                    CssClass="textbox"
                    TextMode="Email"
                    placeholder="Email Address">
                </asp:TextBox>
                <asp:TextBox
                    ID="txtMobile"
                    runat="server"
                    CssClass="textbox"
                    MaxLength="10"
                    placeholder="Mobile Number">
                </asp:TextBox>
                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    CssClass="textbox"
                    TextMode="Password"
                    placeholder="Password">
                </asp:TextBox>
                <asp:TextBox
                    ID="txtConfirmPassword"
                    runat="server"
                    CssClass="textbox"
                    TextMode="Password"
                    placeholder="Confirm Password">
                </asp:TextBox>
                <asp:Button
                    ID="btnRegister"
                    runat="server"
                    Text="Create Account"
                    CssClass="btn-primary" />
                <div class="bottom-text">
                    Already have an account?
                    <a href="Login.aspx">
                        Login
                    </a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>