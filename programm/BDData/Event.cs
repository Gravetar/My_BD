using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Event
    {
        public int Id { get; }

        public string description { get; set; }

        public string conditions { get; set; }

        public int countofconditions { get; set; }

        public int reward { get; set; }

        public string name { get; set; }

        public string datestart { get; set; }

        public Event(int id, string description, string conditions, int countofconditions, int reward, string name, string datestart)
        {
            Id = id;
            this.description = description;
            this.conditions = conditions;
            this.countofconditions = countofconditions;
            this.reward = reward;
            this.name = name;
            this.datestart = datestart;
        }
    }
}
