using Microsoft.AspNetCore.Mvc;
using ASPNET_Core_Project.Data;
using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using System.Runtime.InteropServices.WindowsRuntime;
using Microsoft.AspNetCore.Authorization;

namespace ASPNET_Core_Project.Controllers
{
    [Authorize(Roles ="Admin")]
    public class RoleController : Controller
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;
        public RoleController(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            this.userManager = userManager;
            this.roleManager = roleManager;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateRole(string UserRole)
        {
            string msg = "";
            if (!string.IsNullOrEmpty(UserRole))
            {
                if(await roleManager.RoleExistsAsync(UserRole))
                {
                    msg = "Role "+UserRole+" already exists";
                }
                else
                {
                    IdentityRole role = new IdentityRole(UserRole);
                    await roleManager.CreateAsync(role);
                    msg = "Role "+UserRole+" has been created successfully.";
                }
            }
            else
            {
                msg = "Please enter a valid role name";
            }
            ViewBag.msg = msg;
            return View("Index");
        }

        public IActionResult AssignRole()
        {
            ViewBag.users = userManager.Users;
            ViewBag.roles = roleManager.Roles;
            ViewBag.msg = TempData["msg"];
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AssignRole(string UserData, string RoleData)
        {
            string msg = "";
            if(!string.IsNullOrEmpty(UserData) && (!string.IsNullOrEmpty(RoleData)))
            {
                ApplicationUser user = await userManager.FindByEmailAsync(UserData);
                if (user != null)
                {
                    if(await roleManager.RoleExistsAsync(RoleData))
                    {
                        await userManager.AddToRoleAsync(user,RoleData);
                        msg = "Role has been assigned to the user";
                    }
                    else
                    {
                        msg = "Role not found";
                    }
                }
                else
                {
                    msg = "User not found";
                }
            }
            else
            {
                msg = "No user and role found";
            }
            TempData["msg"] = msg;
            return RedirectToAction("AssignRole");
        }
    }
}
