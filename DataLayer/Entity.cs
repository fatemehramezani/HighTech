using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public partial class DatabaseEntities : DbContext
    {
        private string connectionString;
        public DatabaseEntities(string connectionString)
        {
            this.connectionString = connectionString;
        }
    
    }
}
