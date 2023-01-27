using Microsoft.AspNetCore.Identity;

namespace ASPNET_Core_Project.Data
{
    public class ApplicationUser:IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Country { get; set; }
        public string ContactNo { get; set; }
    }
}
