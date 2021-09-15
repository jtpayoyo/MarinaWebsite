using Marina.Data;
using Marina.GUI.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Marina.GUI.Secure
{
    public partial class LeaseSlip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Subscribe to the event
            DockSelector.DockSelect += DockSelector_DockSelect;
        }

        private void DockSelector_DockSelect(object sender, DockEventArgs e)
        {
            // Change labels for dock info table
            lblDockId.Text = e.ID;
            lblName.Text = e.Name;
            lblWaterService.Text = e.WaterService;
            lblElectricalService.Text = e.ElectricalService;
            //gvAvailableSlips.DataSource = e.ListAvailableSlips;
            //gvAvailableSlips.DataBind();
        }

        // Add radio buttons as rows are added
        protected void gvAvailableSlips_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                // Reference the literal control
                Literal output = (Literal)e.Row.FindControl("RadioButtonMarkup");
                // Output markup except for the "checked" attribute
                output.Text = string.Format(
                    @"<input type ='radio' name='SlipsGroup' " +
                    @"id = 'RowSelector{0}' value = '{0}' />", e.Row.RowIndex);                   
            }
        }

        // Gets selected index of currently selected slip
        private int SlipSelectedIndex
        {
            get
            {
                // If no selection, it is -1
                if (string.IsNullOrEmpty(Request.Form["SlipsGroup"]))
                    return -1;
                // If there is a selection give index
                else
                    return Convert.ToInt32(Request.Form["SlipsGroup"]);
            }
        }

        // Gets selected value of currently selected slip
        public int GetSelectedSlip()
        {
            int selectedIndex = SlipSelectedIndex;
            int dockID = Convert.ToInt32(Session["SelectedDock"]);
            List<Slip> lstSlips = MarinaManager.GetAvailableSlipsByDock(dockID);

            Slip selectedSlip = lstSlips[selectedIndex];
            int slipID = selectedSlip.ID;

            return slipID;
        }

        // Lease the selected slip
        protected void btnLease_Click(object sender, EventArgs e)
        {
            // No slip selected
            if(SlipSelectedIndex == -1)
            {
                lblMessage.Text = "Please select a slip to lease.";
            }
            // A slip has been selected
            else
            {
                int slipID = GetSelectedSlip();
                int custID = Convert.ToInt32(Session["CustomerID"]);

                // Add to the database
                MarinaManager.AddToLease(slipID, custID);
                Response.Redirect("~/Secure/MyProfile");
            }
        }
    } // End of class
} // End of namespace