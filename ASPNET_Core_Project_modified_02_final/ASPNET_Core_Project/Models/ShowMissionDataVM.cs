using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;
using System;

namespace ASPNET_Core_Project.Models
{
    public class ShowMissionDataVM
    {
        public int MissionId { get; set; }

        [Required]
        [StringLength(30)]
        public string Location { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime StartDate { get; set; }

        [Column(TypeName = "money")]
        public decimal Budget { get; set; }

        [StringLength(200)]
        public string Description { get; set; }

        [Column(TypeName = "bit")]
        [Display(Name = "Active?")]
        public bool IsActive { get; set; }

        public int MissionAircraftEntryId { get; set; }

        [ForeignKey("Aircraft")]
        public int AircraftId { get; set; }

        public int MissionSoldierEntryId { get; set; }

        [ForeignKey("Soldier")]
        public int SoldierId { get; set; }
        public List<MissionSoldierEntry> SoldierEntries { get; set; }
        public List<MissionAircraftEntry> AircraftEntries { get; set; }
    }
}
