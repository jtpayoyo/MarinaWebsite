using Marina.Data;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Marina.GUI.Secure
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the customer object using the ID
            int custID = Convert.ToInt32(Session["CustomerID"]);
            Customer customer = MarinaManager.GetCustomer(custID);

            // Fill customer information
            lblCustomerID.Text = customer.ID.ToString();
            lblFirstName.Text = customer.FirstName;
            lblLastName.Text = customer.LastName;
            lblPhone.Text = customer.Phone;
            lblCity.Text = customer.City;
        }

        // Redirect to LeaseSlip page
        protected void btnLeaseSlips_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Secure/LeaseSlip");
        }
    } // End of class
} // End of namespace