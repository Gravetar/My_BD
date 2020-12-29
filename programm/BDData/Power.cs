using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Power
    {
        public int Id { get; }

        public string Name { get; set; }

        public string feature { get; set; }

        public int price { get; set; }

        public Power(int id, string name, string feature, int price)
        {
            Id = id;
            Name = name;
            this.feature = feature;
            this.price = price;
        }
    }
}
