Imports System.Data.OleDb

Public Class ConfirmMembership
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("SelectedPlan") Is Nothing Then
            Response.Redirect("Membership.aspx")
            Return
        End If
        If Not IsPostBack Then
            litPlanName.Text = Session("SelectedPlan").ToString()
            litPricePerMonth.Text = Session("PlanPrice").ToString()
            CalcuateTotal()
        End If
    End Sub
    Private Sub CalcuateTotal()
        Dim pricePerMonth As Integer = CInt(Session("PlanPrice"))
        Dim months As Integer = CInt(ddlDuration.SelectedValue)
        Dim total As Integer = pricePerMonth * months
        litTotal.Text = total.ToString()
    End Sub
    Protected Sub ddlDuration_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlDuration.SelectedIndexChanged
        CalcuateTotal()
    End Sub

    Protected Sub btnConfirm_Click(sender As Object, e As EventArgs) Handles btnConfirm.Click
        Dim userId As Integer = CInt(Session("UserID"))
        Dim planName As String = Session("SelectedPlan").ToString()
        Dim pricePerMonth As Integer = CInt(Session("PlanPrice"))
        Dim months As Integer = CInt(ddlDuration.SelectedValue)
        Dim total As Integer = pricePerMonth * months
        Dim startDate As DateTime = DateTime.Now
        Dim endDate As DateTime = startDate.AddMonths(months)
        Dim paymentMethod As String = ddlPayment.SelectedValue

        Dim con As New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\sem -5 .net project\Riyaan Gym project\Gym\Database\Gym.mdb")
        con.Open()

        Dim cmd As New OleDbCommand("INSERT INTO Memberships (UserID, PlanName, DurationMonths, PricePerMonth, TotalAmount, StartDate, EndDate, Status,PaymentMethod,PaymentStatus) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?)", con)

        cmd.Parameters.Add("?", OleDbType.Integer).Value = userId
        cmd.Parameters.Add("?", OleDbType.VarChar).Value = planName
        cmd.Parameters.Add("?", OleDbType.Integer).Value = months
        cmd.Parameters.Add("?", OleDbType.Integer).Value = pricePerMonth
        cmd.Parameters.Add("?", OleDbType.Integer).Value = total
        cmd.Parameters.Add("?", OleDbType.Date).Value = startDate
        cmd.Parameters.Add("?", OleDbType.Date).Value = endDate
        cmd.Parameters.Add("?", OleDbType.VarChar).Value = "Active"
        cmd.Parameters.Add("?", OleDbType.VarChar).Value = paymentMethod
        cmd.Parameters.Add("?", OleDbType.VarChar).Value = "Paid"


        cmd.ExecuteNonQuery()

        con.Close()

        Session("SelectedPlan") = Nothing
        Session("PlanPrice") = Nothing

        MsgBox("Membership Bought SuccessFully", MsgBoxStyle.Information)

        Response.Redirect("Home.aspx")



    End Sub
End Class