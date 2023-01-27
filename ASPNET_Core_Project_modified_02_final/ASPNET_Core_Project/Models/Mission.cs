using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASPNET_Core_Project.Models
{
    public class Mission
    {
        public Mission()
        {
            this.MissionSoldierEntries = new List<MissionSoldierEntry>();
            
        }
        public int MissionId { get; set; }

        [Required]
        [StringLength(30)]
        public string Location { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime StartDate { get; set; }

        [Column(TypeName ="money")]
        public decimal Budget { get; set; }

        [StringLength(200)]
        public string Description { get; set; }

        [Display(Name ="Image")]
        public string ImagePath { get; set; }

        [Column(TypeName ="bit")]
        [Display(Name ="Active?")]
        public bool IsActive { get; set; }
        public virtual ICollection<MissionSoldierEntry> MissionSoldierEntries { get; set; }

    }
}
