using Marina.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Marina.GUI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // User tries to sign in
        protected void btnAuthenticate_Click(object sender, EventArgs e)
        {
            // Gets info from form
            CustomerDTO customer = MarinaManager.Authenticate(txtUsername.Text, txtPassword.Text);

            // Failed authentication
            if(customer == null)
            {
                lblMessage.Text = "Invalid login credentials. Try again.";
                txtUsername.Text = "";
                txtPassword.Text = "";
                txtUsername.Focus();
            }
            // Successful authentication
            else
            {
                // Add customer ID to session
                Session.Add("CustomerID",customer.ID);
                // Redirect to previous page
                FormsAuthentication.RedirectFromLoginPage(customer.FullName, false);
            }
        } // End of authenticate

    } // End of class
} // End of namespace