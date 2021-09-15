using Marina.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Marina.GUI.Controls
{
    public partial class DockSelector : System.Web.UI.UserControl
    {
        // Declare event
        public event DockSelectionHandler DockSelect;

        // Public properties
        public Dock SelectedDock { get; set; }

        // Gives access to AutoPostBack property of the inner drop down list
        public bool AllowAutoPostBack
        {
            get { return ddlDocks.AutoPostBack;  }
            set { ddlDocks.AutoPostBack = value; }
        }

        // Populate the drop down list on page load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlDocks.DataSource = MarinaManager.GetDocksAsIList();
                ddlDocks.DataValueField = "ID";
                ddlDocks.DataTextField = "ID";
                ddlDocks.DataBind();
                // Set a default value
                ddlDocks.SelectedIndex = 0;
                ddlDocks_SelectedIndexChanged(this, e);
            }
        }

        protected void ddlDocks_SelectedIndexChanged(object sender, EventArgs e)
        {
            // The event was subscribed to
            if (DockSelect!= null)
            {
                // Get id from drop down list
                int dockID = Convert.ToInt32(ddlDocks.SelectedValue);
                    
                // Add to the session
                Session["SelectedDock"] = dockID;    

                // Get the dock object
                Dock dock = MarinaManager.GetDock(dockID);                    

                // Set SelectedDock property
                SelectedDock = dock;

                // Fill DockEventArgs class
                DockEventArgs arg = new DockEventArgs
                {
                    ID = dock.ID.ToString(),
                    Name = dock.Name,
                    WaterService = BoolToString(dock.WaterService),
                    ElectricalService = BoolToString(dock.ElectricalService),
                };
                    
                // Invoke the event
                DockSelect.Invoke(this, arg);    
            }
        } // End of SelectedIndexChanged

        // Convert the bool to yes or no string
        private string BoolToString(bool myBool)
        {
            string myString;

            if (myBool)
                myString = "yes";
            else
                myString = "no";

            return myString;
        }


    } // End of class
} // End of namespace