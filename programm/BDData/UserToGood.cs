using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class UserToGood
    {
        public int Id { get; }

        public int user_id { get; set; }

        public int good_id { get; set; }

        public UserToGood(int id, int user_id, int good_id)
        {
            Id = id;
            this.user_id = user_id;
            this.good_id = good_id;
        }
    }
}
