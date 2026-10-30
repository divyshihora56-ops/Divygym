Imports System.Data.OleDb
Public Class Trainers
    Inherits System.Web.UI.Page
    Dim conn As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\sem -5 .net project\Riyaan Gym project\Gym\Database\Gym.mdb"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindTrainers(rptSilver, "Silver")
            BindTrainers(rptGold, "Gold")
            BindTrainers(rptPlatinum, "Platinum")
        End If
    End Sub
    Private Sub BindTrainers(ByVal rpt As Repeater, ByVal category As String)

        Dim con As New OleDbConnection(conn)
        con.Open()
        Dim cmd As New OleDbCommand("SELECT * FROM Trainers WHERE Category = ?", con)
        cmd.Parameters.AddWithValue("?", category)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        rpt.DataSource = dt
        rpt.DataBind()
        con.Close()

    End Sub
End Class