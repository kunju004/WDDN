using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using GymManagementMVC.Models;

namespace GymManagementMVC.Data
{
    public class GymManagementMVCContext : DbContext
    {
        public GymManagementMVCContext (DbContextOptions<GymManagementMVCContext> options)
            : base(options)
        {
        }

        public DbSet<GymManagementMVC.Models.Member> Member { get; set; }
    }
}
