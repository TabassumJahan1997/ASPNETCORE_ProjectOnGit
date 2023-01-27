using Microsoft.EntityFrameworkCore.Migrations;

namespace ASPNET_Core_Project.Data.Migrations
{
    public partial class RenameTables : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SoldierEntries");

            migrationBuilder.CreateTable(
                name: "MissionEntries",
                columns: table => new
                {
                    MissionEntryId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MissionId = table.Column<int>(nullable: false),
                    SoldierId = table.Column<int>(nullable: false),
                    AircraftId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MissionEntries", x => x.MissionEntryId);
                    table.ForeignKey(
                        name: "FK_MissionEntries_Aircraft_AircraftId",
                        column: x => x.AircraftId,
                        principalTable: "Aircraft",
                        principalColumn: "AircraftId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_MissionEntries_Missions_MissionId",
                        column: x => x.MissionId,
                        principalTable: "Missions",
                        principalColumn: "MissionId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_MissionEntries_Soldiers_SoldierId",
                        column: x => x.SoldierId,
                        principalTable: "Soldiers",
                        principalColumn: "SoldierId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MissionEntries_AircraftId",
                table: "MissionEntries",
                column: "AircraftId");

            migrationBuilder.CreateIndex(
                name: "IX_MissionEntries_MissionId",
                table: "MissionEntries",
                column: "MissionId");

            migrationBuilder.CreateIndex(
                name: "IX_MissionEntries_SoldierId",
                table: "MissionEntries",
                column: "SoldierId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MissionEntries");

            migrationBuilder.CreateTable(
                name: "SoldierEntries",
                columns: table => new
                {
                    SoldierEntryId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AircraftId = table.Column<int>(type: "int", nullable: false),
                    MissionId = table.Column<int>(type: "int", nullable: false),
                    SoldierId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SoldierEntries", x => x.SoldierEntryId);
                    table.ForeignKey(
                        name: "FK_SoldierEntries_Aircraft_AircraftId",
                        column: x => x.AircraftId,
                        principalTable: "Aircraft",
                        principalColumn: "AircraftId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SoldierEntries_Missions_MissionId",
                        column: x => x.MissionId,
                        principalTable: "Missions",
                        principalColumn: "MissionId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SoldierEntries_Soldiers_SoldierId",
                        column: x => x.SoldierId,
                        principalTable: "Soldiers",
                        principalColumn: "SoldierId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SoldierEntries_AircraftId",
                table: "SoldierEntries",
                column: "AircraftId");

            migrationBuilder.CreateIndex(
                name: "IX_SoldierEntries_MissionId",
                table: "SoldierEntries",
                column: "MissionId");

            migrationBuilder.CreateIndex(
                name: "IX_SoldierEntries_SoldierId",
                table: "SoldierEntries",
                column: "SoldierId");
        }
    }
}
