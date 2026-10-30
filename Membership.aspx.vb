Imports System.Data.OleDb

Public Class Membership
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSelectBronze_Click(sender As Object, e As EventArgs) Handles btnSelectBronze.Click
        SelectPlan("Bronze", 999)
    End Sub

    Protected Sub btnSelectSilver_Click(sender As Object, e As EventArgs) Handles btnSelectSilver.Click
        SelectPlan("Silver", 1999)
    End Sub

    Protected Sub btnSelectGold_Click(sender As Object, e As EventArgs) Handles btnSelectGold.Click
        SelectPlan("Gold", 2999)
    End Sub

    Private Sub SelectPlan(ByVal planName As String, ByVal pricePerMonth As Integer)
        If Session("UserID") Is Nothing Then
            lblMessage.Text = "Please login first to select a membership plan."
            Return
        End If

        Dim existingPlan As String = GetActivePlan(CInt(Session("UserID")))

        If existingPlan <> "" Then
            lblMessage.Text = "You already have an active " & existingPlan & " membership."
            Return
        End If

        Session("SelectedPlan") = planName
        Session("PlanPrice") = pricePerMonth
        Response.Redirect("ConfirmMembership.aspx")

    End Sub

    Private Function GetActivePlan(ByVal userId As Integer) As String

        Dim planName As String = ""

        Dim con As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=D:\sem -5 .net project\Riyaan Gym project\Gym\Database\Gym.mdb")
        con.Open()

        Dim cmd As New OleDbCommand("SELECT TOP 1 PlanName FROM Memberships WHERE UserID = ? AND Status = 'Active' ORDER BY StartDate DESC", con)
        cmd.Parameters.AddWithValue("?", userId)

        Dim dr As OleDbDataReader = cmd.ExecuteReader()

        If dr.Read() Then
            planName = dr("PlanName").ToString()
        End If

        dr.Close()
        con.Close()

        Return planName

    End Function

End Class