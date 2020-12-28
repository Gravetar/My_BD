using MySql.Data.MySqlClient;
using Npgsql;
using System;
using System.Collections.Generic;

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
            catch
            {
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
            catch
            {
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
            catch
            {
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
            catch
            {
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
            catch
            {
                return false;
            }
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
            catch
            {
                return false;
            }
        }
        #endregion
        public IEnumerable<User> GetUsers()
        {
            var result = new List<User>();

            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            using var command = new MySqlCommand("SELECT * FROM users", connection);
            using var reader = command.ExecuteReader();

            while(reader.Read())
            {
                result.Add(new User(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2), reader.GetInt32(3)));
            }

            return result;
        }
    }
}
