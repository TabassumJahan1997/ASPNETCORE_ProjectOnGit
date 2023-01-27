using Microsoft.CodeAnalysis.CSharp.Syntax;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASPNET_Core_Project.Models
{
    public class MissionAircraftEntry
    {
        //public MissionAircraftEntry()
        //{
        //    this.MissionEntries = new List<MissionEntry>();
        //}
        public int MissionAircraftEntryId { get; set; }

        [ForeignKey("Mission")]
        public int MissionId { get; set; }

        [ForeignKey("Aircraft")]
        public int AircraftId { get; set; }
        public virtual  Mission Mission { get; set; }
        public virtual Aircraft Aircraft { get; set; }
        //public virtual ICollection<MissionEntry> MissionEntries { get; set; }
    }
}
