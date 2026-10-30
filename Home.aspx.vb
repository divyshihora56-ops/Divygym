Imports System.Data.OleDb
Public Class Home
    Inherits System.Web.UI.Page
    Dim conn As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\sem -5 .net project\Riyaan Gym project\Gym\Database\Gym.mdb"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CheckLoginStatus()
        End If
    End Sub
    Private Sub CheckLoginStatus()
        If Session("UserID") Is Nothing Then
            pnlGuest.Visible = True
            pnlMember.Visible = False
        Else
            pnlGuest.Visible = False
            pnlMember.Visible = True
            litMemberName.Text = Session("Name").ToString()
            Dim plan As String = GetActivePlan(CInt(Session("UserID")))
            If plan = "" Then
                litPlanBadge.Text = "No Plan"
            Else
                litPlanBadge.Text = plan & " Member"
            End If
        End If
    End Sub
    Private Function GetActivePlan(ByVal userId As Integer) As String

        Dim planName As String = ""
        Dim con As New OleDbConnection(conn)
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
    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session.Clear()
        Session.Abandon()
        Response.Redirect("Home.aspx")
    End Sub
End Class