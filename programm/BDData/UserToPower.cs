using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class UserToPower
    {
        public int Id { get; }

        public int user_id { get; set; }

        public int power_id { get; set; }

        public UserToPower(int id, int user_id, int power_id)
        {
            Id = id;
            this.user_id = user_id;
            this.power_id = power_id;
        }
    }
}
