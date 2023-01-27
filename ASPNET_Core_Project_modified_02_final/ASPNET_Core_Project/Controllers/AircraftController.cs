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
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.Authorization;

namespace ASPNET_Core_Project.Controllers
{
    [Authorize]
    public class AircraftController : Controller
    {
        private readonly ApplicationDbContext db;
        private readonly IWebHostEnvironment host;

        public AircraftController(ApplicationDbContext db, IWebHostEnvironment host)
        {
            this.db = db;
            this.host = host;
        }

        public async Task<IActionResult> Index()
        {
            return View(await db.Aircraft.ToListAsync());
        }

        public IActionResult Details(int? id)
        {
            Aircraft aircraft = db.Aircraft.FirstOrDefault(x => x.AircraftId == id);
            AircraftEntryVM aircraftEntryVM = new AircraftEntryVM
            {
                AircraftId = aircraft.AircraftId,
                Code = aircraft.Code,
                ImagePath = aircraft.ImagePath
            };
            return View(aircraftEntryVM);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(AircraftEntryVM aircraftEntryVM)
        {
            if (ModelState.IsValid)
            {
                IFormFile imageFile = aircraftEntryVM.ImageFile;
                if (imageFile != null)
                {
                    string webroot = host.WebRootPath;
                    string folder = "AircraftImages";
                    string fileName = Path.GetFileName(imageFile.FileName);
                    string filetoWrite = Path.Combine(webroot,folder,fileName);
                    using(var stream = new FileStream(filetoWrite, FileMode.Create))
                    {
                        await imageFile.CopyToAsync(stream);
                    }
                    string newFilePath = "/" + folder + "/" + fileName;

                    Aircraft aircraft = new Aircraft
                    {
                        Code = aircraftEntryVM.Code,
                        ImagePath = newFilePath
                    };
                    db.Aircraft.Add(aircraft);
                }
                
                await db.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(aircraftEntryVM);
        }

        public IActionResult Edit(int? id)
        {
            Aircraft aircraft = db.Aircraft.FirstOrDefault(x=>x.AircraftId == id);
            AircraftEntryVM aircraftEntryVM = new AircraftEntryVM
            {
                AircraftId = aircraft.AircraftId,
                Code = aircraft.Code,
                ImagePath = aircraft.ImagePath
            };
            return View(aircraftEntryVM);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(AircraftEntryVM aircraftEntryVM)
        {
            if (ModelState.IsValid)
            {
                Aircraft aircraft = new Aircraft
                {
                    AircraftId = aircraftEntryVM.AircraftId,
                    Code = aircraftEntryVM.Code,
                    ImagePath = aircraftEntryVM.ImagePath
                };

                IFormFile imageFile = aircraftEntryVM.ImageFile;
                if (imageFile != null)
                {
                    string webroot = host.WebRootPath;
                    string folder = "AircraftImages";
                    string fileName = Path.GetFileName(imageFile.FileName);
                    string filetoWrite = Path.Combine(webroot, folder, fileName);
                    using (var stream = new FileStream(filetoWrite, FileMode.Create))
                    {
                        await imageFile.CopyToAsync(stream);
                    }
                    string newFilePath = "/" + folder + "/" + fileName;
                    aircraft.ImagePath = newFilePath;
                }
                db.Entry(aircraft).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View();
        }

        public IActionResult Delete(int? id)
        {
            Aircraft aircraft = db.Aircraft.FirstOrDefault(x => x.AircraftId == id);
            AircraftEntryVM aircraftEntryVM = new AircraftEntryVM
            {
                AircraftId = aircraft.AircraftId,
                Code = aircraft.Code,
                ImagePath = aircraft.ImagePath
            };
            return View(aircraftEntryVM);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var aircraft = await db.Aircraft.FindAsync(id);
            db.Aircraft.Remove(aircraft);
            await db.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

    }
}
