using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class UserToPump
    {
        public int Id { get; }

        public int user_id { get; set; }

        public int pump_id { get; set; }

        public int level { get; set; }

        public UserToPump(int id, int user_id, int pump_id, int level)
        {
            Id = id;
            this.user_id = user_id;
            this.pump_id = pump_id;
            this.level = level;
        }
    }
}
