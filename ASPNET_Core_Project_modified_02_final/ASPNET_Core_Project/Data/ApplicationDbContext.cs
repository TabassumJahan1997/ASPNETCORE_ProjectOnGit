using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using ASPNET_Core_Project.Models;

namespace ASPNET_Core_Project.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser,IdentityRole,string>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<ASPNET_Core_Project.Models.Rank> Rank { get; set; }
        public DbSet<Mission> Missions { get; set; }
        public DbSet<Soldier> Soldiers { get; set; }
        public DbSet<SoldierImage> SoldierImages { get; set; }
        public DbSet<MissionEntry> MissionEntries { get; set; }
        public DbSet<Aircraft> Aircraft { get; set; }
        public DbSet<MissionAircraftEntry> MissionAircraftEntries { get; set; }
        public DbSet<MissionSoldierEntry> MissionSoldierEntries { get; set; }
    }
}
