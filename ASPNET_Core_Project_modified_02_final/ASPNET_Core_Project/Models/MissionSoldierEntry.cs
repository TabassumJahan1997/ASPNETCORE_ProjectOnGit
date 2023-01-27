using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASPNET_Core_Project.Models
{
    public class MissionSoldierEntry
    {
        public int MissionSoldierEntryId { get; set; }

        [ForeignKey("Mission")]
        public int MissionId { get; set; }

        [ForeignKey("Soldier")]
        public int SoldierId { get; set; }
        public virtual Mission Mission { get; set; }
        public virtual Soldier Soldier { get; set; }
    }
}
