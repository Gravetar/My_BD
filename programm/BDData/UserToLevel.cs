using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class UserToLevel
    {
        public int Id { get; }

        public int user_id { get; set; }

        public int level_id { get; set; }

        public UserToLevel(int id, int user_id, int level_id)
        {
            Id = id;
            this.user_id = user_id;
            this.level_id = level_id;
        }
    }
}
