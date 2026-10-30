Public Class ContactUs
    Inherits System.Web.UI.Page
    Private ReadOnly whatsappNumber As String = "919876543210"
    Private ReadOnly emailAddress As String = "hello@gymms.com"
    Private ReadOnly gymAddress As String = " Fitness Ave, Suart"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lnkWhatsApp.NavigateUrl = "https://wa.me/" & whatsappNumber
            litPhoneDisplay.Text = "+" & whatsappNumber
            lnkEmail.NavigateUrl = "mailto:" & emailAddress
            litEmailDisplay.Text = emailAddress
            litAddressDisplay.Text = gymAddress
            lnkLocation.NavigateUrl = "https://www.google.com/maps/search/?api=1&query=" & Uri.EscapeDataString(gymAddress)
        End If
    End Sub
End Class