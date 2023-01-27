using Microsoft.EntityFrameworkCore.Migrations;

namespace ASPNET_Core_Project.Data.Migrations
{
    public partial class AddAircraftClass : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "AircraftId",
                table: "SoldierEntries",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Aircraft",
                columns: table => new
                {
                    AircraftId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Code = table.Column<int>(nullable: false),
                    ImagePath = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Aircraft", x => x.AircraftId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SoldierEntries_AircraftId",
                table: "SoldierEntries",
                column: "AircraftId");

            migrationBuilder.AddForeignKey(
                name: "FK_SoldierEntries_Aircraft_AircraftId",
                table: "SoldierEntries",
                column: "AircraftId",
                principalTable: "Aircraft",
                principalColumn: "AircraftId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SoldierEntries_Aircraft_AircraftId",
                table: "SoldierEntries");

            migrationBuilder.DropTable(
                name: "Aircraft");

            migrationBuilder.DropIndex(
                name: "IX_SoldierEntries_AircraftId",
                table: "SoldierEntries");

            migrationBuilder.DropColumn(
                name: "AircraftId",
                table: "SoldierEntries");
        }
    }
}
