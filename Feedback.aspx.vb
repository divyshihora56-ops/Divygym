Imports System.Data.OleDb
Imports System.Data
Public Class Feedback
    Inherits System.Web.UI.Page
    Dim conn As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\sem -5 .net project\Riyaan Gym project\Gym\Database\Gym.mdb"
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        If txtName.Text.Trim() = "" Then
            lblMessage.Text = "Please Enter Your Name."
            lblMessage.CssClass = "d-block mt-3 text-centre fw-bold text-danger"
            Return
        End If
        If hdnRating.Value = "" Then
            lblMessage.Text = "Please select a rating"
            lblMessage.CssClass = "d-block mt3 text-centre fw-boald text-danger"
            Return
        End If
        Dim con As New OleDbConnection(conn)
        con.Open()
        Dim cmd As New OleDbCommand("insert into Feedback ([Fullname],[Rating],[Comments],[SubmittedDate]) values (?,?,?,?)", con)
        cmd.Parameters.Add("?", OleDbType.VarChar).Value = txtName.Text.Trim()
        cmd.Parameters.Add("?", OleDbType.Integer).Value = CInt(hdnRating.Value)
        cmd.Parameters.Add("?", OleDbType.VarChar).Value = txtComments.Text.Trim()
        cmd.Parameters.Add("?", OleDbType.Date).Value = DateTime.Now
        cmd.ExecuteNonQuery()
        con.Close()
        lblMessage.Text = "Thank you for your Feedback !!"
        lblMessage.CssClass = "d-block mt-3 text-centre fw-bold text-success"
        txtName.Text = ""
        txtComments.Text = ""
        hdnRating.Value = ""
    End Sub
End Class