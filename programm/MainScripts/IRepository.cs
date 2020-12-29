using System.Collections.Generic;

namespace BD
{
    interface IRepository
    {

        #region USERS

        bool AddUser(User newUser);

        bool EditUserByID(User newUser);

        bool EditUserByName(User newUser, string Name);

        bool DelUserByID(int ID);

        bool DelUserByName(string Name);

        IEnumerable<User> GetUsers();

        IEnumerable<User> GetUsersBestMoney(int count);

        float GetPercentAdminUsers();

        float GetPercentNoAdminUsers();

        List<string> GetCountTowersHeroesFromUser();

        int GetCompleteEvent(int Event);

        #endregion

        #region HEROES
        bool AddHero(Hero newHero);

        bool EditHeroByID(Hero newHero);

        bool EditHeroByName(Hero newHero, string Name);

        bool DelHeroByID(int ID);

        bool DelHeroByName(string Name);

        IEnumerable<Hero> GetHeroes();
        #endregion

        #region Maps

        bool AddMap(Map newMap);

        bool EditMapByID(Map newMap);

        bool EditMapByName(Map newMap, string Name);

        bool DelMapByID(int ID);

        bool DelMapByName(string Name);

        IEnumerable<Map> GetMaps();

        IEnumerable<Map> MoreWaves(int waves);

        IEnumerable<Map> LessWaves(int waves);

        #endregion

        #region Achievements

        IEnumerable<Achievement> AchCanLvl(int lvl);

        IEnumerable<Achievement> GetAchievements();

        #endregion

        #region GENERAL

        List<string> GetTables();

        IEnumerable<UserToTower> GetUsersToTowers();

        IEnumerable<UserToHero> GetUsersToHeroes();

        IEnumerable<EnemyToMap> GetEnemiesToMaps();

        IEnumerable<UserToAchievement> GetUsersToAchievements();

        IEnumerable<UserToEvent> GetUsersToEvents();

        IEnumerable<UserToGood> GetUsersToGoods();

        IEnumerable<UserToLevel> GetUsersToLevels();

        IEnumerable<UserToPower> GetUsersToPowers();

        IEnumerable<UserToPump> GetUsersToPumps();

        IEnumerable<Valuesofcharacteristic> GetValuesofcharacteristics();

        IEnumerable<Сharacteristic> GetСharacteristics();

        IEnumerable<Enemy> GetEnemies();

        IEnumerable<Equipment> GetEquipments();

        IEnumerable<EquipmentToHero> GetEquipmentsToHeroes();

        IEnumerable<Level> GetLevels();

        IEnumerable<Power> GetPowers();

        IEnumerable<Pump> GetPumps();

        #endregion

        #region EVENTS
        IEnumerable<Event> GetEvents();

        IEnumerable<Event> CurEvents();

        IEnumerable<Event> EventsByCondCount(int count);

        IEnumerable<Event> EventsGetSchedule(int year);

        int GetFullRewardEvents();
        #endregion

        #region TOWERS

        IEnumerable<Tower> GetTowers();

        #endregion

        #region GOODS

        int GetFullPriceAllGoods();

        IEnumerable<Good> GetGoods();

        #endregion
    }
}
