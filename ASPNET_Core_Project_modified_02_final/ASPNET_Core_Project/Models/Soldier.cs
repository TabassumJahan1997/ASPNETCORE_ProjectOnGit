using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace ASPNET_Core_Project.Models
{
    public class Soldier
    {
        public Soldier()
        {
            this.MissionSoldierEntries = new List<MissionSoldierEntry>();
        }
        public int SoldierId { get; set; }

        [Required]
        [StringLength(30)]
        [Display(Name = "Name of Soldier")]
        public string SoldierName { get; set; }

        [Display(Name = "Rank")]
        [ForeignKey("Rank")]
        public int RankId { get; set; }
        public int Age { get; set; }
        public virtual SoldierImage SoldierImage { get; set; }
        public virtual Rank Rank { get; set; }
        //public ICollection<MissionEntry> MissionEntries { get; set; }
        public virtual ICollection<MissionSoldierEntry> MissionSoldierEntries { get; set; }
    }
}
