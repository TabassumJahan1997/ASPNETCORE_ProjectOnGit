using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ASPNET_Core_Project.Models
{
    public class SoldierImage
    {
        [Key]
        [ForeignKey("Soldier")]
        public int SoldierId { get; set; }
        public string ImagePath { get; set; }
        public virtual Soldier Soldier { get; set; }
    }
}
