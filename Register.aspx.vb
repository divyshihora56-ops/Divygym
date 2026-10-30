Imports System.Data.OleDb
Public Class Register
    Inherits System.Web.UI.Page
    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        If txtFullName.Text = "" And txtEmail.Text = "" And txtMobile.Text = "" And txtPassword.Text = "" And txtConfirmPassword.Text = "" Then
            MsgBox("Enter all the details ", MsgBoxStyle.Exclamation)
            Return
        End If
        If txtPassword.Text <> txtConfirmPassword.Text Then
            MsgBox("Password do not match", MsgBoxStyle.Exclamation)
            Return
        End If
        Dim con As New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\sem -5 .net project\Riyaan Gym project\Gym\Database\Gym.mdb")
        con.Open()
        Dim checkcmd As New OleDbCommand("select count(*) from Members where Email=?", con)
        checkcmd.Parameters.AddWithValue("?", txtEmail.Text.Trim())
        If CInt(checkcmd.ExecuteScalar()) > 0 Then
            MsgBox("email already exist")
            con.Close()
            Return
        End If
        Dim cmd As New OleDbCommand("Insert into Members ([Fullname],[Email],[Mobile],[Password],[Role]) values (?,?,?,?,?)", con)
        cmd.Parameters.AddWithValue("?", txtFullName.Text.Trim())
        cmd.Parameters.AddWithValue("?", txtEmail.Text.Trim())
        cmd.Parameters.AddWithValue("?", txtMobile.Text.Trim())
        cmd.Parameters.AddWithValue("?", txtPassword.Text.Trim())
        cmd.Parameters.AddWithValue("?", "User")
        cmd.ExecuteNonQuery()
        MsgBox("Registration Successful", MsgBoxStyle.Information)
        Response.Redirect("login.aspx")
    End Sub
End Class