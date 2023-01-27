using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace ASPNET_Core_Project.Models
{
    public class Rank
    {
        public Rank()
        {
            this.Soldiers = new List<Soldier>();
        }
        public int RankId { get; set; }

        [Required]
        [StringLength(30)]
        [Display(Name = "Rank")]
        public string RankName { get; set; }
        public ICollection<Soldier> Soldiers { get; set; }
    }
}
