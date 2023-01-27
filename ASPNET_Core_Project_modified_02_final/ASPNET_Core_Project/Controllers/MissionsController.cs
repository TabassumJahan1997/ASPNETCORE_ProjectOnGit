using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ASPNET_Core_Project.Data;
using ASPNET_Core_Project.Models;
using System.Resources;
using System.Security.Cryptography.X509Certificates;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using Microsoft.AspNetCore.Authorization;

namespace ASPNET_Core_Project.Controllers
{
    [Authorize]
    public class MissionsController : Controller
    {
        private readonly ApplicationDbContext db;
        private readonly IWebHostEnvironment host;

        public MissionsController(ApplicationDbContext db,IWebHostEnvironment host)
        {
            this.db = db;
            this.host = host;
        }

        public IActionResult Index()
        {
            var missionData = db.Missions.Include(x => x.MissionSoldierEntries).ThenInclude(x => x.Soldier).ThenInclude(x => x.SoldierImage).ToList();
            return View(missionData);
            
        }


        public IActionResult AddNewSoldier(int? id)
        {
            ViewBag.soldiers = new SelectList(db.Soldiers.ToList(), "SoldierId", "SoldierName", id.ToString() ?? "");
            return PartialView("_addNewSoldier");
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mission = await db.Missions
                .FirstOrDefaultAsync(m => m.MissionId == id);
            if (mission == null)
            {
                return NotFound();
            }

            return View(mission);
        }

        public IActionResult Create()
        {

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(MissionSoldierEntryVM missionSoldierEntryVM, int[] SoldierId)
        {
            if (ModelState.IsValid)
            {
                Mission mission = new Mission()
                {
                    Location = missionSoldierEntryVM.Location,
                    StartDate = missionSoldierEntryVM.StartDate,
                    Budget = missionSoldierEntryVM.Budget,
                    Description = missionSoldierEntryVM.Description,
                    IsActive = missionSoldierEntryVM.IsActive
                };

                IFormFile imageFile = missionSoldierEntryVM.ImageFile;
                if (imageFile != null)
                {
                    string webroot = host.WebRootPath;
                    string folder = "LeaderImages";
                    string fileName = Path.GetFileName(imageFile.FileName);
                    string fileToWrite = Path.Combine(webroot, folder,fileName);
                    using (var stream = new FileStream(fileToWrite,FileMode.Create))
                    {
                        imageFile.CopyTo(stream);
                    }
                        string newFilePath = "/" + folder + "/" + fileName;
                    mission.ImagePath = newFilePath; 
                }

                foreach (var soldier in SoldierId)
                {
                    MissionSoldierEntry missionSoldierEntry = new MissionSoldierEntry()
                    {
                        Mission = mission,
                        MissionId = mission.MissionId,
                        SoldierId = soldier
                    };
                    db.MissionSoldierEntries.Add(missionSoldierEntry);
                }

                
                await db.SaveChangesAsync();

            }
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int? id)
        {
            Mission mission = db.Missions.FirstOrDefault(x=>x.MissionId==id);
            var soldiers = db.MissionSoldierEntries.Where(x=>x.MissionId==id).Select(x=>x.SoldierId).ToList();
            MissionSoldierEntryVM msvm = new MissionSoldierEntryVM()
            {
                MissionId = mission.MissionId,
                Location = mission.Location,
                Budget = mission.Budget,
                StartDate = mission.StartDate,
                Description = mission.Description,
                IsActive = mission.IsActive,
                ImagePath = mission.ImagePath,
                SoldierList = soldiers
            };
            return View(msvm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(MissionSoldierEntryVM msvm, int[] SoldierId)
        {
            if (ModelState.IsValid)
            {
                Mission mission = new Mission()
                {
                    MissionId = msvm.MissionId,
                    Location = msvm.Location,
                    StartDate = msvm.StartDate,
                    Budget = msvm.Budget,
                    Description = msvm.Description,
                    ImagePath = msvm.ImagePath,
                    IsActive = msvm.IsActive
                };

                IFormFile imageFile = msvm.ImageFile;
                if (imageFile != null)
                {
                    string webroot = host.WebRootPath;
                    string folder = "LeaderImages";
                    string fileName = Path.GetFileName(imageFile.FileName);
                    string fileToWrite = Path.Combine(webroot, folder, fileName);
                    using (var stream = new FileStream(fileToWrite, FileMode.Create))
                    {
                        imageFile.CopyTo(stream);
                    }
                    string newFilePath = "/" + folder + "/" + fileName;
                    mission.ImagePath = newFilePath;
                }

                var soldiers = db.MissionSoldierEntries.Where(x=>x.MissionId==msvm.MissionId).ToList();
                foreach (var item in soldiers)
                {
                    db.MissionSoldierEntries.Remove(item);
                }

                foreach (var soldier in SoldierId)
                {
                    MissionSoldierEntry missionSoldierEntry = new MissionSoldierEntry()
                    {
                        MissionId = mission.MissionId,
                        SoldierId = soldier
                    };
                    db.MissionSoldierEntries.Add(missionSoldierEntry);
                }
                db.Entry(mission).State = EntityState.Modified;
                await db.SaveChangesAsync();

            }
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int? id)
        {
            Mission mission = db.Missions.FirstOrDefault(x => x.MissionId == id);
            var soldiers = db.MissionSoldierEntries.Where(x => x.MissionId == id).ToList();
            foreach (var item in soldiers)
            {
                db.MissionSoldierEntries.Remove(item);
            }
            db.Entry(mission).State = EntityState.Deleted;
            db.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

    }
}
