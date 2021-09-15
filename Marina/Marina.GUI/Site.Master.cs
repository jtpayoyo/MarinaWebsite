using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Marina.GUI
{
    public partial class SiteMaster : MasterPage
    {
        // Change look of navbar if logged in/out on page load 
        protected void Page_Load(object sender, EventArgs e)
        {
            // Logged in
            if (Context.User.Identity.IsAuthenticated)
            {
                uxWelcome.InnerText = $"Welcome {Context.User.Identity.Name}";
                uxLogin.InnerHtml = "<span class='fa fa-sign-out-alt'></span>";
            }
            // Not logged in
            else
            {
                uxWelcome.InnerText = "";
                uxLogin.InnerHtml = "<span class='fa fa-sign-in-alt'></span>";
            }

        } // End of page load

        // Handles uxLogin click
        protected void HandleLoginClick(object sender, EventArgs e)
        {
            // They are logged in, so log them out
            if (Context.User.Identity.IsAuthenticated)
            {
                // Sign out, clear session, return to homepage
                FormsAuthentication.SignOut();
                Session.Clear();
                Response.Redirect("~/");
            }
            // Let them log in
            else
            {
                Response.Redirect("~/Login");
            }

        } // End of HandleLoginClick


    } // End of class
} // End of namespace