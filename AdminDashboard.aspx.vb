Imports System.Data.OleDb
Imports System.Data
Imports System.Drawing
Imports System.CodeDom
Public Class AdminDashboard
    Inherits System.Web.UI.Page

    Dim connString As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\sem -5 .net project\Riyaan Gym project\Gym\Database\Gym.mdb"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Role") Is Nothing OrElse Session("Role").ToString() <> "Admin" Then
            Response.Redirect("Login.aspx")
            Return
        End If

        If Not IsPostBack Then
            ShowSection("Dashboard")
            BindGrid()
            LoadCounts()
        End If

    End Sub

    Protected Sub ShowSection_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim btn As LinkButton = CType(sender, LinkButton)
        ShowSection(btn.CommandArgument)

        If btn.CommandArgument = "Trainers" Then
            BindGrid()
        ElseIf btn.CommandArgument = "Events" Then
            BindEventsGrid()
        ElseIf btn.CommandArgument = "Reports" Then
            LoadReports()
        End If
    End Sub

    Private Sub ShowSection(ByVal sectionName As String)
        pnlDashboard.Visible = (sectionName = "Dashboard")
        pnlTrainers.Visible = (sectionName = "Trainers")
        pnlEvents.Visible = (sectionName = "Events")
        pnlReports.Visible = (sectionName = "Reports")
    End Sub

    Private Sub LoadCounts()

        Dim con As New OleDbConnection(connString)
        con.Open()

        Dim cmd As New OleDbCommand("SELECT COUNT(*) FROM Trainers", con)
        litTrainerCount.Text = cmd.ExecuteScalar().ToString()

        con.Close()

    End Sub

    Private Sub BindGrid()

        Dim con As New OleDbConnection(connString)
        con.Open()

        Dim cmd As New OleDbCommand("SELECT * FROM Trainers", con)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)

        gvTrainers.DataSource = dt
        gvTrainers.DataBind()

        con.Close()

    End Sub

    Protected Sub btnAddTrainer_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim con As New OleDbConnection(connString)
        con.Open()

        Dim cmd As New OleDbCommand("INSERT INTO Trainers (FullName, Category, Specialization, ExperienceYears, MonthlyFee, Photo) VALUES (?, ?, ?, ?, ?, ?)", con)
        cmd.Parameters.AddWithValue("?", txtFullName.Text.Trim())
        cmd.Parameters.AddWithValue("?", ddlCategory.SelectedValue)
        cmd.Parameters.AddWithValue("?", txtSpecialization.Text.Trim())
        cmd.Parameters.AddWithValue("?", CInt(txtExperience.Text.Trim()))
        cmd.Parameters.AddWithValue("?", CInt(txtFee.Text.Trim()))
        cmd.Parameters.AddWithValue("?", txtPhotoUrl.Text.Trim())
        cmd.ExecuteNonQuery()
        con.Close()
        lblTrainerMessage.Text = "Trainer added successfully."
        txtFullName.Text = ""
        txtSpecialization.Text = ""
        txtExperience.Text = ""
        txtFee.Text = ""
        txtPhotoUrl.Text = ""
        BindGrid()
        LoadCounts()
        ShowSection("Trainers")
    End Sub
    Protected Sub gvTrainers_RowEditing(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        gvTrainers.EditIndex = e.NewEditIndex
        BindGrid()
        ShowSection("Trainers")
    End Sub
    Protected Sub gvTrainers_RowCancelingEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        gvTrainers.EditIndex = -1
        BindGrid()
        ShowSection("Trainers")
    End Sub
    Protected Sub gvTrainers_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)

        Dim trainerId As Integer = CInt(gvTrainers.DataKeys(e.RowIndex).Value)
        Dim row As GridViewRow = gvTrainers.Rows(e.RowIndex)

        Dim fullName As String = CType(row.Cells(1).Controls(0), TextBox).Text.Trim()
        Dim category As String = CType(row.Cells(2).Controls(0), TextBox).Text.Trim()
        Dim specialization As String = CType(row.Cells(3).Controls(0), TextBox).Text.Trim()
        Dim experience As Integer = CInt(CType(row.Cells(4).Controls(0), TextBox).Text.Trim())
        Dim fee As Integer = CInt(CType(row.Cells(5).Controls(0), TextBox).Text.Trim())
        Dim con As New OleDbConnection(connString)
        con.Open()
        Dim cmd As New OleDbCommand("UPDATE Trainers SET FullName=?, Category=?, Specialization=?, ExperienceYears=?, MonthlyFee=? WHERE TrainerID=?", con)
        cmd.Parameters.AddWithValue("?", fullName)
        cmd.Parameters.AddWithValue("?", category)
        cmd.Parameters.AddWithValue("?", specialization)
        cmd.Parameters.AddWithValue("?", experience)
        cmd.Parameters.AddWithValue("?", fee)
        cmd.Parameters.AddWithValue("?", trainerId)
        cmd.ExecuteNonQuery()
        con.Close()
        gvTrainers.EditIndex = -1
        BindGrid()
        ShowSection("Trainers")
    End Sub
    Protected Sub gvTrainers_RowDeleting(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)

        Dim trainerId As Integer = CInt(gvTrainers.DataKeys(e.RowIndex).Value)
        Dim con As New OleDbConnection(connString)
        con.Open()
        Dim cmd As New OleDbCommand("DELETE FROM Trainers WHERE TrainerID=?", con)
        cmd.Parameters.AddWithValue("?", trainerId)
        cmd.ExecuteNonQuery()
        con.Close()
        BindGrid()
        LoadCounts()
        ShowSection("Trainers")
    End Sub

    Private Sub BindEventsGrid()

        Dim con As New OleDbConnection(connString)
        con.Open()

        Dim cmd As New OleDbCommand("SELECT * FROM Events ORDER BY EventDate", con)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)

        gvEvents.DataSource = dt
        gvEvents.DataBind()

        con.Close()

    End Sub

    Protected Sub btnAddEvent_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim con As New OleDbConnection(connString)
        con.Open()

        Dim cmd As New OleDbCommand("INSERT INTO Events (EventName, EventDate, Description, Fee) VALUES (?, ?, ?, ?)", con)

        cmd.Parameters.AddWithValue("?", txtEventName.Text.Trim())
        cmd.Parameters.AddWithValue("?", CDate(txtEventDate.Text.Trim()))
        cmd.Parameters.AddWithValue("?", txtEventDescription.Text.Trim())
        cmd.Parameters.AddWithValue("?", CInt(txtEventFee.Text.Trim()))

        cmd.ExecuteNonQuery()
        con.Close()

        lblEventMessage.Text = "Event added successfully."

        txtEventName.Text = ""
        txtEventDate.Text = ""
        txtEventDescription.Text = ""
        txtEventFee.Text = ""

        BindEventsGrid()
        ShowSection("Events")

    End Sub

    Protected Sub gvEvents_RowEditing(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        gvEvents.EditIndex = e.NewEditIndex
        BindEventsGrid()
        ShowSection("Events")
    End Sub

    Protected Sub gvEvents_RowCancelingEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        gvEvents.EditIndex = -1
        BindEventsGrid()
        ShowSection("Events")
    End Sub

    Protected Sub gvEvents_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)

        Dim eventId As Integer = CInt(gvEvents.DataKeys(e.RowIndex).Value)
        Dim row As GridViewRow = gvEvents.Rows(e.RowIndex)

        Dim eventName As String = CType(row.Cells(1).Controls(0), TextBox).Text.Trim()
        Dim eventDate As Date = CDate(CType(row.Cells(2).Controls(0), TextBox).Text.Trim())
        Dim description As String = CType(row.Cells(3).Controls(0), TextBox).Text.Trim()
        Dim fee As Integer = CInt(CType(row.Cells(4).Controls(0), TextBox).Text.Trim())

        Dim con As New OleDbConnection(connString)
        con.Open()

        Dim cmd As New OleDbCommand("UPDATE Events SET EventName=?, EventDate=?, Description=?, Fee=? WHERE EventID=?", con)

        cmd.Parameters.AddWithValue("?", eventName)
        cmd.Parameters.AddWithValue("?", eventDate)
        cmd.Parameters.AddWithValue("?", description)
        cmd.Parameters.AddWithValue("?", fee)
        cmd.Parameters.AddWithValue("?", eventId)

        cmd.ExecuteNonQuery()
        con.Close()

        gvEvents.EditIndex = -1
        BindEventsGrid()
        ShowSection("Events")

    End Sub

    Protected Sub gvEvents_RowDeleting(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)

        Dim eventId As Integer = CInt(gvEvents.DataKeys(e.RowIndex).Value)

        Dim con As New OleDbConnection(connString)
        con.Open()

        Dim cmd As New OleDbCommand("DELETE FROM Events WHERE EventID=?", con)
        cmd.Parameters.AddWithValue("?", eventId)

        cmd.ExecuteNonQuery()
        con.Close()

        BindEventsGrid()
        ShowSection("Events")

    End Sub

    Private Sub LoadReports()
        Dim conn As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\sem -5 .net project\Riyaan Gym project\Gym\Database\Gym.mdb"
        Dim con As New OleDbConnection(conn)
        con.Open()
        Dim cmd As OleDbCommand
        cmd = New OleDbCommand("select count(*) from SitesVisits", con)
        litTotalVisits.Text = cmd.ExecuteScalar().ToString()
        cmd = New OleDbCommand("select count(*) from Members", con)
        litTotalMembers.Text = cmd.ExecuteScalar().ToString()
        cmd = New OleDbCommand("select count(*) from Events", con)
        litTotalMemberships.Text = cmd.ExecuteScalar().ToString()

        cmd = New OleDbCommand("select sum(TotalAmount) from Memberships", con)
        Dim revenueResult As Object = cmd.ExecuteScalar()
        If IsDBNull(revenueResult) Then
            litTotalRevenue.Text = "0"
        Else
            litTotalRevenue.Text = revenueResult.ToString()
        End If
        cmd = New OleDbCommand("select count(*) from Trainers", con)
        litTotalTrainersReport.Text = cmd.ExecuteScalar()
        cmd = New OleDbCommand("select count(*) from Events", con)
        litTotalEventsReport.Text = cmd.ExecuteScalar()

        Dim firstDayOfMonth As Date = New Date(DateTime.Now.Year, DateTime.Now.Month, 1)
        cmd = New OleDbCommand("select count(*) from Memberships where StartDate >= ?", con)
        cmd.Parameters.AddWithValue("?", firstDayOfMonth)
        litNewMembersThisMonth.Text = cmd.ExecuteScalar().ToString()
        con.Close()
    End Sub


End Class