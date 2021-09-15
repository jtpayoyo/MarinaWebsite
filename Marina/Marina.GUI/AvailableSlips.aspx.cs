using Marina.Data;
using Marina.GUI.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Marina.GUI
{
    public partial class AvailableSlips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Subscribe to the event
            DockSelector.DockSelect += DockSelector_DockSelect;
        }

        // Method to handle the event DockSelect
        private void DockSelector_DockSelect(object sender, DockEventArgs e)
        {
            // Change labels for dock info table
            lblDockId.Text = e.ID;
            lblName.Text = e.Name;
            lblWaterService.Text = e.WaterService;
            lblElectricalService.Text = e.ElectricalService;
        }

    } // End of class
} // End of namespace