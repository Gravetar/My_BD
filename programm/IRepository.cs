using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD
{
    interface IRepository
    {
        IEnumerable<User> GetUsers();

        #region USERS

        bool AddUser(User newUser);

        bool EditUserByID(User newUser);

        bool EditUserByName(User newUser, string Name);

        bool DelUserByID(int ID);

        bool DelUserByName(string Name);

        #endregion

        #region HEROES
        bool AddHero(Hero newHero);
        #endregion
    }
}
