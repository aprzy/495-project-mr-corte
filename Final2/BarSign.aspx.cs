using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final2
{
    public partial class BarSign : System.Web.UI.Page
    {

        MySql.Data.MySqlClient.MySqlConnection conn;

        MySql.Data.MySqlClient.MySqlCommand cmd;

        string queryString;

        string queryStr;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void barberRegisterEventMethod(object sender, EventArgs e)
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();

            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();

            queryString = "INSERT INTO webapp.barber (barber_first_name, barber_last_name, barber_username, barber_email, barber_phone, barber_slowHashSalt, barber_SIN, validated)" +
                "VALUE(?firstname, ?lastname, ?uname, ?email, ?phone, ?slowHashSalt, ?SIN, ?validated)";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryString, conn);
            cmd.Parameters.AddWithValue("?firstname", tb_barbFirstName.Text);
            cmd.Parameters.AddWithValue("?lastname", tb_barbLastName.Text);
            cmd.Parameters.AddWithValue("?uname", tb_barbUsername.Text);
            cmd.Parameters.AddWithValue("?email", tb_barbEmail.Text);
            cmd.Parameters.AddWithValue("?phone", tb_barbPhone.Text);
            cmd.Parameters.AddWithValue("?SIN", tb_barbSIN.Text);
            cmd.Parameters.AddWithValue("?validated", "No");

            string saltHashReturned = PasswordStorage.CreateHash(tb_barbPassword.Text);
            int commaIndex = saltHashReturned.IndexOf(":");
            string extractedString = saltHashReturned.Substring(0, commaIndex);
            commaIndex = saltHashReturned.IndexOf(":");
            extractedString = saltHashReturned.Substring(commaIndex + 1);
            commaIndex = extractedString.IndexOf(":");
            string salt = extractedString.Substring(0, commaIndex);

            commaIndex = extractedString.IndexOf(":");
            extractedString = extractedString.Substring(commaIndex + 1);
            string hash = extractedString;

            cmd.Parameters.AddWithValue("?slowHashSalt", saltHashReturned);

            cmd.ExecuteReader();
            Response.Redirect("BarLog.aspx", false);
            conn.Close();
        }
    }
}