using System;
using System.Configuration;
using System.Data;
using DayPilot.Web.Ui.Events.Calendar;
using MySql.Data.MySqlClient;
using CommandEventArgs = DayPilot.Web.Ui.Events.CommandEventArgs;

namespace Final2
{
    public partial class CustomerManageBooking : System.Web.UI.Page
    {
        // Data Table object that holds database information retrieved
        private DataTable appointments;

        private string queryStr;

        string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            /* extract from the session what we stored from LogIn */
            name = (string)(Session["uname"]);
            if (name == null)
            {
                Response.BufferOutput = true;
                Response.Redirect("CustLog.aspx", false);
            }
            else
            {
                /* reference/store uname into label */
                userLabel.Text = $"Greetings {name},";

                // can retrieve the username, so continue to load appointment data
                if (!IsPostBack)
                {
                    // if there's no barberId, load all free appointments & appointments of current customerId
                    if (string.IsNullOrEmpty(Request.QueryString["barberId"]) || Convert.ToInt32(Request.QueryString["barberId"]) == 0)
                    {
                        LoadBarbersForDropDownList();
                        LoadCalendarData();
                        LoadNavigatorData();
                    }
                    else
                    {
                        string barberId = Request.QueryString["barberId"];
                        DropDownListBarber.SelectedValue = barberId;

                        DataRow barber = LoadBarber(barberId);
                        if (barber == null)
                        {
                            Schedule.Visible = false;
                            return;
                        }

                        DropDownListBarber.AppendDataBoundItems = false;

                        LoadBarbersForDropDownList();

                        // Only load appointments data of the selected barber
                        LoadCalendarData(Convert.ToInt32(barberId));
                        LoadNavigatorData(Convert.ToInt32(barberId));
                    }

                }
            }
        }

        protected void SignOutEventMethod(object sender, EventArgs e)
        {
            /*Set session to NULL */
            Session["uname"] = null;
            Session.Abandon();
            Response.BufferOutput = true;
            Response.Redirect("CusLog.aspx", false);
        }

        protected void DayPilotCalendar1_OnCommand(object sender, CommandEventArgs e)
        {
            string barberId = Request.QueryString["barberId"];
            switch (e.Command)
            {
                case "navigate":
                    DayPilotCalendar1.StartDate = (DateTime)e.Data["day"];
                    LoadCalendarData(Convert.ToInt32(barberId));
                    break;
                case "refresh":
                    LoadCalendarData(Convert.ToInt32(barberId));
                    break;
            }
        }

        protected void DayPilotCalendar1_OnBeforeEventRender(object sender, BeforeEventRenderEventArgs e)
        {
            string status = e.Tag["appointment_status"];

            switch (status)
            {
                case "free":
                    e.DurationBarColor = "green";
                    e.Html = "Available";
                    e.ToolTip = "Click to Request This Time Slot";
                    break;
                case "waiting":
                    e.DurationBarColor = "orange";
                    e.Html = "Your appointment, waiting for confirmation";
                    break;
                case "confirmed":
                    e.DurationBarColor = "#f41616";
                    e.Html = "Your appointment, confirmed";
                    break;
            }
        }

        protected void DropDownListBarber_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedBarberId = Convert.ToInt32(DropDownListBarber.SelectedValue);
            int customerId = Convert.ToInt32(Request.QueryString["customerId"]);

            if (selectedBarberId == 0)
            {
                Response.Redirect($"CustomerManageBooking.aspx?customerId={customerId}&barberId=0", true);
                return;
            }

