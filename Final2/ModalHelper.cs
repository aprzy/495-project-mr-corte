using System.Text;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace Final2
{
    public static class ModalHelper
    {
        public static void Close(Page page)
        {
            Close(page, null);
        }

        public static void Close(Page page, object result)
        {
            // register the script on the client page
            page.ClientScript.RegisterStartupScript(typeof(Page), "close", BuildScript(result));
        }

        // build javascript script string that closes the current modal dialog after script execution
        public static string BuildScript(object result)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("if (parent && parent.DayPilot && parent.DayPilot.ModalStatic) {");
            sb.Append("parent.DayPilot.ModalStatic.close(" + new JavaScriptSerializer().Serialize(result) + ");");
            sb.Append("}");
            sb.Append("</script>");

            return sb.ToString();
        }
    }
}