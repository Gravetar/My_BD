using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class UserToHero
    {
        public int Id { get; }

        public int user_id { get; set; }

        public int hero_id { get; set; }

        public UserToHero(int id, int user_id, int hero_id)
        {
            Id = id;
            this.user_id = user_id;
            this.hero_id = hero_id;
        }
    }
}
