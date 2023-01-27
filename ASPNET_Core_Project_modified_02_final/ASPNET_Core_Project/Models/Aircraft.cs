using System.Collections;
using System.Collections.Generic;

namespace ASPNET_Core_Project.Models
{
    public class Aircraft
    {
        public Aircraft()
        {
            this.MissionAircraftEntries = new List<MissionAircraftEntry>();
            //this.MissionEntries = new List<MissionEntry>();
        }
        public int AircraftId { get; set; }
        public string Code { get; set; }
        public string ImagePath { get; set; }
        public virtual ICollection<MissionAircraftEntry> MissionAircraftEntries { get; set; }
        //public ICollection<MissionEntry> MissionEntries { get; set; }
    }
}
