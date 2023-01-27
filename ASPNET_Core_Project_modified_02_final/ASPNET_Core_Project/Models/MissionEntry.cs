using System.ComponentModel.DataAnnotations.Schema;
using System.Reflection;

namespace ASPNET_Core_Project.Models
{
    public class MissionEntry
    {
        public int MissionEntryId { get; set; }

        //[ForeignKey("Mission")]
        //public int MissionId { get; set; }

        [ForeignKey("Soldier")]
        public int SoldierId { get; set; }

        //[ForeignKey("Aircraft")]
        //public int AircraftId { get; set; }

        [ForeignKey("MissionAircraftEntry")]
        public int MissionAircraftEntryId { get; set; }

        //public virtual Aircraft Aircraft { get; set; }
        public virtual Soldier Soldier { get; set; }
        //public virtual Mission Mission { get; set; }
        public virtual MissionAircraftEntry MissionAircraftEntry { get; set; }
    }
}
