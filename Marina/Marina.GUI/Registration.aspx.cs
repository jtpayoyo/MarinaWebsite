using Marina.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Marina.GUI
{
    public partial class Registration : System.Web.UI.Page
    {
        // Page load event
        protected void Page_Load(object sender, EventArgs e)
        {
            // Turn off unobstrusive validation
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        // Register a new user
        protected void uxRegistration_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            // Create new authentication and customer objects
            Authentication auth = new Authentication
            {
                Username = txtUsername.Text,
                Password = txtPassword.Text,
                Customer = new Customer
                {
                    FirstName = txtFirstName.Text,
                    LastName = txtLastName.Text,
                    Phone = txtPhone.Text,
                    City = txtCity.Text
                }
            };

            // Add to the database
            MarinaManager.RegisterCustomer(auth);

            // Redirect to the login page
            Response.Redirect("~/Login");

        } // End of finish button click

    } // End of class
} // End of namespace