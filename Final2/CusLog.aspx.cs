using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final2
{
    public partial class CusLog : System.Web.UI.Page
    {
        /*Contains the connection string to connect to the database */
        MySql.Data.MySqlClient.MySqlConnection conn;

        /*Contains the connection within its instanitiation and the query parameter */
        MySql.Data.MySqlClient.MySqlCommand cmd;

        /*Read data from the MySQL database*/
        MySql.Data.MySqlClient.MySqlDataReader reader;

        string queryStr;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitEventMethod(object sender, EventArgs e)
        {
            List<String> saltHashList = null;
            List<String> namesList = null;
            try
            {
                String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();

                conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
                conn.Open();
                queryStr = "SELECT customerID, slowHashSalt, cust_first_name, cust_last_name FROM webapp.customer WHERE cust_username=?uname";

                cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                cmd.Parameters.AddWithValue("?uname", tb_username.Text);
                reader = cmd.ExecuteReader();

                if (!reader.HasRows)
                {
                    lb_invalid.Text = "Wrong username and/or password";
                }

                while (reader.HasRows && reader.Read())
                {
                    if (saltHashList == null)
                    {
                        saltHashList = new List<String>();
                        namesList = new List<String>();
                    }

                    String saltHashes = reader.GetString(reader.GetOrdinal("slowHashSalt"));
                    saltHashList.Add(saltHashes);

                    String fullName = reader.GetString(reader.GetOrdinal("cust_first_name")) + " " + reader.GetString(reader.GetOrdinal("cust_last_name"));
                    namesList.Add(fullName);

                }

                if (saltHashList != null)
                {
                    for (int i = 0; i < saltHashList.Count; i++)
                    {
                        queryStr = "";
                        bool validUser = PasswordStorage.VerifyPassword(tb_password.Text, saltHashList[i]);
                        if (validUser == true)
                        {
                            int customerId = reader.GetInt32(reader.GetOrdinal("customerID"));
                            Session["uname"] = namesList[i];
                            Response.BufferOutput = true;
                            Response.Redirect($"CustomerManageBooking.aspx?customerId={customerId}&barberId=0", false);
                        }
                        else
                        {
                            lb_invalid.Text = "Wrong username and/or password";
                        }
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