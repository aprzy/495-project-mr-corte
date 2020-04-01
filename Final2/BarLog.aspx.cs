using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final2
{
    public partial class BarLog : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection conn;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        MySql.Data.MySqlClient.MySqlDataReader reader;

        string queryStr;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitEventMethod(object sender, EventArgs e)
        {
            List<string> saltHashList = null;
            List<string> nameList = null;

            /* is used to make a checkpoint */
            bool isLoggedIn = false;
            try
            {
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();

                conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
                conn.Open();
                queryStr = "SELECT barberID, barber_slowHashSalt, barber_first_name, barber_last_name, barber_username, validated from webapp.barber " +
                    "WHERE barber_username =?uname";

                cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                cmd.Parameters.AddWithValue("?uname", tb_BarberUname.Text.Trim());
                reader = cmd.ExecuteReader();

                if (!reader.HasRows)
                {
                    lb_invalid.Text = "Wrong username and/or password";
                }

                while (reader.HasRows && reader.Read())
                {
                    if (saltHashList == null)
                    {
                        saltHashList = new List<string>();
                        nameList = new List<string>();
                    }

                    string saltHashes = reader.GetString(reader.GetOrdinal("barber_slowHashSalt"));
                    saltHashList.Add(saltHashes);

                    string fullName = reader.GetString(reader.GetOrdinal("barber_first_name")) + " " + reader.GetString(reader.GetOrdinal("barber_last_name"));
                    nameList.Add(fullName);

                }

                if (saltHashList != null)
                {
                    for (int i = 0; i < saltHashList.Count; i++)
                    {
                        queryStr = "";
                        bool validUser = PasswordStorage.VerifyPassword(tb_BarberPass.Text, saltHashList[i]);
                        if (validUser == true)
                        {
                            Session["uname"] = nameList[i];
                            isLoggedIn = true;
                        }
                        else
                        {
                            lb_invalid.Text = "Wrong username and/or password";
                        }
                    }
                }

                if (isLoggedIn)
                {
                    /* check validated column */
                    string isValidated = reader.GetString(reader.GetOrdinal("validated"));
                    if (isValidated == "No")
                    {
                        lb_invalid.Text = "Account is not validated, please contact administrator";
                    }
                    else
                    {
                        // barber is logged in & validated
                        int barberId = reader.GetInt32(reader.GetOrdinal("barberID"));
                        Response.BufferOutput = true;
                        Response.Redirect("BarberManageBooking.aspx?id=" + barberId, false);
                    }
                }

                reader.Close();
            }
            catch (Exception ex)
            {
                lb_invalid.Text = ex.ToString();
            }
        }
    }
}