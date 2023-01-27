using Microsoft.EntityFrameworkCore.Migrations;

namespace ASPNET_Core_Project.Data.Migrations
{
    public partial class ModifyMissionEntryTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MissionEntries_Aircraft_AircraftId",
                table: "MissionEntries");

            migrationBuilder.DropForeignKey(
                name: "FK_MissionEntries_Missions_MissionId",
                table: "MissionEntries");

            migrationBuilder.AlterColumn<int>(
                name: "MissionId",
                table: "MissionEntries",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "AircraftId",
                table: "MissionEntries",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "MissionAircraftEntryId",
                table: "MissionEntries",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_MissionEntries_MissionAircraftEntryId",
                table: "MissionEntries",
                column: "MissionAircraftEntryId");

            migrationBuilder.AddForeignKey(
                name: "FK_MissionEntries_Aircraft_AircraftId",
                table: "MissionEntries",
                column: "AircraftId",
                principalTable: "Aircraft",
                principalColumn: "AircraftId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_MissionEntries_MissionAircraftEntries_MissionAircraftEntryId",
                table: "MissionEntries",
                column: "MissionAircraftEntryId",
                principalTable: "MissionAircraftEntries",
                principalColumn: "MissionAircraftEntryId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MissionEntries_Missions_MissionId",
                table: "MissionEntries",
                column: "MissionId",
                principalTable: "Missions",
                principalColumn: "MissionId",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MissionEntries_Aircraft_AircraftId",
                table: "MissionEntries");

            migrationBuilder.DropForeignKey(
                name: "FK_MissionEntries_MissionAircraftEntries_MissionAircraftEntryId",
                table: "MissionEntries");

            migrationBuilder.DropForeignKey(
                name: "FK_MissionEntries_Missions_MissionId",
                table: "MissionEntries");

            migrationBuilder.DropIndex(
                name: "IX_MissionEntries_MissionAircraftEntryId",
                table: "MissionEntries");

            migrationBuilder.DropColumn(
                name: "MissionAircraftEntryId",
                table: "MissionEntries");

            migrationBuilder.AlterColumn<int>(
                name: "MissionId",
                table: "MissionEntries",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "AircraftId",
                table: "MissionEntries",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_MissionEntries_Aircraft_AircraftId",
                table: "MissionEntries",
                column: "AircraftId",
                principalTable: "Aircraft",
                principalColumn: "AircraftId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_MissionEntries_Missions_MissionId",
                table: "MissionEntries",
                column: "MissionId",
                principalTable: "Missions",
                principalColumn: "MissionId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
