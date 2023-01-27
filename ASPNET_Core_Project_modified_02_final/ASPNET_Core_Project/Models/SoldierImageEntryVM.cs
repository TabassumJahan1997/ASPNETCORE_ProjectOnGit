using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;
using Microsoft.AspNetCore.Http;

namespace ASPNET_Core_Project.Models
{
    public class SoldierImageEntryVM
    {
        public int SoldierId { get; set; }

        [Required]
        [StringLength(30)]
        [Display(Name = "Name of Soldier")]
        public string SoldierName { get; set; }

        [Display(Name = "Rank")]
        [ForeignKey("Rank")]
        public int RankId { get; set; }
        public string RankName { get; set; }
        public int Age { get; set; }
        public virtual Rank Rank { get; set; }
        public string ImagePath { get; set; }
        public IFormFile  ImageFile { get; set; }
    }
}
