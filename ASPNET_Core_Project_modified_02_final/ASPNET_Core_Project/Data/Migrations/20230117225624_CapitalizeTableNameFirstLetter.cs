using Microsoft.EntityFrameworkCore.Migrations;

namespace ASPNET_Core_Project.Data.Migrations
{
    public partial class CapitalizeTableNameFirstLetter : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_missionSoldierEntries_Missions_MissionId",
                table: "missionSoldierEntries");

            migrationBuilder.DropForeignKey(
                name: "FK_missionSoldierEntries_Soldiers_SoldierId",
                table: "missionSoldierEntries");

            migrationBuilder.DropPrimaryKey(
                name: "PK_missionSoldierEntries",
                table: "missionSoldierEntries");

            migrationBuilder.RenameTable(
                name: "missionSoldierEntries",
                newName: "MissionSoldierEntries");

            migrationBuilder.RenameIndex(
                name: "IX_missionSoldierEntries_SoldierId",
                table: "MissionSoldierEntries",
                newName: "IX_MissionSoldierEntries_SoldierId");

            migrationBuilder.RenameIndex(
                name: "IX_missionSoldierEntries_MissionId",
                table: "MissionSoldierEntries",
                newName: "IX_MissionSoldierEntries_MissionId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_MissionSoldierEntries",
                table: "MissionSoldierEntries",
                column: "MissionSoldierEntryId");

            migrationBuilder.AddForeignKey(
                name: "FK_MissionSoldierEntries_Missions_MissionId",
                table: "MissionSoldierEntries",
                column: "MissionId",
                principalTable: "Missions",
                principalColumn: "MissionId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MissionSoldierEntries_Soldiers_SoldierId",
                table: "MissionSoldierEntries",
                column: "SoldierId",
                principalTable: "Soldiers",
                principalColumn: "SoldierId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MissionSoldierEntries_Missions_MissionId",
                table: "MissionSoldierEntries");

            migrationBuilder.DropForeignKey(
                name: "FK_MissionSoldierEntries_Soldiers_SoldierId",
                table: "MissionSoldierEntries");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MissionSoldierEntries",
                table: "MissionSoldierEntries");

            migrationBuilder.RenameTable(
                name: "MissionSoldierEntries",
                newName: "missionSoldierEntries");

            migrationBuilder.RenameIndex(
                name: "IX_MissionSoldierEntries_SoldierId",
                table: "missionSoldierEntries",
                newName: "IX_missionSoldierEntries_SoldierId");

            migrationBuilder.RenameIndex(
                name: "IX_MissionSoldierEntries_MissionId",
                table: "missionSoldierEntries",
                newName: "IX_missionSoldierEntries_MissionId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_missionSoldierEntries",
                table: "missionSoldierEntries",
                column: "MissionSoldierEntryId");

            migrationBuilder.AddForeignKey(
                name: "FK_missionSoldierEntries_Missions_MissionId",
                table: "missionSoldierEntries",
                column: "MissionId",
                principalTable: "Missions",
                principalColumn: "MissionId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_missionSoldierEntries_Soldiers_SoldierId",
                table: "missionSoldierEntries",
                column: "SoldierId",
                principalTable: "Soldiers",
                principalColumn: "SoldierId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