            Response.Redirect($"CustomerManageBooking.aspx?customerId={customerId}&barberId={selectedBarberId}", true);
        }

        private void LoadCalendarData(int selectedBarberId = 0) // selectedBarberId default value is 0, which means loading data for all barbers
        {
            if (appointments == null)
            {
                if (selectedBarberId == 0)
                {
                    LoadAppointmentsOfCurrentCustomer();
                }
                else
                {
                    LoadAppointmentsOfCurrentCustomerAndSelectedBarberId(selectedBarberId);
                }
            }

            DayPilotCalendar1.DataSource = appointments;
            DayPilotCalendar1.DataStartField = "appointment_start";
            DayPilotCalendar1.DataEndField = "appointment_end";
            DayPilotCalendar1.DataIdField = "appointmentID";
            DayPilotCalendar1.DataTextField = "customer_name";
            DayPilotCalendar1.DataTagFields = "appointment_status";
            DayPilotCalendar1.DataBind();
            DayPilotCalendar1.Update();
        }

        private void LoadNavigatorData(int selectedBarberId = 0) // selectedBarberId default value is 0, which means loading data for all barbers
        {
            if (appointments == null)
            {
                if (selectedBarberId == 0)
                {
                    LoadAppointmentsOfCurrentCustomer();
                }
                else
                {
                    LoadAppointmentsOfCurrentCustomerAndSelectedBarberId(selectedBarberId);
                }
            }

            DayPilotNavigator1.DataSource = appointments;
            DayPilotNavigator1.DataStartField = "appointment_start";
            DayPilotNavigator1.DataEndField = "appointment_end";
            DayPilotNavigator1.DataIdField = "appointmentID";
            DayPilotNavigator1.DataBind();
        }

        private void LoadBarbersForDropDownList()
        {
            DropDownListBarber.DataSource = LoadAllBarbers();
            DropDownListBarber.DataTextField = "barber_last_name";
            DropDownListBarber.DataValueField = "barberID";
            DropDownListBarber.DataBind();
        }

        private void LoadAppointmentsOfCurrentCustomer()
        {
            int customerId = Convert.ToInt32(Request.QueryString["customerId"]);  // basic validation
            appointments = LoadFreeAndMyAppointments(DayPilotNavigator1.VisibleStart, DayPilotNavigator1.VisibleEnd, customerId);
        }

        private void LoadAppointmentsOfCurrentCustomerAndSelectedBarberId(int barberId)
        {
            int customerId = Convert.ToInt32(Request.QueryString["customerId"]);  // basic validation
            appointments = LoadFreeAppointmentsForSelectedBarberAndAppointmentsOfCurrentCustomer(DayPilotNavigator1.VisibleStart, DayPilotNavigator1.VisibleEnd, customerId, barberId);
        }

        private DataTable LoadFreeAndMyAppointments(DateTime start, DateTime end, int customerId)
        {
            queryStr =
                "SELECT * FROM appointment " +
                "WHERE (appointment_status = 'free' OR (appointment_status <> 'free' AND customerID = ?customerId)) " +
                "AND NOT ((appointment_end <= ?start) OR (appointment_start >= ?end))";
            MySqlDataAdapter da = new MySqlDataAdapter(queryStr, ConfigurationManager.ConnectionStrings["WebAppConnString"].ConnectionString);
            da.SelectCommand.Parameters.AddWithValue("customerId", customerId);
            da.SelectCommand.Parameters.AddWithValue("start", start);
            da.SelectCommand.Parameters.AddWithValue("end", end);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        private DataTable LoadFreeAppointmentsForSelectedBarberAndAppointmentsOfCurrentCustomer(DateTime start, DateTime end, int customerId, int barberId)
        {
            queryStr =
                "SELECT * FROM appointment " +
                "WHERE (appointment_status = 'free' AND barberID = ?barberId) " +
                "OR (appointment_status <> 'free' AND customerID = ?customerId AND barberID = ?barberId) " +
                "AND NOT ((appointment_end <= ?start) OR (appointment_start >= ?end))";
            MySqlDataAdapter da = new MySqlDataAdapter(queryStr, ConfigurationManager.ConnectionStrings["WebAppConnString"].ConnectionString);
            da.SelectCommand.Parameters.AddWithValue("customerId", customerId);
            da.SelectCommand.Parameters.AddWithValue("start", start);
            da.SelectCommand.Parameters.AddWithValue("end", end);
            da.SelectCommand.Parameters.AddWithValue("barberId", barberId);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        private DataRow LoadBarber(string barberId)
        {
            queryStr = "SELECT * FROM barber WHERE barberID = ?id";

            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(queryStr, ConfigurationManager.ConnectionStrings["WebAppConnString"].ConnectionString);
            dataAdapter.SelectCommand.Parameters.AddWithValue("id", barberId);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            if (dataTable.Rows.Count > 0)
            {
                return dataTable.Rows[0];
            }

            return null;
        }

        private DataTable LoadAllBarbers()
        {
            queryStr = "SELECT * FROM barber ORDER BY barberID";
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(queryStr, ConfigurationManager.ConnectionStrings["WebAppConnString"].ConnectionString);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            return dataTable;
        }
    }
}