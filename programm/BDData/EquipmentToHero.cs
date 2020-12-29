using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class EquipmentToHero
    {
        public int Id { get; }

        public int equipment_id { get; set; }

        public int hero_id { get; set; }

        public EquipmentToHero(int id, int equipment_id, int hero_id)
        {
            Id = id;
            this.equipment_id = equipment_id;
            this.hero_id = hero_id;
        }
    }
}
