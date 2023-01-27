using Microsoft.EntityFrameworkCore.Migrations;

namespace ASPNET_Core_Project.Data.Migrations
{
    public partial class UpdateDatabaseForAccurateDataEntry : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MissionEntries_Aircraft_AircraftId",
                table: "MissionEntries");

            migrationBuilder.DropForeignKey(
                name: "FK_MissionEntries_Missions_MissionId",
                table: "MissionEntries");

            migrationBuilder.DropIndex(
                name: "IX_MissionEntries_AircraftId",
                table: "MissionEntries");

            migrationBuilder.DropIndex(
                name: "IX_MissionEntries_MissionId",
                table: "MissionEntries");

            migrationBuilder.DropColumn(
                name: "AircraftId",
                table: "MissionEntries");

            migrationBuilder.DropColumn(
                name: "MissionId",
                table: "MissionEntries");

            migrationBuilder.CreateTable(
                name: "missionSoldierEntries",
                columns: table => new
                {
                    MissionSoldierEntryId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MissionId = table.Column<int>(nullable: false),
                    SoldierId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_missionSoldierEntries", x => x.MissionSoldierEntryId);
                    table.ForeignKey(
                        name: "FK_missionSoldierEntries_Missions_MissionId",
                        column: x => x.MissionId,
                        principalTable: "Missions",
                        principalColumn: "MissionId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_missionSoldierEntries_Soldiers_SoldierId",
                        column: x => x.SoldierId,
                        principalTable: "Soldiers",
                        principalColumn: "SoldierId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_missionSoldierEntries_MissionId",
                table: "missionSoldierEntries",
                column: "MissionId");

            migrationBuilder.CreateIndex(
                name: "IX_missionSoldierEntries_SoldierId",
                table: "missionSoldierEntries",
                column: "SoldierId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "missionSoldierEntries");

            migrationBuilder.AddColumn<int>(
                name: "AircraftId",
                table: "MissionEntries",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "MissionId",
                table: "MissionEntries",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_MissionEntries_AircraftId",
                table: "MissionEntries",
                column: "AircraftId");

            migrationBuilder.CreateIndex(
                name: "IX_MissionEntries_MissionId",
                table: "MissionEntries",
                column: "MissionId");

            migrationBuilder.AddForeignKey(
                name: "FK_MissionEntries_Aircraft_AircraftId",
                table: "MissionEntries",
                column: "AircraftId",
                principalTable: "Aircraft",
                principalColumn: "AircraftId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_MissionEntries_Missions_MissionId",
                table: "MissionEntries",
                column: "MissionId",
                principalTable: "Missions",
                principalColumn: "MissionId",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
