using System;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Web;
using MySql.Data.MySqlClient;

namespace Final2
{
    public partial class Request : System.Web.UI.Page
    {
        private DataRow dataRow;

        private string queryStr;

        private MySqlConnection conn;

        private MySqlCommand cmd;

        private string customerIdSessionStr = "customerId";

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            // id is appointmentID
            dataRow = LoadAppointment(Convert.ToInt32(Request.QueryString["id"]));

            if (dataRow == null)
            {
                throw new Exception("The appointment was not found");
            }

            if (!IsPostBack)
            {
                // get customerId from the parent query string (url referer query string)
                int customerId = Convert.ToInt32(HttpUtility.ParseQueryString(Request.UrlReferrer.Query)["customerId"]);

                // save customerId to Session
                Session[customerIdSessionStr] = customerId;

                // need to get customer details from customer table to fill in appointment record
                DataRow customerRecord = LoadCustomerData(customerId);

                // use CultureInfo.InvariantCulture, ignore culture-specific conversion
                TextBoxStart.Text = Convert.ToDateTime(dataRow["appointment_start"]).ToString(CultureInfo.InvariantCulture);
                TextBoxEnd.Text = Convert.ToDateTime(dataRow["appointment_end"]).ToString(CultureInfo.InvariantCulture);

                // if customer_name column from appointment record is empty, use customer's data to fill TextBoxName
                if (string.IsNullOrEmpty(dataRow["customer_name"].ToString()))
                {
                    string customerName = $"{customerRecord["cust_first_name"]} {customerRecord["cust_last_name"]}";

                    TextBoxName.Text = customerName;
                }
                else
                {
                    // if customer_name column of appointment record is populated, then use it for TextBoxName
                    TextBoxName.Text = dataRow["customer_name"] as string;
                }

                // only display customer name, don't allow modification
                TextBoxName.Enabled = false;
            }
        }

        protected void ButtonOK_Click(object sender, EventArgs e)
        {
            int appointmentId = Convert.ToInt32(Request.QueryString["id"]);

            // retrieve customerId from session value
            int customerId = Convert.ToInt32(Session[customerIdSessionStr].ToString());

            DataRow customerRecord = LoadCustomerData(customerId);
            string customerName = $"{customerRecord["cust_first_name"]} {customerRecord["cust_last_name"]}";

            RequestAppointment(appointmentId, customerName, customerId);

            ModalHelper.Close(this, "OK");
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            ModalHelper.Close(this);
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

        private void RequestAppointment(int appointmentId, string customerName, int customerId)
        {
            queryStr = "UPDATE appointment " +
                        "SET customer_name = ?name, appointment_status = ?status, customerID = ?customerId " +
                        "WHERE appointmentID = ?id";

            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["WebAppConnString"].ConnectionString);
            conn.Open();

            cmd = new MySqlCommand(queryStr, conn)
            {
                CommandType = CommandType.Text
            };

            cmd.Parameters.AddWithValue("name", customerName);
            cmd.Parameters.AddWithValue("status", "waiting");
            cmd.Parameters.AddWithValue("customerId", customerId);
            cmd.Parameters.AddWithValue("id", appointmentId);

            cmd.ExecuteNonQuery();

            conn.Close();
        }

        private DataRow LoadCustomerData(int customerId)
        {
            queryStr = "SELECT * FROM customer WHERE customerID = ?customerId";

            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString());
            conn.Open();

            MySqlDataAdapter sqlDataAdapter = new MySqlDataAdapter(queryStr, conn);
            sqlDataAdapter.SelectCommand.Parameters.AddWithValue("customerId", customerId);

            DataTable datable = new DataTable();

            sqlDataAdapter.Fill(datable);

            conn.Close();

            return datable.Rows[0];
        }
    }
}