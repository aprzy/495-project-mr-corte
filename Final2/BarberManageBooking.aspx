<%@ Page Title="" Language="C#" MasterPageFile="~/Booking.Master" AutoEventWireup="true" CodeBehind="BarberManageBooking.aspx.cs" Inherits="Final2.BarberManageBooking" %>
<%@ Register TagPrefix="DayPilot" Namespace="DayPilot.Web.Ui" Assembly="DayPilot, Version=8.4.3622.1, Culture=neutral, PublicKeyToken=426941954f05e7fe" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript" src="js/daypilot-modal-2.2.js"></script>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder1" runat="server">
     <div>
        <asp:Button ID="btnSignOut" runat="server" Text="Sign Out" OnClick="BarberSignOutEventMethod"/>
        <%--<asp:Label ID="userLabel" runat="server" Text="Label"></asp:Label>--%>
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
            <DayPilot:DayPilotCalendar 
                runat="server"
                ID="DayPilotCalendar1"
                ClientObjectName="dp"
                ClientIDMode="Static"
                ViewType="Week"
                OnCommand="DayPilotCalendar1_OnCommand"
                TimeRangeSelectedHandling="CallBack"
                OnTimeRangeSelected="DayPilotCalendar1_OnTimeRangeSelected"
                OnBeforeEventRender="DayPilotCalendar1_OnBeforeEventRender"
                EventClickHandling="JavaScript"
                EventClickJavaScript="edit(e);"
                EventMoveHandling="CallBack"
                OnEventMove="DayPilotCalendar1_OnEventMove"
                EventResizeHandling="CallBack"
                OnEventResize="DayPilotCalendar1_OnEventResize"
            />
        </div>

         </asp:Panel>
    <script>
        function edit(e) {
            new DayPilot.Modal({
                onClosed: function(args) {
                    if (args.result == "OK") {
                        dp.commandCallBack('refresh');
                    }
                }
                // e.id() is appointmentID
            }).showUrl("Edit.aspx?id=" + e.id());
        }
    </script>

</asp:Content>
