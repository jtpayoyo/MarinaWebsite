using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marina.Data
{
    /// <summary>
    /// Repository of methods accessing and manipulating all data from the marina database
    /// </summary>
    public static class MarinaManager
    {
        // ----------------- AUTHENTICATION -----------------
        // Authenticate user credentials
        public static CustomerDTO Authenticate (string user, string pass)
        {
            // Create objects
            CustomerDTO dto = null;
            MarinaEntities db = new MarinaEntities();
            
            // Searches for matching credentials
            Authentication auth = db.Authentications
                .SingleOrDefault(a => a.Username == user &&
                                      a.Password == pass);

            // If found, designates dto object
            if (auth != null)
            {
                dto = new CustomerDTO
                {
                    ID = auth.Customer.ID,
                    FullName = auth.Customer.FirstName + " " + auth.Customer.LastName
                };
            }

            return dto;
        }

        // Register new customer and authentication
        public static void RegisterCustomer(Authentication auth)
        {
            // Add to the database and save
            MarinaEntities db = new MarinaEntities();
            db.Authentications.Add(auth);
            db.SaveChanges();
        }

        // ----------------- DOCKS -----------------
        // Get dock given dock ID
        public static Dock GetDock(int dockID)
        {
            MarinaEntities db = new MarinaEntities();
            Dock dock = db.Docks.SingleOrDefault(d => d.ID == dockID);

            return dock;
        }

        // Get list of all docks
        public static List<Dock> GetDocks()
        {
            MarinaEntities db = new MarinaEntities();
            List<Dock> docks = db.Docks.ToList();

            return docks;
        }

        // Get IList of docks
        public static IList GetDocksAsIList()
        {
            MarinaEntities db = new MarinaEntities();
            var docks = db.Docks
                           .Select(d => new {
                               ID = d.ID,
                               Name = d.Name,
                               Water = d.WaterService,
                               Electric = d.ElectricalService
                           })
                           .ToList();

            return docks;
        }

        // ----------------- LEASES -----------------

        // Get list of all leases of all customers
        public static List<Lease> GetLeases()
        {
            MarinaEntities db = new MarinaEntities();
            List<Lease> leases = db.Leases.ToList();

            return leases;
        }

        // Get list of all leases for one customer
        public static IList GetLeasesPerCustomer(int custID)
        {
            MarinaEntities db = new MarinaEntities();
            var leases = db.Leases
                            .Join(db.Slips,
                                    l => l.SlipID,
                                    s => s.ID,
                                    (l,s) => new { l.CustomerID, l.SlipID, s.Width, s.Length, s.DockID })
                            .Where(l => l.CustomerID == custID)
                            .ToList();

            return leases;
        }

        // Add to lease table
        public static void AddToLease(int slipID, int custID)
        {
            MarinaEntities db = new MarinaEntities();
            Lease newLease = new Lease
            {
                SlipID = slipID,
                CustomerID = custID
            };
            db.Leases.Add(newLease);
            db.SaveChanges();
        }

        // ----------------- CUSTOMERS -----------------

        // Get list of all customers
        public static List<Customer> GetCustomers()
        {
            MarinaEntities db = new MarinaEntities();
            List<Customer> customers = db.Customers.ToList();

            return customers;
        }

        // Get customer object with customer id
        public static Customer GetCustomer(int custID)
        {
            MarinaEntities db = new MarinaEntities();
            Customer customer = db.Customers.SingleOrDefault(c => c.ID == custID);

            return customer;
        }

        // ----------------- SLIPS -----------------

        // Get list of all slips
        public static List<Slip> GetSlips()
        {
            MarinaEntities db = new MarinaEntities();
            List<Slip> slips = db.Slips.ToList();

            return slips;
        }

        // Get list of all available slips
        public static List<Slip> GetAvailableSlips()
        {
            List<Slip> slips = GetSlips();
            List<Lease> leases = GetLeases();
            List<Slip> availSlips = new List<Slip>();            

            // Outer join with exclusion       
            var query = from s in slips
                        join l in leases on s.ID equals l.SlipID into sl
                        from l in sl.DefaultIfEmpty()
                        where l == null
                        select new {s.ID};            

            // Convert var to slip list
            foreach(var item in query)
            {
                availSlips.Add(GetSlip(item.ID));
            }

            return availSlips;
        }

        // Get list of available slips per dock
        public static List<Slip> GetAvailableSlipsByDock(int selectedDockID)
        {
            List<Slip> availSlips = GetAvailableSlips();
            List<Slip> availSlipsByDock = new List<Slip>();

            // Filter through available slips by dock
            foreach(Slip s in availSlips)
            {
                if (s.DockID == selectedDockID)
                    availSlipsByDock.Add(s);
            }

            return availSlipsByDock;
        }

        // Get slip object given ID
        public static Slip GetSlip(int slipID)
        {
            MarinaEntities db = new MarinaEntities();
            Slip mySlip = db.Slips.Find(slipID);

            return mySlip;
        }

        // Get list of slips given customer ID
        public static IList GetLeasedSlips(int custID)
        {
            MarinaEntities db = new MarinaEntities();
            var leases = db.Leases
                           .Where(l => l.CustomerID == custID)
                           .Select(l => new { ID = l.ID, SlipID = l.SlipID, 
                                              CustomerID = l.CustomerID })
                           .ToList();

            return leases;                        
        }

    } // End of class
} // End of namespace
