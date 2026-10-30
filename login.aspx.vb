Imports System.Data.OleDb
Public Class login
    Inherits System.Web.UI.Page
    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If txtEmail.Text = "" Then
            MsgBox("Enter Email", MsgBoxStyle.Exclamation)
            Return
        End If
        If txtPassword.Text = "" Then
            MsgBox("Enter Password", MsgBoxStyle.Exclamation)
            Return
        End If
        Dim con As New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\sem -5 .net project\Riyaan Gym project\Gym\Database\Gym.mdb")
        con.Open()
        Dim cmd As New OleDbCommand("Select * From Members Where Email=? And Password=?", con)
        cmd.Parameters.AddWithValue("?", txtEmail.Text.Trim())
        cmd.Parameters.AddWithValue("?", txtPassword.Text.Trim())
        Dim dr As OleDbDataReader = cmd.ExecuteReader()
        If dr.Read() Then
            Session("UserID") = dr("UserID").ToString()
            Session("Name") = dr("FullName").ToString()
            Session("Role") = dr("Role").ToString()
            dr.Close()
            con.Close()
            If Session("Role").ToString() = "Admin" Then
                Response.Redirect("AdminDashboard.aspx")
            Else
                Response.Redirect("Home.aspx")
            End If
        Else
            MsgBox("Invalid Email or Password", MsgBoxStyle.Exclamation)
        End If
    End Sub
End Class