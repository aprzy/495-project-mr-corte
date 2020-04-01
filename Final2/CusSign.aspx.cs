using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final2
{
    public partial class CusSign : System.Web.UI.Page
    {
        /*Contains the connection string to connect to the database */
        MySql.Data.MySqlClient.MySqlConnection conn;

        /*Contains the connection within its instanitiation and the query parameter or sum shit  */
        MySql.Data.MySqlClient.MySqlCommand cmd;

        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();

        string queryStr;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerEventMethod(object sender, EventArgs e)
        {
            bool methodStatus = true;
            if (methodStatus == true)
            {


                conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
                conn.Open();
                

                queryStr = "INSERT INTO webapp.customer (cust_first_name, cust_last_name, cust_username, cust_email, cust_phone, slowHashSalt)" +
                    "Values(?Firstname, ?lastname, ?uname, ?email, ?phone, ?slowHashSalt)";


                cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                cmd.Parameters.AddWithValue("?firstname", tb_firstname.Text);
                cmd.Parameters.AddWithValue("?lastname", tb_lastname.Text);
                cmd.Parameters.AddWithValue("?uname", tb_username.Text);
                cmd.Parameters.AddWithValue("?email", tb_email.Text);
                cmd.Parameters.AddWithValue("?phone", tb_phone.Text);


                /* from first : to second : is the salt  */
                /* from second : to the end is the hash */
                string saltHashReturned = PasswordStorage.CreateHash(tb_password.Text);
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
                conn.Close();

            }

        }
    }
}