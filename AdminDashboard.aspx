<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AdminDashboard.aspx.vb" Inherits="Gym.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <!-- ===================== NAVBAR ===================== -->
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="AdminDashboard.aspx">Admin Dashboard</a>
                <a href="Home.aspx" class="btn btn-outline-light btn-sm">Back to Site</a>
            </div>
        </nav>

        <div class="container my-4">

            <!-- ===================== SECTION MENU (simple buttons instead of sidebar) ===================== -->
            <div class="mb-4">
                <asp:LinkButton ID="lnkDashboard" runat="server" CssClass="btn btn-outline-success me-2" OnClick="ShowSection_Click" CommandArgument="Dashboard">Dashboard</asp:LinkButton>
                <asp:LinkButton ID="lnkTrainers" runat="server" CssClass="btn btn-outline-success me-2" OnClick="ShowSection_Click" CommandArgument="Trainers">Trainers</asp:LinkButton>
                <asp:LinkButton ID="lnkEvents" runat="server" CssClass="btn btn-outline-success me-2" OnClick="ShowSection_Click" CommandArgument="Events">Events</asp:LinkButton>
                <asp:LinkButton ID="lnkReports" runat="server" CssClass="btn btn-outline-success" OnClick="ShowSection_Click" CommandArgument="Reports">Reports</asp:LinkButton>
            </div>

            <!-- ===================== DASHBOARD HOME ===================== -->
            <asp:Panel ID="pnlDashboard" runat="server">
                <h4>Welcome, Admin</h4>
                <p>Total Trainers: <asp:Literal ID="litTrainerCount" runat="server" Text="0" /></p>
            </asp:Panel>

            <!-- ===================== TRAINERS SECTION ===================== -->
            <asp:Panel ID="pnlTrainers" runat="server" Visible="false">
                <h4>Manage Trainers</h4>

                <div class="border p-3 mb-4">
                    <h5>Add New Trainer</h5>

                    <div class="mb-2">
                        <label class="form-label">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" />
                    </div>

                    <div class="mb-2">
                        <label class="form-label">Category</label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Silver" Value="Silver"></asp:ListItem>
                            <asp:ListItem Text="Gold" Value="Gold"></asp:ListItem>
                            <asp:ListItem Text="Platinum" Value="Platinum"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="mb-2">
                        <label class="form-label">Specialization</label>
                        <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control" />
                    </div>

                    <div class="mb-2">
                        <label class="form-label">Experience (Years)</label>
                        <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" />
                    </div>

                    <div class="mb-2">
                        <label class="form-label">Monthly Fee (₹)</label>
                        <asp:TextBox ID="txtFee" runat="server" CssClass="form-control" />
                    </div>

                    <div class="mb-2">
                        <label class="form-label">Photo URL</label>
                        <asp:TextBox ID="txtPhotoUrl" runat="server" CssClass="form-control" />
                    </div>

                    <asp:Button ID="btnAddTrainer" runat="server" Text="Add Trainer" CssClass="btn btn-success mt-2" OnClick="btnAddTrainer_Click" />
                    <asp:Label ID="lblTrainerMessage" runat="server" CssClass="d-block mt-2" />
                </div>

                <h5>Existing Trainers</h5>
                <asp:GridView ID="gvTrainers" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered"
                    DataKeyNames="TrainerID"
                    OnRowEditing="gvTrainers_RowEditing"
                    OnRowUpdating="gvTrainers_RowUpdating"
                    OnRowCancelingEdit="gvTrainers_RowCancelingEdit"
                    OnRowDeleting="gvTrainers_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="TrainerID" HeaderText="ID" ReadOnly="true" />
                        <asp:BoundField DataField="FullName" HeaderText="Name" />
                        <asp:BoundField DataField="Category" HeaderText="Category" />
                        <asp:BoundField DataField="Specialization" HeaderText="Specialization" />
                        <asp:BoundField DataField="ExperienceYears" HeaderText="Experience" />
                        <asp:BoundField DataField="MonthlyFee" HeaderText="Fee" />
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>

            <!-- ===================== EVENTS SECTION (placeholder) ===================== -->
           <asp:Panel ID="pnlEvents" runat="server" Visible="false">
    <h4>Manage Events</h4>

    <div class="border p-3 mb-4">
        <h5>Add New Event</h5>

        <div class="mb-2">
            <label class="form-label">Event Name</label>
            <asp:TextBox ID="txtEventName" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-2">
            <label class="form-label">Event Date</label>
            <asp:TextBox ID="txtEventDate" runat="server" CssClass="form-control" TextMode="Date" />
        </div>

        <div class="mb-2">
            <label class="form-label">Description</label>
            <asp:TextBox ID="txtEventDescription" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-2">
            <label class="form-label">Fee (₹)</label>
            <asp:TextBox ID="txtEventFee" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="btnAddEvent" runat="server" Text="Add Event" CssClass="btn btn-success mt-2" OnClick="btnAddEvent_Click" />
        <asp:Label ID="lblEventMessage" runat="server" CssClass="d-block mt-2" />
    </div>

    <h5>Existing Events</h5>
    <asp:GridView ID="gvEvents" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered"
        DataKeyNames="EventID"
        OnRowEditing="gvEvents_RowEditing"
        OnRowUpdating="gvEvents_RowUpdating"
        OnRowCancelingEdit="gvEvents_RowCancelingEdit"
        OnRowDeleting="gvEvents_RowDeleting">
        <Columns>
            <asp:BoundField DataField="EventID" HeaderText="ID" ReadOnly="true" />
            <asp:BoundField DataField="EventName" HeaderText="Name" />
            <asp:BoundField DataField="EventDate" HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Fee" HeaderText="Fee" />
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
</asp:Panel>

             <!-- ===================== REPORTS SECTION ===================== -->
           <asp:Panel ID="pnlReports" runat="server" Visible="false">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="mb-0">Website Reports</h4>
            <small class="text-muted">Live overview of your gym's performance</small>
        </div>
    </div>

    <!-- HERO STAT: REVENUE -->
    <div class="revenue-hero mb-4">
        <div class="row align-items-center">
            <div class="col-md-8">
                <p class="mb-1 opacity-75">Total Revenue Generated</p>
                <h1 class="mb-0">₹<asp:Literal ID="litTotalRevenue" runat="server" Text="0" /></h1>
            </div>
            <div class="col-md-4 text-md-end mt-3 mt-md-0">
                <i class="bi bi-graph-up-arrow" style="font-size:3rem;opacity:0.35;"></i>
            </div>
        </div>
    </div>

    <!-- METRIC GROUP: TRAFFIC -->
    <p class="section-label">Traffic</p>
    <div class="row g-3 mb-4">
        <div class="col-6 col-md-3">
            <div class="report-card">
                <div class="report-icon icon-blue"><i class="bi bi-eye"></i></div>
                <h3 class="report-number"><asp:Literal ID="litTotalVisits" runat="server" Text="0" /></h3>
                <p class="report-label">Website Visits</p>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="report-card">
                <div class="report-icon icon-green"><i class="bi bi-people"></i></div>
                <h3 class="report-number"><asp:Literal ID="litTotalMembers" runat="server" Text="0" /></h3>
                <p class="report-label">Registered Members</p>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="report-card">
                <div class="report-icon icon-blue"><i class="bi bi-graph-up-arrow"></i></div>
                <h3 class="report-number"><asp:Literal ID="litNewMembersThisMonth" runat="server" Text="0" /></h3>
                <p class="report-label">New This Month</p>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="report-card">
                <div class="report-icon icon-amber"><i class="bi bi-card-checklist"></i></div>
                <h3 class="report-number"><asp:Literal ID="litTotalMemberships" runat="server" Text="0" /></h3>
                <p class="report-label">Memberships Sold</p>
            </div>
        </div>
    </div>

    <!-- METRIC GROUP: OPERATIONS -->
    <p class="section-label">Operations</p>
    <div class="row g-3">
        <div class="col-6 col-md-3">
            <div class="report-card">
                <div class="report-icon icon-purple"><i class="bi bi-person-badge"></i></div>
                <h3 class="report-number"><asp:Literal ID="litTotalTrainersReport" runat="server" Text="0" /></h3>
                <p class="report-label">Active Trainers</p>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="report-card">
                <div class="report-icon icon-red"><i class="bi bi-calendar-event"></i></div>
                <h3 class="report-number"><asp:Literal ID="litTotalEventsReport" runat="server" Text="0" /></h3>
                <p class="report-label">Upcoming Events</p>
            </div>
        </div>
    </div>

</asp:Panel>

        </div>

    </form>
</body>
</html>