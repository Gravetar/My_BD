using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Achievement
    {
        public int Id { get; }

        public string Name { get; set; }

        public int Reward { get; set; }

        public int LevelNumber { get; set; }

        public Achievement(int id, string name, int reward, int levelNumber)
        {
            Id = id;
            Name = name;
            Reward = reward;
            LevelNumber = levelNumber;
        }
    }
}
