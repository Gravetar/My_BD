namespace BD
{
    class User
    {
        public int Id { get; }

        public string Name { get; set; }

        public int IsAdmin { get; set; }

        public int Money { get; set; }

        public User(int id, string name, int isAdmin, int money)
        {
            Id = id;
            Name = name;
            IsAdmin = isAdmin;
            Money = money;
        }
    }
}
