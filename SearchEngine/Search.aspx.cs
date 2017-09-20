using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SearchEngine
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Cookies["article"].Value = Server.UrlEncode(TextBox1.Text);
            Response.Cookies["article"].Expires = DateTime.Now.AddDays(1);
            Response.Cookies["keyword"].Value = Server.UrlEncode(TextBox2.Text);
            Response.Cookies["keyword"].Expires = DateTime.Now.AddDays(1);
            Response.Redirect("Search.aspx");
        }
    }
}