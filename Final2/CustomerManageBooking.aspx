<%@ Page Title="" Language="C#" MasterPageFile="~/Booking.Master" AutoEventWireup="true" CodeBehind="CustomerManageBooking.aspx.cs" Inherits="Final2.CustomerManageBooking" %>
<%@ Register TagPrefix="DayPilot" Namespace="DayPilot.Web.Ui" Assembly="DayPilot, Version=8.4.3622.1, Culture=neutral, PublicKeyToken=426941954f05e7fe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder1" runat="server">
    <div>
        <asp:Button ID="btnSignOut" runat="server" Text="Sign Out" OnClick="SignOutEventMethod"/>
        <asp:Label ID="userLabel" runat="server" Text="Label"></asp:Label>
    </div>
    <div class="space">
        Barber: 
        <asp:DropDownList runat="server" ID="DropDownListBarber" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListBarber_OnSelectedIndexChanged">
            <asp:ListItem Value="NONE">(no barbers specified)</asp:ListItem>
        </asp:DropDownList>
    </div>
    <asp:Panel runat="server" ID="Schedule">
        <div style="float:left; width: 150px;">
            <DayPilot:DayPilotNavigator 
                runat="server" 
                ID="DayPilotNavigator1" 
                ClientIDMode="Static"
                BoundDayPilotID="DayPilotCalendar1"
                ShowMonths="3"
                SelectMode="Week"
            />
        </div>
        
        <div style="margin-left: 150px;">
            <p>Available time slots:</p>

            <DayPilot:DayPilotCalendar 
                runat="server" 
                ID="DayPilotCalendar1"
                ClientIDMode="Static"
                ClientObjectName="dp"
                ViewType="Week"
                DurationBarWidth="10"
                OnCommand="DayPilotCalendar1_OnCommand"
                OnBeforeEventRender="DayPilotCalendar1_OnBeforeEventRender"
                EventClickHandling="JavaScript"
                EventClickJavaScript="edit(e)"
            />
        </div>
    </asp:Panel>

    <script>
        function edit(e) {
            new DayPilot.Modal({
                onClosed: function (args) {
                    // callback function executed between DayPilot.Modal & current JavaScript function
                    if (args.result == "OK") {
                        dp.commandCallBack('refresh');
                    }
                }
                // e.id() is appointmentID
            }).showUrl("Request.aspx?id=" + e.id());
        }
    </script>
</asp:Content>
