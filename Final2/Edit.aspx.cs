using System;
using System.Configuration;
using System.Data;
using System.Web;
using MySql.Data.MySqlClient;

namespace Final2
{
    public partial class Edit : System.Web.UI.Page
    {
        // the data row of the selected appointment
        private DataRow dataRow;

        private string queryStr;

        private MySqlConnection conn;

        private MySqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            // id is appointmentID
            dataRow = LoadAppointment(Convert.ToInt32(Request.QueryString["id"]));

            if (dataRow == null)
            {
                throw new Exception("The requested appointment was not found");
            }

            if (!IsPostBack)
            {
                TextBoxStart.Text = Convert.ToDateTime(dataRow["appointment_start"]).ToString();
                TextBoxEnd.Text = Convert.ToDateTime(dataRow["appointment_end"]).ToString();
                TextBoxName.Text = dataRow["customer_name"] as string;
                DropDownListStatus.SelectedValue = (string)dataRow["appointment_status"];

                TextBoxName.Focus();
            }
        }

        protected void ButtonOK_Click(object sender, EventArgs e)
        {
            DateTime start = (DateTime)dataRow["appointment_start"];
            DateTime end = (DateTime)dataRow["appointment_end"];
            int barber = (int)dataRow["barberID"];

            string customerName = TextBoxName.Text;
            string status = DropDownListStatus.SelectedValue;

            int appointmentId = Convert.ToInt32(Request.QueryString["id"]);

            UpdateAppointment(appointmentId, start, end, customerName, status);
            ModalHelper.Close(this, "OK");
        }


        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            ModalHelper.Close(this);
        }
        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            DeleteAppointment(id);
            ModalHelper.Close(this, "OK");
        }

        private DataRow LoadAppointment(int appointmentId)
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SELECT * FROM appointment WHERE appointmentID = ?id", ConfigurationManager.ConnectionStrings["WebAppConnString"].ConnectionString);
            dataAdapter.SelectCommand.Parameters.AddWithValue("?id", appointmentId);

            DataTable dt = new DataTable();
            dataAdapter.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }
            return null;
        }

        private void UpdateAppointment(int appointmentId, DateTime start, DateTime end, string name, string status)
        {
            queryStr = "UPDATE appointment SET appointment_start = ?start, appointment_end = ?end, customer_name = ?name, appointment_status = @status WHERE appointmentID = ?id";

            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString());
            conn.Open();

            cmd = new MySqlCommand(queryStr, conn)
            {
                CommandType = CommandType.Text
            };

            cmd.Parameters.AddWithValue("?start", start);
            cmd.Parameters.AddWithValue("?end", end);
            cmd.Parameters.AddWithValue("?name", name);
            cmd.Parameters.AddWithValue("?status", status);
            cmd.Parameters.AddWithValue("?id", appointmentId);

            cmd.ExecuteNonQuery();

            conn.Close();
        }

        private void DeleteAppointment(int appointmentId)
        {
            queryStr = "DELETE FROM appointment WHERE appointmentID = @id";

            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString());
            conn.Open();

            cmd = new MySqlCommand(queryStr, conn)
            {
                CommandType = CommandType.Text
            };

            cmd.Parameters.AddWithValue("?id", appointmentId);

            cmd.ExecuteNonQuery();

            conn.Close();
        }
    }
}