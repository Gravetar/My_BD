using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Hero
    {
        public int Id { get; }

        public string Name { get; set; }

        public string Feature { get; set; }

        public string Biography { get; set; }

        public string TypeOfFight { get; set; }

        public int LevelNumber { get; set; }

        public Hero(int id, string name, string feature, string biography, string typeOfFight, int levelNumber)
        {
            Id = id;
            Name = name;
            Feature = feature;
            Biography = biography;
            TypeOfFight = typeOfFight;
            LevelNumber = levelNumber;
        }
    }


}
