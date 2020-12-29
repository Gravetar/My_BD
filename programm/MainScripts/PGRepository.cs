using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace BD
{
    class PGRepository : IRepository
    {
        private readonly string connectionString = "server=localhost;user=root;database=towerdefensemain;password=Gotika701";

        #region USERS
        public bool AddUser(User newUser)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("INSERT INTO users (name, isadmin, money) VALUES (@name, @isadmin, @money);", connection);
                command.Parameters.AddWithValue("@name", newUser.Name);
                command.Parameters.AddWithValue("@isadmin", newUser.IsAdmin);
                command.Parameters.AddWithValue("@money", newUser.Money);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool EditUserByID(User newUser)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("UPDATE users SET name=@name, isadmin=@isadmin, money=@money WHERE id=@ID;", connection);
                command.Parameters.AddWithValue("@name", newUser.Name);
                command.Parameters.AddWithValue("@isadmin", newUser.IsAdmin);
                command.Parameters.AddWithValue("@money", newUser.Money);
                command.Parameters.AddWithValue("@ID", newUser.Id);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool EditUserByName(User newUser, string Name)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("UPDATE users SET name=@name, isadmin=@isadmin, money=@money WHERE name=@Name_in;", connection);
                command.Parameters.AddWithValue("@name", newUser.Name);
                command.Parameters.AddWithValue("@isadmin", newUser.IsAdmin);
                command.Parameters.AddWithValue("@money", newUser.Money);
                command.Parameters.AddWithValue("@Name_in", Name);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool DelUserByID(int ID)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("DELETE FROM users WHERE id=@ID;", connection);
                command.Parameters.AddWithValue("@ID", ID);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool DelUserByName(string Name)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("DELETE FROM users WHERE name=@Name_in;", connection);
                command.Parameters.AddWithValue("@Name_in", Name);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }

        public IEnumerable<User> GetUsers()
        {
            var result = new List<User>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new User(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2), reader.GetInt32(3)));
            }

            return result;
        }
        public IEnumerable<User> GetUsersBestMoney(int count)
        {
            var result = new List<User>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users ORDER BY money DESC LIMIT @count", connection);
            command.Parameters.AddWithValue("@count", count);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new User(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2), reader.GetInt32(3)));
            }

            return result;
        }
        public float GetPercentAdminUsers()
        {
            float result = 0.0f;

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT (SELECT COUNT(id) FROM users WHERE isadmin=true)/COUNT(id)*100 FROM users", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result = reader.GetFloat(0);
            }

            return result;
        }
        public float GetPercentNoAdminUsers()
        {
            float result=0.0f;

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT (SELECT COUNT(id) FROM users WHERE isadmin=false)/COUNT(id)*100 FROM users", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result=reader.GetFloat(0);
            }

            return result;
        }

        public List<string> GetCountTowersHeroesFromUser()
        {
            var result = new List<string>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand(   "SELECT u.id AS ID, (select COUNT(*) from users_to_towers where user_id=utt.user_id) as TOWERS, (select COUNT(*) " +
                                                    "from users_to_heroes where user_id = uth.user_id) as HEROES FROM users as u " +
                                                    "LEFT JOIN users_to_heroes AS uth " +
                                                    "ON uth.user_ID = u.id " +
                                                    "LEFT JOIN users_to_towers AS utt " +
                                                    "ON utt.user_ID = u.id " +
                                                    "GROUP By u.id; ", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(reader.GetString(0)+" "+ reader.GetString(1)+" "+ reader.GetString(2));
            }

            return result;
        }
        public int GetCompleteEvent(int Event)
        {
            int result = 0;

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT COUNT(*) FROM users_to_events WHERE event_id=@event", connection);
            command.Parameters.AddWithValue("@event", Event);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result = reader.GetInt32(0);
            }

            return result;
        }
        #endregion

        #region HEROES
        public bool AddHero(Hero newHero)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("INSERT INTO heroes (name, feature, biography, typeoffight, levelnumber) VALUES (@name, @feature, @biography, @typeoffight, @levelnumber);", connection);
                command.Parameters.AddWithValue("@name", newHero.Name);
                command.Parameters.AddWithValue("@feature", newHero.Feature);
                command.Parameters.AddWithValue("@biography", newHero.Biography);
                command.Parameters.AddWithValue("@typeoffight", newHero.TypeOfFight);
                command.Parameters.AddWithValue("@levelnumber", newHero.LevelNumber);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool EditHeroByID(Hero newHero)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("UPDATE heroes SET name=@name, feature=@feature, biography=@biography, typeoffight=@typeoffight, levelnumber=@levelnumber WHERE id=@ID;", connection);
                command.Parameters.AddWithValue("@name", newHero.Name);
                command.Parameters.AddWithValue("@feature", newHero.Feature);
                command.Parameters.AddWithValue("@biography", newHero.Biography);
                command.Parameters.AddWithValue("@typeoffight", newHero.TypeOfFight);
                command.Parameters.AddWithValue("@levelnumber", newHero.LevelNumber);
                command.Parameters.AddWithValue("@ID", newHero.Id);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool EditHeroByName(Hero newHero, string Name)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("UPDATE heroes SET name=@name, feature=@feature, biography=@biography, typeoffight=@typeoffight, levelnumber=@levelnumber WHERE name=@Name_in;", connection);
                command.Parameters.AddWithValue("@name", newHero.Name);
                command.Parameters.AddWithValue("@feature", newHero.Feature);
                command.Parameters.AddWithValue("@biography", newHero.Biography);
                command.Parameters.AddWithValue("@typeoffight", newHero.TypeOfFight);
                command.Parameters.AddWithValue("@levelnumber", newHero.LevelNumber);
                command.Parameters.AddWithValue("@Name_in", Name);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool DelHeroByID(int ID)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("DELETE FROM heroes WHERE id=@ID;", connection);
                command.Parameters.AddWithValue("@ID", ID);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool DelHeroByName(string Name)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("DELETE FROM heroes WHERE name=@Name_in;", connection);
                command.Parameters.AddWithValue("@Name_in", Name);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }

        public IEnumerable<Hero> GetHeroes()
        {
            var result = new List<Hero>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM heroes", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Hero(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4) , reader.GetInt32(5)));
            }

            return result;
        }
        #endregion

        #region MAPS
        public bool AddMap(Map newMap)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("INSERT INTO maps (name, waves, levelnumber) VALUES (@name, @waves, @levelnumber);", connection);
                command.Parameters.AddWithValue("@name", newMap.Name);
                command.Parameters.AddWithValue("@waves", newMap.Waves);
                command.Parameters.AddWithValue("@levelnumber", newMap.LevelNumber);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool EditMapByID(Map newMap)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("UPDATE maps SET name=@name, waves=@waves, levelnumber=@levelnumber WHERE id=@ID;", connection);
                command.Parameters.AddWithValue("@name", newMap.Name);
                command.Parameters.AddWithValue("@waves", newMap.Waves);
                command.Parameters.AddWithValue("@levelnumber", newMap.LevelNumber);
                command.Parameters.AddWithValue("@ID", newMap.Id);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool EditMapByName(Map newMap, string Name)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("UPDATE maps SET name=@name, waves=@waves, levelnumber=@levelnumber WHERE name=@Name_in;", connection);
                command.Parameters.AddWithValue("@name", newMap.Name);
                command.Parameters.AddWithValue("@waves", newMap.Waves);
                command.Parameters.AddWithValue("@levelnumber", newMap.LevelNumber);
                command.Parameters.AddWithValue("@Name_in", Name);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool DelMapByID(int ID)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("DELETE FROM maps WHERE id=@ID;", connection);
                command.Parameters.AddWithValue("@ID", ID);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }
        public bool DelMapByName(string Name)
        {
            try
            {
                using var connection = new MySqlConnection(connectionString);
                connection.Open();
                using var command = new MySqlCommand("DELETE FROM maps WHERE name=@Name_in;", connection);
                command.Parameters.AddWithValue("@Name_in", Name);

                command.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }

        public IEnumerable<Map> GetMaps()
        {
            var result = new List<Map>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM maps", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Map(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2), reader.GetInt32(3)));
            }

            return result;
        }
        public IEnumerable<Map> MoreWaves(int waves)
        {
            var result = new List<Map>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM maps WHERE waves>=@waves ORDER BY waves", connection);
            command.Parameters.AddWithValue("@waves", waves);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Map(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2), reader.GetInt32(3)));
            }

            return result;
        }
        public IEnumerable<Map> LessWaves(int waves)
        {
            var result = new List<Map>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM maps WHERE waves<=@waves ORDER BY waves DESC", connection);
            command.Parameters.AddWithValue("@waves", waves);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Map(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2), reader.GetInt32(3)));
            }

            return result;
        }
        #endregion

        #region GENERAL

        public List<string> GetTables()
        {
            var result = new List<string>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SHOW TABLES", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(reader.GetString(0));
            }

            return result;
        }

        public IEnumerable<UserToTower> GetUsersToTowers()
        {
            var result = new List<UserToTower>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users_to_towers", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new UserToTower(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2)));
            }

            return result;
        }

        public IEnumerable<UserToHero> GetUsersToHeroes()
        {
            var result = new List<UserToHero>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users_to_heroes", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new UserToHero(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2)));
            }

            return result;
        }

        public IEnumerable<EnemyToMap> GetEnemiesToMaps()
        {
            var result = new List<EnemyToMap>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM enemies_to_maps", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new EnemyToMap(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2)));
            }

            return result;
        }

        public IEnumerable<UserToAchievement> GetUsersToAchievements()
        {
            var result = new List<UserToAchievement>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users_to_achievements", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new UserToAchievement(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2)));
            }

            return result;
        }

        public IEnumerable<UserToEvent> GetUsersToEvents()
        {
            var result = new List<UserToEvent>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users_to_events", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new UserToEvent(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2)));
            }

            return result;
        }

        public IEnumerable<UserToGood> GetUsersToGoods()
        {
            var result = new List<UserToGood>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users_to_goods", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new UserToGood(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2)));
            }

            return result;
        }

        public IEnumerable<UserToLevel> GetUsersToLevels()
        {
            var result = new List<UserToLevel>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users_to_levels", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new UserToLevel(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2)));
            }

            return result;
        }

        public IEnumerable<UserToPower> GetUsersToPowers()
        {
            var result = new List<UserToPower>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users_to_powers", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new UserToPower(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2)));
            }

            return result;
        }

        public IEnumerable<UserToPump> GetUsersToPumps()
        {
            var result = new List<UserToPump>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users_to_pumps", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new UserToPump(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2), reader.GetInt32(3)));
            }

            return result;
        }

        public IEnumerable<EquipmentToHero> GetEquipmentsToHeroes()
        {
            var result = new List<EquipmentToHero>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM equipments_to_heroes", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new EquipmentToHero(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2)));
            }

            return result;
        }

        public IEnumerable<Сharacteristic> GetСharacteristics()
        {
            var result = new List<Сharacteristic>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM characteristic", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Сharacteristic(reader.GetInt32(0), reader.GetString(1)));
            }

            return result;
        }

        public IEnumerable<Valuesofcharacteristic> GetValuesofcharacteristics()
        {
            var result = new List<Valuesofcharacteristic>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM valuesofcharacteristic", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                #region ПРОВЕРКА НА NULL

                string power, equipment, hero, enemy, tower;

                try
                {
                    power = reader.GetString(3);
                }
                catch
                {
                    power = "NULL";
                }

                try
                {
                    equipment = reader.GetString(4);
                }
                catch
                {
                    equipment = "NULL";
                }

                try
                {
                    hero = reader.GetString(5);
                }
                catch
                {
                    hero = "NULL";
                }

                try
                {
                    enemy = reader.GetString(6);
                }
                catch
                {
                    enemy = "NULL";
                }

                try
                {
                    tower = reader.GetString(7);
                }
                catch
                {
                    tower = "NULL";
                }

                #endregion
                result.Add(new Valuesofcharacteristic(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2), power, equipment, hero, enemy, tower));
            }

            return result;
        }

        public IEnumerable<Enemy> GetEnemies()
        {
            var result = new List<Enemy>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM enemies", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Enemy(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2), reader.GetFloat(3), reader.GetInt32(4)));
            }

            return result;
        }

        public IEnumerable<Equipment> GetEquipments()
        {
            var result = new List<Equipment>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM equipments", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                string conditions;
                try
                {
                    conditions = reader.GetString(3);
                }
                catch
                {
                    conditions = "NULL";
                }
                result.Add(new Equipment(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), conditions));
            }

            return result;
        }

        public IEnumerable<Level> GetLevels()
        {
            var result = new List<Level>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM levels", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Level(reader.GetInt32(0)));
            }

            return result;
        }

        public IEnumerable<Power> GetPowers()
        {
            var result = new List<Power>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM powers", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Power(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3)));
            }

            return result;
        }

        public IEnumerable<Pump> GetPumps()
        {
            var result = new List<Pump>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM pumps", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Pump(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2)));
            }

            return result;
        }
        #endregion

        #region Achievements

        public IEnumerable<Achievement> AchCanLvl(int lvl)
        {
            var result = new List<Achievement>();
            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM achievements WHERE levelnumber<=@lvl order by LevelNumber;", connection);
            command.Parameters.AddWithValue("@lvl", lvl);

            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Achievement(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2), reader.GetInt32(3)));
            }

            return result;
        }

        public IEnumerable<Achievement> GetAchievements()
        {
            var result = new List<Achievement>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM achievements", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Achievement(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2), reader.GetInt32(3)));
            }

            return result;
        }

        #endregion

        #region EVENTS
        public IEnumerable<Event> GetEvents()
        {
            var result = new List<Event>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM events", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Event(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3), reader.GetInt32(4), reader.GetString(5), reader.GetString(6)));
            }

            return result;
        }

        public IEnumerable<Event> CurEvents()
        {
            var result = new List<Event>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM events WHERE datestart<=curdate()", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Event(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3), reader.GetInt32(4), reader.GetString(5), reader.GetString(6)));
            }

            return result;
        }

        public IEnumerable<Event> EventsByCondCount(int count)
        {
            var result = new List<Event>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM events WHERE countofconditions=@count", connection);
            command.Parameters.AddWithValue("@count", count);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Event(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3), reader.GetInt32(4), reader.GetString(5), reader.GetString(6)));
            }

            return result;
        }

        public int GetFullRewardEvents()
        {
            int result = 0;

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT SUM(Reward) as allrewards FROM events", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result = reader.GetInt32(0);
            }

            return result;
        }

        public IEnumerable<Event> EventsGetSchedule(int year)
        {
            var result = new List<Event>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT *FROM events as events where DATE_FORMAT(datestart, \"%Y\") = @year", connection);
            command.Parameters.AddWithValue("@year", year);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Event(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3), reader.GetInt32(4), reader.GetString(5), reader.GetString(6)));
            }

            return result;
        }
        #endregion

        #region TOWERS

        public IEnumerable<Tower> GetTowers()
        {
            var result = new List<Tower>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM towers", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Tower(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetInt32(4)));
            }

            return result;
        }

        #endregion

        #region GOODS

        public int GetFullPriceAllGoods()
        {
            int result = 0;

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT SUM(price) FROM goods", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result = reader.GetInt32(0);
            }

            return result;
        }

        public IEnumerable<Good> GetGoods()
        {
            var result = new List<Good>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM goods", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Good(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2)));
            }

            return result;
        }

        #endregion
    }
}
