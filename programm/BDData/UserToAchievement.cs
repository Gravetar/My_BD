using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class UserToAchievement
    {
        public int Id { get; }

        public int user_id { get; set; }

        public int achievement_id { get; set; }

        public UserToAchievement(int id, int user_id, int achievement_id)
        {
            Id = id;
            this.user_id = user_id;
            this.achievement_id = achievement_id;
        }
    }
}
