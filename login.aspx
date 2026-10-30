<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="Gym.login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Layer Fitness | Login</title>
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
                    Welcome To GymMS
                </p>
                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="errorLabel">
                </asp:Label>
                <asp:TextBox
                    ID="txtEmail"
                    runat="server"
                    CssClass="textbox"
                    TextMode="Email"
                    placeholder="Email Address">
                </asp:TextBox>
                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    CssClass="textbox"
                    TextMode="Password"
                    placeholder="Password">
                </asp:TextBox>
                <asp:Button
                    ID="btnLogin"
                    runat="server"
                    Text="Login"
                    CssClass="btn-primary" />
                <div class="bottom-text">
                    Don't have an account?
                    <a href="Register.aspx">
                        Register
                    </a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>