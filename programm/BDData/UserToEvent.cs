using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class UserToEvent
    {
        public int Id { get; }

        public int user_id { get; set; }

        public int event_id { get; set; }

        public UserToEvent(int id, int user_id, int event_id)
        {
            Id = id;
            this.user_id = user_id;
            this.event_id = event_id;
        }
    }
}
