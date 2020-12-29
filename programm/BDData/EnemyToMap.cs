using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class EnemyToMap
    {
        public int Id { get; }

        public int enemy_id { get; set; }

        public int map_id { get; set; }

        public EnemyToMap(int id, int enemy_id, int map_id)
        {
            Id = id;
            this.enemy_id = enemy_id;
            this.map_id = map_id;
        }
    }
}
