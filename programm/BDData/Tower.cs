using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Tower
    {
        public int Id { get; }

        public string Name { get; set; }

        public string ModelURL { get; set; }

        public string ImageURL { get; set; }

        public int LevelNumber { get; set; }

        public Tower(int id, string name, string modelURL, string imageURL, int levelNumber)
        {
            Id = id;
            Name = name;
            ModelURL = modelURL;
            ImageURL = imageURL;
            LevelNumber = levelNumber;
        }
    }
}
