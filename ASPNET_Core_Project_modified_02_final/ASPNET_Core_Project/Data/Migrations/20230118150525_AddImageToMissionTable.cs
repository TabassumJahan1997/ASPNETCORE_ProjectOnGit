using Microsoft.EntityFrameworkCore.Migrations;

namespace ASPNET_Core_Project.Data.Migrations
{
    public partial class AddImageToMissionTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ImagePath",
                table: "Missions",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ImagePath",
                table: "Missions");
        }
    }
}
