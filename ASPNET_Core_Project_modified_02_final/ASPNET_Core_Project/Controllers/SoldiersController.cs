using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ASPNET_Core_Project.Data;
using ASPNET_Core_Project.Models;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Authorization;

namespace ASPNET_Core_Project.Controllers
{
    [Authorize(Policy = "AuthorizedOnly")]
    public class SoldiersController : Controller
    {
        private readonly ApplicationDbContext db;
        private readonly IWebHostEnvironment host;

        public SoldiersController(ApplicationDbContext db, IWebHostEnvironment host)
        {
            this.db = db;
            this.host = host;
        }

        public IActionResult Index()
        {
            var soldierInfo = (from s in db.Soldiers
                               join r in db.Rank on s.RankId equals r.RankId
                               join si in db.SoldierImages on s.SoldierId equals si.SoldierId
                               select new SoldierImageEntryVM
                               {
                                   SoldierId = s.SoldierId,
                                   SoldierName = s.SoldierName,
                                   RankId= r.RankId,
                                   RankName=r.RankName,
                                   Age = s.Age,
                                   ImagePath = si.ImagePath
                               }).ToList();
            return View(soldierInfo);
        }

        public IActionResult Details(int? id)
        {
            Soldier soldier = db.Soldiers.FirstOrDefault(x => x.SoldierId == id);
            SoldierImage image = db.SoldierImages.FirstOrDefault(x => x.SoldierId == id);
            Rank rank = db.Rank.FirstOrDefault(x => x.RankId == soldier.RankId);
            SoldierImageEntryVM vm = new SoldierImageEntryVM
            {
                SoldierId = soldier.SoldierId,
                SoldierName = soldier.SoldierName,
                Age = soldier.Age,
                RankId = soldier.RankId,
                RankName = rank.RankName,
                ImagePath = image.ImagePath
            };

            ViewBag.ranks = new SelectList(db.Rank, "RankId", "RankName", soldier.RankId);
            return View(vm);
        }

        public IActionResult Create()
        {
            ViewData["RankId"] = new SelectList(db.Rank, "RankId", "RankName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(SoldierImageEntryVM soldierImageVM)
        {
            if (ModelState.IsValid)
            {
                IFormFile imageFile = soldierImageVM.ImageFile;

                string webroot = host.WebRootPath;
                string folder = "Images";
                string filename = Path.GetFileName(imageFile.FileName);
                string fileToWrite = Path.Combine(webroot,folder,filename);
                string newFilePath = "/" + folder + "/" + filename;

                using (var stream = new FileStream(fileToWrite,FileMode.Create))
                {
                   await imageFile.CopyToAsync(stream);
                }

                Soldier soldier = new Soldier
                {
                    SoldierName = soldierImageVM.SoldierName,
                    Age = soldierImageVM.Age,
                    RankId = soldierImageVM.RankId
                };

                SoldierImage image = new SoldierImage
                {
                    Soldier = soldier,
                    ImagePath = newFilePath
                };
                db.SoldierImages.Add(image);
                await db.SaveChangesAsync();
                
            }
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int? id)
        {
            Soldier soldier = db.Soldiers.FirstOrDefault(x => x.SoldierId==id);
            SoldierImage image = db.SoldierImages.FirstOrDefault(x=>x.SoldierId ==id);
            
            SoldierImageEntryVM vm = new SoldierImageEntryVM
            {
                SoldierId = soldier.SoldierId,
                SoldierName = soldier.SoldierName,
                Age = soldier.Age,
                RankId = soldier.RankId,
                ImagePath = image.ImagePath
            };

            ViewBag.ranks = new SelectList(db.Rank, "RankId", "RankName", soldier.RankId);
            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(SoldierImageEntryVM soldierImageVM)
        {
            if (ModelState.IsValid)
            {
                IFormFile imageFile = soldierImageVM.ImageFile;

                if (imageFile != null)
                {
                    string webroot = host.WebRootPath;
                    string folder = "Images";
                    string filename = Path.GetFileName(imageFile.FileName);
                    string fileToWrite = Path.Combine(webroot, folder, filename);
                    string newFilePath = "/" + folder + "/" + filename;

                    using (var stream = new FileStream(fileToWrite, FileMode.Create))
                    {
                        await imageFile.CopyToAsync(stream);
                    }
                    Soldier soldier = new Soldier
                    {
                        SoldierId = soldierImageVM.SoldierId,
                        SoldierName = soldierImageVM.SoldierName,
                        Age = soldierImageVM.Age,
                        RankId = soldierImageVM.RankId
                    };
                    SoldierImage image = new SoldierImage
                    {
                        SoldierId = soldierImageVM.SoldierId,
                        Soldier = soldier,
                        ImagePath = newFilePath
                    };
                    db.Entry(soldier).State = EntityState.Modified;
                    db.Entry(image).State = EntityState.Modified;
                }
                else
                {
                    Soldier soldier = new Soldier
                    {
                        SoldierId = soldierImageVM.SoldierId,
                        SoldierName = soldierImageVM.SoldierName,
                        Age = soldierImageVM.Age,
                        RankId = soldierImageVM.RankId
                    };
                    db.Entry(soldier).State = EntityState.Modified;
                }
                await db.SaveChangesAsync();
            }
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int? id)
        {
            Soldier soldier = db.Soldiers.FirstOrDefault(x => x.SoldierId == id);
            SoldierImage image = db.SoldierImages.FirstOrDefault(x => x.SoldierId == id);
            Rank rank = db.Rank.FirstOrDefault(x => x.RankId == soldier.RankId);
            SoldierImageEntryVM vm = new SoldierImageEntryVM
            {
                SoldierId = soldier.SoldierId,
                SoldierName = soldier.SoldierName,
                Age = soldier.Age,
                RankId = soldier.RankId,
                RankName = rank.RankName,
                ImagePath = image.ImagePath
            };

            ViewBag.ranks = new SelectList(db.Rank, "RankId", "RankName", soldier.RankId);
            return View(vm);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(SoldierImageEntryVM soldierImageEntryVM)
        {
            Soldier soldier = new Soldier
            {
                SoldierId = soldierImageEntryVM.SoldierId,
                SoldierName = soldierImageEntryVM.SoldierName,
                Age = soldierImageEntryVM.Age,
                RankId = soldierImageEntryVM.RankId
            };
            SoldierImage soldierImage = new SoldierImage
            {
                SoldierId = soldierImageEntryVM.SoldierId,
                ImagePath = soldierImageEntryVM.ImagePath
            };
            db.Entry(soldier).State = EntityState.Deleted;
            db.Entry(soldierImage).State = EntityState.Deleted;
            await db.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

    }
}
