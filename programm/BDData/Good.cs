using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Good
    {
        public int Id { get; }

        public string Name { get; set; }

        public int price { get; set; }

        public Good(int id, string name, int price)
        {
            Id = id;
            Name = name;
            this.price = price;
        }
    }
}
