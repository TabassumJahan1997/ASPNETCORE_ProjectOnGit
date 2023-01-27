﻿using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;
using System;
using Microsoft.AspNetCore.Http;

namespace ASPNET_Core_Project.Models
{
    public class MissionSoldierEntryVM
    {
        public MissionSoldierEntryVM()
        {
            this.SoldierList = new List<int>();
        }
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
        public string ImagePath { get; set; }
        public IFormFile ImageFile { get; set; }

        [Column(TypeName = "bit")]
        [Display(Name = "Active?")]
        public bool IsActive { get; set; }
        public List<int> SoldierList { get; set; }
    }
}
