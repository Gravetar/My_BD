using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Equipment
    {
        public int Id { get; }

        public string Name { get; set; }

        public string description { get; set; }

        public string conditions { get; set; }

        public Equipment(int id, string name, string description, string conditions)
        {
            Id = id;
            Name = name;
            this.description = description;
            this.conditions = conditions;
        }
    }
}
