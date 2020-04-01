using System;
using System.Configuration;
using System.Data;
using DayPilot.Web.Ui.Events;
using DayPilot.Web.Ui.Events.Calendar;
using MySql.Data.MySqlClient;

namespace Final2
{
    public partial class BarberManageBooking : System.Web.UI.Page
    {
        private DataTable appointments;

        /*Contains the connection string to connect to the database */
        private MySqlConnection conn;

        /*Contains the connection within its instantiation and the query parameter */
        private MySqlCommand cmd;

        private string queryStr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int barberId = Convert.ToInt32(Request.QueryString["id"]);  // basic validation

                DataRow barber = LoadBarber(barberId);
                // if barber is null here, it means for some reason the data has been modified/deleted from the database, which is bad, so do nothing & return
                if (barber == null)
                {
                    Schedule.Visible = false;
                    return;
                }

                LoadNavigatorData();
                LoadCalendarData();
            }
        }

        protected void BarberSignOutEventMethod(object sender, EventArgs e)
        {
            Session["uname"] = null;
            Session.Abandon();
            Response.BufferOutput = true;
            Response.Redirect("BarLog.aspx", false);
        }



        protected void DayPilotCalendar1_OnCommand(object sender, CommandEventArgs e)
        {
            switch (e.Command)
            {
                case "navigate":
                    DayPilotCalendar1.StartDate = (DateTime)e.Data["day"];
                    LoadCalendarData();
                    break;
                case "refresh":
                    LoadCalendarData();
                    break;
            }
        }

        protected void DayPilotCalendar1_OnTimeRangeSelected(object sender, TimeRangeSelectedEventArgs e)
        {
            int barberId = Convert.ToInt32(Request.QueryString["id"]);

            CreateAppointment(barberId, e.Start, e.End);

            LoadCalendarData();

        }

        protected void DayPilotCalendar1_OnBeforeEventRender(object sender, BeforeEventRenderEventArgs e)
        {
            string status = e.Tag["appointment_status"];
            switch (status)
            {
                case "free":
                    e.DurationBarColor = "green";
                    break;
                case "waiting":
                    e.DurationBarColor = "orange";
                    break;
                case "confirmed":
                    e.DurationBarColor = "#f41616";  // red
                    break;
            }
        }

        protected void DayPilotCalendar1_OnEventMove(object sender, EventMoveEventArgs e)
        {
            MoveAppointment(e.Id, e.NewStart, e.NewEnd);
            LoadCalendarData();
        }

        protected void DayPilotCalendar1_OnEventResize(object sender, EventResizeEventArgs e)
        {
            MoveAppointment(e.Id, e.NewStart, e.NewEnd);
            LoadCalendarData();
        }

        private void LoadNavigatorData()
        {
            if (appointments == null)
            {
                LoadAppointments();
            }

            DayPilotNavigator1.DataSource = appointments;
            DayPilotNavigator1.DataStartField = "appointment_start";
            DayPilotNavigator1.DataEndField = "appointment_end";
            DayPilotNavigator1.DataIdField = "appointmentID";
            DayPilotNavigator1.DataBind();
        }

        private void LoadCalendarData()
        {
            if (appointments == null)
            {
                LoadAppointments();
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

        private void LoadAppointments()
        {
            int barberId = Convert.ToInt32(Request.QueryString["id"]);  // basic validation
            appointments = LoadAppointmentsForBarber(barberId, DayPilotNavigator1.VisibleStart, DayPilotNavigator1.VisibleEnd);
        }

        private DataTable LoadAppointmentsForBarber(int barberId, DateTime start, DateTime end)
        {
            queryStr = "SELECT * FROM appointment WHERE barberID = ?barber AND NOT ((appointment_end <= ?start) OR (appointment_start >= ?end))";

            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString());
            conn.Open();

            cmd = new MySqlCommand(queryStr, conn)
            {
                CommandType = CommandType.Text
            };

            cmd.Parameters.AddWithValue("?barber", barberId);
            cmd.Parameters.AddWithValue("?start", start);
            cmd.Parameters.AddWithValue("?end", end);

            DataTable dataTable = new DataTable();
            using (MySqlDataAdapter sqlDataAdapter = new MySqlDataAdapter(cmd))
            {
                sqlDataAdapter.Fill(dataTable);
            }

            conn.Close();

            return dataTable;
        }

        private int CreateAppointment(int barberId, DateTime start, DateTime end)
        {
            queryStr = "INSERT INTO appointment (appointment_start, appointment_end, barberID) VALUES(?start, ?end, ?barber)";

            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString());
            conn.Open();

            cmd = new MySqlCommand(queryStr, conn)
            {
                CommandType = CommandType.Text
            };

            cmd.Parameters.AddWithValue("?start", start);
            cmd.Parameters.AddWithValue("?end", end);
            cmd.Parameters.AddWithValue("?barber", barberId);
            cmd.ExecuteNonQuery();

            cmd = new MySqlCommand("select @@identity;", conn);
            int id = Convert.ToInt32(cmd.ExecuteScalar());

            conn.Close();

            return id;
        }

        private void MoveAppointment(string appointmentId, DateTime start, DateTime end)
        {
            queryStr = "UPDATE appointment SET appointment_start = ?start, appointment_end = ?end WHERE appointmentID = ?id";

            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString());
            conn.Open();

            cmd = new MySqlCommand(queryStr, conn)
            {
                CommandType = CommandType.Text
            };

            cmd.Parameters.AddWithValue("?start", start);
            cmd.Parameters.AddWithValue("?end", end);
            cmd.Parameters.AddWithValue("?id", appointmentId);

            cmd.ExecuteNonQuery();

            conn.Close();
        }

        private DataRow LoadBarber(int barberId)
        {
            MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter("SELECT * FROM barber WHERE barberID = ?id", ConfigurationManager.ConnectionStrings["WebAppConnString"].ConnectionString);
            mySqlDataAdapter.SelectCommand.Parameters.AddWithValue("id", barberId);

            DataTable dataTable = new DataTable();
            mySqlDataAdapter.Fill(dataTable);

            if (dataTable.Rows.Count > 0)
            {
                // barberID is unique, so there will only be 1 row in the dataTable
                return dataTable.Rows[0];
            }

            return null;

        }
    }

}