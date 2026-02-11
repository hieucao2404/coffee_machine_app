using Microsoft.EntityFrameworkCore;
using CoffeeMachine.Models;

namespace CoffeeMachine.Data;

public class CoffeeMachineDbContext : DbContext
{
    public DbSet<Product> Products { get; set; }
    public DbSet<Material> Materials { get; set; }
    public DbSet<Process> Processes { get; set; }
    public DbSet<ProcessedMaterial> ProcessedMaterials { get; set; }

    public CoffeeMachineDbContext(DbContextOptions<CoffeeMachineDbContext> options) 
        : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // Map Product entity
        modelBuilder.Entity<Product>().ToTable("product");
        modelBuilder.Entity<Product>().Property(p => p.ProductId).HasColumnName("product_id");
        modelBuilder.Entity<Product>().Property(p => p.ProductCode).HasColumnName("product_code");
        modelBuilder.Entity<Product>().Property(p => p.ProductName).HasColumnName("product_name");
        modelBuilder.Entity<Product>().Property(p => p.ProductType).HasColumnName("product_type");
        modelBuilder.Entity<Product>().Property(p => p.Category).HasColumnName("category");
        modelBuilder.Entity<Product>().Property(p => p.Price).HasColumnName("price");
        modelBuilder.Entity<Product>().Property(p => p.Description).HasColumnName("description");
        modelBuilder.Entity<Product>().Property(p => p.IsActive).HasColumnName("is_active");
        modelBuilder.Entity<Product>().Property(p => p.ImageUrl).HasColumnName("image_url");
        modelBuilder.Entity<Product>().Property(p => p.CreatedAt).HasColumnName("created_at");
        modelBuilder.Entity<Product>().Property(p => p.UpdatedAt).HasColumnName("updated_at");

        // Map Material entity
        modelBuilder.Entity<Material>().ToTable("material");
        modelBuilder.Entity<Material>().Property(m => m.MaterialId).HasColumnName("material_id");
        modelBuilder.Entity<Material>().Property(m => m.MaterialName).HasColumnName("material_name");
        modelBuilder.Entity<Material>().Property(m => m.MaterialUnit).HasColumnName("material_unit");
        modelBuilder.Entity<Material>().Property(m => m.CostPerUnit).HasColumnName("cost_per_unit");
        modelBuilder.Entity<Material>().Property(m => m.StockQuantity).HasColumnName("stock_quantity");
        modelBuilder.Entity<Material>().Property(m => m.IsConsumable).HasColumnName("is_consumable");
        modelBuilder.Entity<Material>().Property(m => m.ImageUrl).HasColumnName("image_url");
        modelBuilder.Entity<Material>().Property(m => m.CreatedAt).HasColumnName("created_at");
        modelBuilder.Entity<Material>().Property(m => m.UpdatedAt).HasColumnName("updated_at");

        // Map Process entity
        modelBuilder.Entity<Process>().ToTable("process");
        modelBuilder.Entity<Process>().Property(pr => pr.ProcessId).HasColumnName("process_id");
        modelBuilder.Entity<Process>().Property(pr => pr.ProductId).HasColumnName("product_id");
        modelBuilder.Entity<Process>().Property(pr => pr.Version).HasColumnName("version");
        modelBuilder.Entity<Process>().Property(pr => pr.Note).HasColumnName("note");
        modelBuilder.Entity<Process>().Property(pr => pr.Type).HasColumnName("type");
        modelBuilder.Entity<Process>().Property(pr => pr.IsDefault).HasColumnName("is_default");

        // Map ProcessedMaterial entity
        modelBuilder.Entity<ProcessedMaterial>().ToTable("processed_material");
        modelBuilder.Entity<ProcessedMaterial>().HasKey(pm => pm.ProcessedMaterialId);
        modelBuilder.Entity<ProcessedMaterial>().Property(pm => pm.ProcessedMaterialId).HasColumnName("processed_material_id");
        modelBuilder.Entity<ProcessedMaterial>().Property(pm => pm.ProcessId).HasColumnName("process_id");
        modelBuilder.Entity<ProcessedMaterial>().Property(pm => pm.MaterialId).HasColumnName("material_id");
        modelBuilder.Entity<ProcessedMaterial>().Property(pm => pm.Quantity).HasColumnName("quantity");
        modelBuilder.Entity<ProcessedMaterial>().Property(pm => pm.UsageType).HasColumnName("usage_type");
        modelBuilder.Entity<ProcessedMaterial>().Property(pm => pm.Sequence).HasColumnName("sequence");

        // Configure relationships
        modelBuilder.Entity<Process>()
            .HasOne(p => p.Product)
            .WithMany(pr => pr.Processes)
            .HasForeignKey(p => p.ProductId);

        modelBuilder.Entity<ProcessedMaterial>()
            .HasOne(pm => pm.Process)
            .WithMany(p => p.ProcessedMaterials)
            .HasForeignKey(pm => pm.ProcessId);

        modelBuilder.Entity<ProcessedMaterial>()
            .HasOne(pm => pm.Material)
            .WithMany(m => m.ProcessedMaterials)
            .HasForeignKey(pm => pm.MaterialId);
    }
}