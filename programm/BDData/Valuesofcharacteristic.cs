using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Valuesofcharacteristic
    {
        public int Id { get; }

        public int value { get; set; }

        public int characteristic_id { get; set; }

        public string power_id { get; set; }

        public string equipment_id { get; set; }

        public string hero_id { get; set; }

        public string enemy_id { get; set; }

        public string tower_id { get; set; }

        public Valuesofcharacteristic(int id, int value, int characteristic_id, string power_id, string equipment_id, string hero_id, string enemy_id, string tower_id)
        {
            Id = id;
            this.value = value;
            this.characteristic_id = characteristic_id;
            this.power_id = power_id;
            this.equipment_id = equipment_id;
            this.hero_id = hero_id;
            this.enemy_id = enemy_id;
            this.tower_id = tower_id;
        }
    }
}
