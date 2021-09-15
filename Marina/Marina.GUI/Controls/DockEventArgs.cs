using Marina.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Marina.GUI.Controls
{
    // Arguments for dock selection event
    public class DockEventArgs
    {
        // Public properties from Dock
        public string ID { get; set; }
        public string Name { get; set; }
        public string WaterService { get; set; }
        public string ElectricalService { get; set; }

    }
}