﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DatabaseEntities : DbContext
    {
        public DatabaseEntities()
            : base("name=DatabaseEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Applicant> Applicants { get; set; }
        public DbSet<Application> Applications { get; set; }
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<Degree> Degrees { get; set; }
        public DbSet<ExceptionHandler> ExceptionHandlers { get; set; }
        public DbSet<Faq> Faqs { get; set; }
        public DbSet<Field> Fields { get; set; }
        public DbSet<Help> Helps { get; set; }
        public DbSet<News> News { get; set; }
        public DbSet<NoSelection> NoSelections { get; set; }
        public DbSet<OwnerShip> OwnerShips { get; set; }
        public DbSet<Paper> Papers { get; set; }
        public DbSet<Process> Processes { get; set; }
        public DbSet<Profile> Profiles { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Sentence> Sentences { get; set; }
        public DbSet<Service> Services { get; set; }
        public DbSet<SpecialService> SpecialServices { get; set; }
        public DbSet<Technology> Technologies { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<ApplicantProduct> ApplicantProducts { get; set; }
        public DbSet<Product> Products { get; set; }
    }
}