using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class UserToTower
    {
        public int Id { get; }

        public int user_id { get; set; }

        public int tower_id { get; set; }

        public UserToTower(int id, int user_id, int tower_id)
        {
            Id = id;
            this.user_id = user_id;
            this.tower_id = tower_id;
        }
    }
}
