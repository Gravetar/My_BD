using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Сharacteristic
    {
        public int Id { get; }

        public string Name { get; set; }

        public Сharacteristic(int id, string name)
        {
            Id = id;
            Name = name;
        }
    }
}
