using Microsoft.EntityFrameworkCore.Migrations;

namespace ASPNET_Core_Project.Data.Migrations
{
    public partial class addMissionAircraftEntryTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "MissionAircraftEntries",
                columns: table => new
                {
                    MissionAircraftEntryId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MissionId = table.Column<int>(nullable: false),
                    AircraftId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MissionAircraftEntries", x => x.MissionAircraftEntryId);
                    table.ForeignKey(
                        name: "FK_MissionAircraftEntries_Aircraft_AircraftId",
                        column: x => x.AircraftId,
                        principalTable: "Aircraft",
                        principalColumn: "AircraftId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_MissionAircraftEntries_Missions_MissionId",
                        column: x => x.MissionId,
                        principalTable: "Missions",
                        principalColumn: "MissionId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MissionAircraftEntries_AircraftId",
                table: "MissionAircraftEntries",
                column: "AircraftId");

            migrationBuilder.CreateIndex(
                name: "IX_MissionAircraftEntries_MissionId",
                table: "MissionAircraftEntries",
                column: "MissionId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MissionAircraftEntries");
        }
    }
}
