using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Map
    {
        public int Id { get; }

        public string Name { get; set; }

        public int Waves { get; set; }

        public int LevelNumber { get; set; }

        public Map(int id, string name, int waves, int levelNumber)
        {
            Id = id;
            Name = name;
            Waves = waves;
            LevelNumber = levelNumber;
        }
    }
}
