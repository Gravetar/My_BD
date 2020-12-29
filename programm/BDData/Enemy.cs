using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    class Enemy
    {
        public int Id { get; }

        public string ModelURL { get; set; }

        public int health { get; set; }

        public float speed { get; set; }

        public int reward { get; set; }

        public Enemy(int id, string modelURL, int health, float speed, int reward)
        {
            Id = id;
            ModelURL = modelURL;
            this.health = health;
            this.speed = speed;
            this.reward = reward;
        }
    }
}
