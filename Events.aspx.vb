Imports System.Data.OleDb
Public Class Events
    Inherits System.Web.UI.Page
    Dim conn As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\sem -5 .net project\Riyaan Gym project\Gym\Database\Gym.mdb"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindEvents()
        End If
    End Sub
    Private Sub BindEvents()
        Dim con As New OleDbConnection(conn)
        con.Open()
        Dim cmd As New OleDbCommand("Select * from Events ORDER BY EventDate", con)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        rptEvents.DataSource = dt
        rptEvents.DataBind()
        con.Close()
    End Sub
End Class