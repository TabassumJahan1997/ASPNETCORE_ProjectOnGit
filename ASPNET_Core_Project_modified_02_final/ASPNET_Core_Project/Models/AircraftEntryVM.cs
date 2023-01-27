using Microsoft.AspNetCore.Http;
using System.Collections.Generic;

namespace ASPNET_Core_Project.Models
{
    public class AircraftEntryVM
    {
        public int AircraftId { get; set; }
        public string Code { get; set; }
        public string ImagePath { get; set; }
        public IFormFile ImageFile { get; set; }
    }
}
