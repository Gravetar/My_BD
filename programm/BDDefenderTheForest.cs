using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace BD
{

    public partial class BDDefenderTheForest : Form
    {

        public BDDefenderTheForest()
        {
            InitializeComponent();
            numNo_AdminUser.Controls[0].Visible = false;
        }

        #region Функции
        public void HideAll()
        {
            AddUser.Visible = false;
            EditUser.Visible = false;
            DelUser.Visible = false;
            AddHero.Visible = false;
            EditHero.Visible = false;
            DelHero.Visible = false;
            AddMap.Visible = false;
            EditMap.Visible = false;
            DelMap.Visible = false;
        }

        public void HideAll2()
        {
            AchCanLvl.Visible = false;
            MapFinWave.Visible = false;
            CurEvents.Visible = false;
            TopUsersMoney.Visible = false;
            ShowEventsByCond.Visible = false;
            No_AdminUser.Visible = false;
            ShowTHFromUser.Visible = false;
            UsersCompleteEvent.Visible = false;
            PriceAllGoods.Visible = false;
            FullRewardEvents.Visible = false;
            ScheduleEvents.Visible = false;
        }

        private void cmbMain_Changed(object sender, EventArgs e)
        {
            switch ((sender as ComboBox).Text)
            {
                case "Выберите действие":
                    HideAll();
                    break;
                case "Добавить пользователя":
                    HideAll();
                    AddUser.Visible = true;
                    break;
                case "Изменить пользователя":
                    HideAll();
                    EditUser.Visible = true;
                    break;
                case "Удалить пользователя":
                    HideAll();
                    DelUser.Visible = true;
                    break;
                case "Добавить героя":
                    HideAll();
                    AddHero.Visible = true;
                    break;
                case "Редактировать героя":
                    HideAll();
                    EditHero.Visible = true;
                    break;
                case "Удалить героя":
                    HideAll();
                    DelHero.Visible = true;
                    break;
                case "Добавить карту":
                    HideAll();
                    AddMap.Visible = true;
                    break;
                case "Редактировать карту":
                    HideAll();
                    EditMap.Visible = true;
                    break;
                case "Удалить карту":
                    HideAll();
                    DelMap.Visible = true;
                    break;
            }
        }

        private void cmbMain2_Changed(object sender, EventArgs e)
        {
            switch ((sender as ComboBox).Text)
            {
                case "Показать все достижения доступны до {...} уровня":
                    HideAll2();
                    AchCanLvl.Visible = true;
                    break;
                case "Показать карты где надо {пройти больше/меньше} {...} волн":
                    HideAll2();
                    MapFinWave.Visible = true;
                    break;
                case "Показать текущие ивенты":
                    HideAll2();
                    CurEvents.Visible = true;
                    break;
                case "Показать {...} пользователей с самой большой  игровой валютой":
                    HideAll2();
                    TopUsersMoney.Visible = true;
                    break;
                case "Показать евенты с количеством условий равное {...}":
                    HideAll2();
                    ShowEventsByCond.Visible = true;
                    break;
                case "Показать процент пользователей-(не)администраторов":
                    HideAll2();
                    No_AdminUser.Visible = true;
                    break;
                case "Показать количество открытых башен, героев у пользователей":
                    HideAll2();
                    ShowTHFromUser.Visible = true;
                    break;
                case "Показать количество пользователей, выполнивших  ивент {...}":
                    HideAll2();
                    PriceAllGoods.Visible = true;
                    break;
                case "Показать общую цену всех товаров":
                    HideAll2();
                    PriceAllGoods.Visible = true;
                    break;
                case "Показать общую награду за все ивенты":
                    HideAll2();
                    FullRewardEvents.Visible = true;
                    break;
                case "Составить расписание ивентов на {...} год":
                    HideAll2();
                    ScheduleEvents.Visible = true;
                    break;
                case "Выберите действие":
                    HideAll2();
                    break;
            }
        }
        #endregion


        private void btnAddUser_Click(object sender, EventArgs e)
        {
            try
            {
                IRepository myRep = new PGRepository();
                if (myRep.AddUser(new User(0, txtAddUser.Text, 0, 0))) Status.Text = "Пользователь успешно добавлен";
                else Status.Text = "Ошибка в заполнении пользователя";
            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }

        private void btnEditUser_Click(object sender, EventArgs e)
        {
            try
            {
                IRepository myRep = new PGRepository();
                int Admin;
                if (!chEditUser.Checked) Admin = 0;
                else Admin = 1;

                if (cmbUserEdit.Text=="ID=")
                {
                    if (myRep.EditUserByID(new User(Convert.ToInt32(txtEditUser_1.Text), txtEditUser.Text, Admin, Convert.ToInt32(numEditUser.Value)))) Status.Text = "Пользователь успешно изменен";
                    else Status.Text = "Ошибка в заполнении пользователя";
                }
                else if (cmbUserEdit.Text == "Никнейм=")
                {
                    if (myRep.EditUserByName(new User(0, txtEditUser.Text, Admin, Convert.ToInt32(numEditUser.Value)), txtEditUser_1.Text)) Status.Text = "Пользователь успешно изменен";
                    else Status.Text = "Ошибка в заполнении пользователя";
                }
            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }

        private void btnDelUser_Click(object sender, EventArgs e)
        {
            try
            {
                IRepository myRep = new PGRepository();
                if (cmbDelUser.Text == "ID=")
                {
                    if (myRep.DelUserByID(Convert.ToInt32(txtDelUser.Text))) Status.Text = "Пользователь успешно удален";
                    else Status.Text = "Ошибка в заполнении пользователя";
                }
                else if (cmbDelUser.Text == "Никнейм=")
                {
                    if (myRep.DelUserByName(txtDelUser.Text)) Status.Text = "Пользователь успешно удален";
                    else Status.Text = "Ошибка в заполнении пользователя";
                }
            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }

        private void btnAddHero_Click(object sender, EventArgs e)
        {
            try
            {
                IRepository myRep = new PGRepository();
                if (
                    myRep.AddHero(new Hero(0, txtAddHero.Text, rtbAddHero.Text, rtbAddHero_2.Text, cmbAddHero.Text, Convert.ToInt32(numAddHero.Value)))
                   ) 
                    Status.Text = "Герой успешно добавлен";
                else 
                    Status.Text = "Ошибка в заполнении героя";
            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }

        private void btnEditHero_Click(object sender, EventArgs e)
        {
            try
            {
                IRepository myRep = new PGRepository();


                if (cmbEditHero_1.Text == "ID=")
                {
                    if (myRep.EditHeroByID(new Hero(Convert.ToInt32(txtEditHero_1.Text), txtEditHero.Text, rtbEditHero.Text, rtbEditHero_1.Text, cmbEditHero.Text, Convert.ToInt32(numEditHero.Value)))) Status.Text = "Герой успешно изменен";
                    else Status.Text = "Ошибка в заполнении героя";
                }
                else if (cmbEditHero_1.Text == "Имя героя=")
                {
                    if (myRep.EditHeroByName(new Hero(0, txtEditHero.Text, rtbEditHero.Text, rtbEditHero_1.Text, cmbEditHero.Text, Convert.ToInt32(numEditHero.Value)), txtEditHero_1.Text)) Status.Text = "Герой успешно изменен";
                    else Status.Text = "Ошибка в заполнении героя";
                }
            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }

        private void btnDelHero_Click(object sender, EventArgs e)
        {
            try
            {
                IRepository myRep = new PGRepository();
                if (cmbDelHero.Text == "ID=")
                {
                    if (myRep.DelHeroByID(Convert.ToInt32(txtDelHero.Text))) Status.Text = "Герой успешно удален";
                    else Status.Text = "Ошибка в заполнении героя";
                }
                else if (cmbDelHero.Text == "Имя героя=")
                {
                    if (myRep.DelHeroByName(txtDelHero.Text)) Status.Text = "Герой успешно удален";
                    else Status.Text = "Ошибка в заполнении героя";
                }
            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }

        private void btnAddMap_Click(object sender, EventArgs e)
        {
            try
            {
                IRepository myRep = new PGRepository();
                if (myRep.AddMap(new Map(0, txtAddMap.Text, Convert.ToInt32(numAddMap.Value), Convert.ToInt32(numAddMap_1.Value)))) Status.Text = "Карта успешно добавлена";
                else Status.Text = "Ошибка в заполнении карты";
            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }

        private void btnEditMap_Click(object sender, EventArgs e)
        {
            try
            {
                IRepository myRep = new PGRepository();


                if (cmbEditMap.Text == "ID=")
                {
                    if (myRep.EditMapByID(new Map(Convert.ToInt32(txtEditMap.Text), txtEditMap_1.Text, Convert.ToInt32(numEditMap.Value), Convert.ToInt32(numEditMap_1.Value)))) Status.Text = "Карта успешно изменена";
                    else Status.Text = "Ошибка в заполнении карты";
                }
                else if (cmbEditMap.Text == "Название карты=")
                {
                    if (myRep.EditMapByName(new Map(0, txtEditMap_1.Text, Convert.ToInt32(numEditMap.Value), Convert.ToInt32(numEditMap_1.Value)), txtEditMap.Text)) Status.Text = "Карта успешно изменена";
                    else Status.Text = "Ошибка в заполнении карты";
                }
            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }

        private void btnDelMap_Click(object sender, EventArgs e)
        {
            try
            {
                IRepository myRep = new PGRepository();
                if (cmbDelMap.Text == "ID=")
                {
                    if (myRep.DelMapByID(Convert.ToInt32(txtDelMap.Text))) Status.Text = "Карта успешно удалена";
                    else Status.Text = "Ошибка в заполнении карты";
                }
                else if (cmbDelMap.Text == "Название карты=")
                {
                    if (myRep.DelMapByName(txtDelMap.Text)) Status.Text = "Карта успешно удалена";
                    else Status.Text = "Ошибка в заполнении карты";
                }
            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }

        private void btnShow_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            MainList.Clear();
            if (cmbMain3.Text == "Все таблицы")
            {
                MainList.Columns.Add("Таблицы в базе данных:", 200, HorizontalAlignment.Left);

                var tables = myRep.GetTables();

                foreach (var table in tables)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    MainListInit.Text = table.ToString();

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Пользователи")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("isadmin", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("money", 100, HorizontalAlignment.Left);

                var users = myRep.GetUsers();


                foreach (var user in users)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_isadmin = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_money = new ListViewItem.ListViewSubItem();

                    string Admin = "Нет";
                    if (user.IsAdmin == 1) Admin = "Да";

                    MainListInit.Text = user.Id.ToString();
                    field_name.Text = user.Name;
                    field_isadmin.Text = Admin;
                    field_money.Text = user.Money.ToString();

                    MainListInit.SubItems.Add(field_name);
                    MainListInit.SubItems.Add(field_isadmin);
                    MainListInit.SubItems.Add(field_money);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Усиления")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("feature", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("price", 100, HorizontalAlignment.Left);

                var powers = myRep.GetPowers();


                foreach (var power in powers)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_feature = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_price = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = power.Id.ToString();
                    field_name.Text = power.Name;
                    field_feature.Text = power.feature;
                    field_price.Text = power.price.ToString();

                    MainListInit.SubItems.Add(field_name);
                    MainListInit.SubItems.Add(field_feature);
                    MainListInit.SubItems.Add(field_price);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Прокачки")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("price", 100, HorizontalAlignment.Left);

                var pumps = myRep.GetPumps();


                foreach (var pump in pumps)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_price = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = pump.Id.ToString();
                    field_name.Text = pump.Name;
                    field_price.Text = pump.price.ToString();

                    MainListInit.SubItems.Add(field_name);
                    MainListInit.SubItems.Add(field_price);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Уровни")
            {
                MainList.Columns.Add("number", 100, HorizontalAlignment.Left);

                var levels = myRep.GetLevels();


                foreach (var level in levels)
                {
                    ListViewItem MainListInit = new ListViewItem();

                    MainListInit.Text = level.Number.ToString();

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Герои")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("feature", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("biography", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("type_of_fight", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("levelnumber", 100, HorizontalAlignment.Left);

                var heroes = myRep.GetHeroes();


                foreach (var hero in heroes)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_feature = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_biography = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_typeoffight = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_levelnumber = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = hero.Id.ToString();
                    field_name.Text = hero.Name;
                    field_feature.Text = hero.Feature;
                    field_biography.Text = hero.Biography;
                    field_typeoffight.Text = hero.TypeOfFight;
                    field_levelnumber.Text = hero.LevelNumber.ToString();

                    MainListInit.SubItems.Add(field_name);
                    MainListInit.SubItems.Add(field_feature);
                    MainListInit.SubItems.Add(field_biography);
                    MainListInit.SubItems.Add(field_typeoffight);
                    MainListInit.SubItems.Add(field_levelnumber);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Карты")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("waves", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("levelnumber", 100, HorizontalAlignment.Left);

                var maps = myRep.GetMaps();


                foreach (var map in maps)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_waves = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_levelnumber = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = map.Id.ToString();
                    field_name.Text = map.Name;
                    field_waves.Text = map.Waves.ToString();
                    field_levelnumber.Text = map.LevelNumber.ToString();

                    MainListInit.SubItems.Add(field_name);
                    MainListInit.SubItems.Add(field_waves);
                    MainListInit.SubItems.Add(field_levelnumber);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Достижения")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("reward", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("levelnumber", 100, HorizontalAlignment.Left);

                var Achievements = myRep.GetAchievements();


                foreach (var Achievement in Achievements)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_reward = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_levelnumber = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = Achievement.Id.ToString();
                    field_name.Text = Achievement.Name;
                    field_reward.Text = Achievement.Reward.ToString();
                    field_levelnumber.Text = Achievement.LevelNumber.ToString();

                    MainListInit.SubItems.Add(field_name);
                    MainListInit.SubItems.Add(field_reward);
                    MainListInit.SubItems.Add(field_levelnumber);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "События")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("description", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("conditions", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("count_of_conditions", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("reward", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("datestart", 100, HorizontalAlignment.Left);

                var Events = myRep.GetEvents();


                foreach (var Event in Events)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_description = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_conditions = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_count_of_conditions = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_reward = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_datestart = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = Event.Id.ToString();
                    field_description.Text = Event.description;
                    field_conditions.Text = Event.conditions;
                    field_count_of_conditions.Text = Event.countofconditions.ToString();
                    field_reward.Text = Event.reward.ToString();
                    field_name.Text = Event.name;
                    field_datestart.Text = Event.datestart;

                    MainListInit.SubItems.Add(field_description);
                    MainListInit.SubItems.Add(field_conditions);
                    MainListInit.SubItems.Add(field_count_of_conditions);
                    MainListInit.SubItems.Add(field_reward);
                    MainListInit.SubItems.Add(field_name);
                    MainListInit.SubItems.Add(field_datestart);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Башни")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("modelURL", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("ImageURL", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("LevelNumber", 100, HorizontalAlignment.Left);

                var Towers = myRep.GetTowers();


                foreach (var Tower in Towers)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_modelURL = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_ImageURL = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_LevelNumber = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = Tower.Id.ToString();
                    field_name.Text = Tower.Name;
                    field_modelURL.Text = Tower.ModelURL;
                    field_ImageURL.Text = Tower.ImageURL;
                    field_LevelNumber.Text = Tower.LevelNumber.ToString();

                    MainListInit.SubItems.Add(field_name);
                    MainListInit.SubItems.Add(field_modelURL);
                    MainListInit.SubItems.Add(field_ImageURL);
                    MainListInit.SubItems.Add(field_LevelNumber);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Характеристики")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);

                var characteristics = myRep.GetСharacteristics();


                foreach (var characteristic in characteristics)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = characteristic.Id.ToString();
                    field_name.Text = characteristic.Name;

                    MainListInit.SubItems.Add(field_name);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Враги")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("modelURL", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("health", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("speed", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("reward", 100, HorizontalAlignment.Left);

                var Enemies = myRep.GetEnemies();


                foreach (var Enemy in Enemies)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_modelURL = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_health = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_speed = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_reward = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = Enemy.Id.ToString();
                    field_modelURL.Text = Enemy.ModelURL;
                    field_health.Text = Enemy.health.ToString();
                    field_speed.Text = Enemy.speed.ToString();
                    field_reward.Text = Enemy.reward.ToString();

                    MainListInit.SubItems.Add(field_modelURL);
                    MainListInit.SubItems.Add(field_health);
                    MainListInit.SubItems.Add(field_speed);
                    MainListInit.SubItems.Add(field_reward);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Товары")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("price", 100, HorizontalAlignment.Left);

                var Goods = myRep.GetGoods();


                foreach (var Good in Goods)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_price = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = Good.Id.ToString();
                    field_name.Text = Good.Name;
                    field_price.Text = Good.price.ToString();

                    MainListInit.SubItems.Add(field_name);
                    MainListInit.SubItems.Add(field_price);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Экипировки")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("name", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("description", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("conditions", 100, HorizontalAlignment.Left);

                var Equipments = myRep.GetEquipments();


                foreach (var Equipment in Equipments)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_description = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_conditions = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = Equipment.Id.ToString();
                    field_name.Text = Equipment.Name;
                    field_description.Text = Equipment.description;
                    field_conditions.Text = Equipment.conditions;

                    MainListInit.SubItems.Add(field_name);
                    MainListInit.SubItems.Add(field_description);
                    MainListInit.SubItems.Add(field_conditions);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Значения характеристик")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("value", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("characteristic_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("power_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("equipment_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("hero_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("enemy_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("tower_id", 100, HorizontalAlignment.Left);

                var ValuesOfCharacteristics = myRep.GetValuesofcharacteristics();


                foreach (var ValuesOfCharacteristic in ValuesOfCharacteristics)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_value = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_characteristic_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_power_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_equipment_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_hero_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_enemy_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_tower_id = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = ValuesOfCharacteristic.Id.ToString();
                    field_value.Text = ValuesOfCharacteristic.value.ToString();
                    field_characteristic_id.Text = ValuesOfCharacteristic.characteristic_id.ToString();
                    field_power_id.Text = ValuesOfCharacteristic.power_id;
                    field_equipment_id.Text = ValuesOfCharacteristic.equipment_id;
                    field_hero_id.Text = ValuesOfCharacteristic.hero_id;
                    field_enemy_id.Text = ValuesOfCharacteristic.enemy_id;
                    field_tower_id.Text = ValuesOfCharacteristic.tower_id;

                    MainListInit.SubItems.Add(field_value);
                    MainListInit.SubItems.Add(field_characteristic_id);
                    MainListInit.SubItems.Add(field_power_id);
                    MainListInit.SubItems.Add(field_equipment_id);
                    MainListInit.SubItems.Add(field_hero_id);
                    MainListInit.SubItems.Add(field_enemy_id);
                    MainListInit.SubItems.Add(field_tower_id);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Пользователи-Башни")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("user_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("tower_id", 100, HorizontalAlignment.Left);

                var UsersToTowers = myRep.GetUsersToTowers();


                foreach (var UserToTower in UsersToTowers)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_user_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_tower_id = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = UserToTower.Id.ToString();
                    field_user_id.Text = UserToTower.user_id.ToString();
                    field_tower_id.Text = UserToTower.tower_id.ToString();

                    MainListInit.SubItems.Add(field_user_id);
                    MainListInit.SubItems.Add(field_tower_id);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Пользователи-Герои")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("user_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("hero_id", 100, HorizontalAlignment.Left);

                var UsersToHeroes = myRep.GetUsersToHeroes();


                foreach (var UserToHeroe in UsersToHeroes)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_user_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_hero_id = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = UserToHeroe.Id.ToString();
                    field_user_id.Text = UserToHeroe.user_id.ToString();
                    field_hero_id.Text = UserToHeroe.hero_id.ToString();

                    MainListInit.SubItems.Add(field_user_id);
                    MainListInit.SubItems.Add(field_hero_id);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Пользователи-Достижения")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("user_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("achievement_id", 100, HorizontalAlignment.Left);

                var UsersToAchievements = myRep.GetUsersToAchievements();


                foreach (var UserToAchievement in UsersToAchievements)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_user_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_achievement_id = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = UserToAchievement.Id.ToString();
                    field_user_id.Text = UserToAchievement.user_id.ToString();
                    field_achievement_id.Text = UserToAchievement.achievement_id.ToString();

                    MainListInit.SubItems.Add(field_user_id);
                    MainListInit.SubItems.Add(field_achievement_id);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Пользователи-События")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("user_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("event_id", 100, HorizontalAlignment.Left);

                var UsersToEvents = myRep.GetUsersToEvents();


                foreach (var UserToEvent in UsersToEvents)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_user_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_event_id = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = UserToEvent.Id.ToString();
                    field_user_id.Text = UserToEvent.user_id.ToString();
                    field_event_id.Text = UserToEvent.event_id.ToString();

                    MainListInit.SubItems.Add(field_user_id);
                    MainListInit.SubItems.Add(field_event_id);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Пользователи-Товары")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("user_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("good_id", 100, HorizontalAlignment.Left);

                var UsersToGoods = myRep.GetUsersToGoods();


                foreach (var UserToGood in UsersToGoods)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_user_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_good_id = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = UserToGood.Id.ToString();
                    field_user_id.Text = UserToGood.user_id.ToString();
                    field_good_id.Text = UserToGood.good_id.ToString();

                    MainListInit.SubItems.Add(field_user_id);
                    MainListInit.SubItems.Add(field_good_id);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Пользователи-Уровни")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("user_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("level_id", 100, HorizontalAlignment.Left);

                var UsersToLevels = myRep.GetUsersToLevels();


                foreach (var UserToLevel in UsersToLevels)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_user_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_level_id = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = UserToLevel.Id.ToString();
                    field_user_id.Text = UserToLevel.user_id.ToString();
                    field_level_id.Text = UserToLevel.level_id.ToString();

                    MainListInit.SubItems.Add(field_user_id);
                    MainListInit.SubItems.Add(field_level_id);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Пользователи-Усиления")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("user_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("power_id", 100, HorizontalAlignment.Left);

                var UsersToPowers = myRep.GetUsersToPowers();


                foreach (var UserToPower in UsersToPowers)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_user_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_power_id = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = UserToPower.Id.ToString();
                    field_user_id.Text = UserToPower.user_id.ToString();
                    field_power_id.Text = UserToPower.power_id.ToString();

                    MainListInit.SubItems.Add(field_user_id);
                    MainListInit.SubItems.Add(field_power_id);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Пользователи-Прокачки")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("user_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("pump_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("level", 100, HorizontalAlignment.Left);

                var UsersToPumps = myRep.GetUsersToPumps();


                foreach (var UserToPump in UsersToPumps)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_user_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_pump_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_level = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = UserToPump.Id.ToString();
                    field_user_id.Text = UserToPump.user_id.ToString();
                    field_pump_id.Text = UserToPump.pump_id.ToString();
                    field_level.Text = UserToPump.level.ToString();

                    MainListInit.SubItems.Add(field_user_id);
                    MainListInit.SubItems.Add(field_pump_id);
                    MainListInit.SubItems.Add(field_level);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Враги-Карты")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("enemy_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("map_id", 100, HorizontalAlignment.Left);

                var EnemiesToMaps = myRep.GetEnemiesToMaps();


                foreach (var EnemyToMap in EnemiesToMaps)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_enemy_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_map_id = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = EnemyToMap.Id.ToString();
                    field_enemy_id.Text = EnemyToMap.enemy_id.ToString();
                    field_map_id.Text = EnemyToMap.map_id.ToString();

                    MainListInit.SubItems.Add(field_enemy_id);
                    MainListInit.SubItems.Add(field_map_id);

                    MainList.Items.Add(MainListInit);
                }
            }
            else if (cmbMain3.Text == "Экипировки-Герои")
            {
                MainList.Columns.Add("id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("equipment_id", 100, HorizontalAlignment.Left);
                MainList.Columns.Add("hero_id", 100, HorizontalAlignment.Left);

                var EquipmentsToHeroes = myRep.GetEquipmentsToHeroes();


                foreach (var EquipmentToHero in EquipmentsToHeroes)
                {
                    ListViewItem MainListInit = new ListViewItem();
                    ListViewItem.ListViewSubItem field_equipment_id = new ListViewItem.ListViewSubItem();
                    ListViewItem.ListViewSubItem field_hero_id = new ListViewItem.ListViewSubItem();

                    MainListInit.Text = EquipmentToHero.Id.ToString();
                    field_equipment_id.Text = EquipmentToHero.equipment_id.ToString();
                    field_hero_id.Text = EquipmentToHero.hero_id.ToString();

                    MainListInit.SubItems.Add(field_equipment_id);
                    MainListInit.SubItems.Add(field_hero_id);

                    MainList.Items.Add(MainListInit);
                }
            }
        }

        private void btnAchCanLvl_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            listAchCanLvl.Clear();

            listAchCanLvl.Columns.Add("id", 100, HorizontalAlignment.Left);
            listAchCanLvl.Columns.Add("name", 100, HorizontalAlignment.Left);
            listAchCanLvl.Columns.Add("reward", 100, HorizontalAlignment.Left);
            listAchCanLvl.Columns.Add("levelnumber", 100, HorizontalAlignment.Left);

            var achievements = myRep.AchCanLvl(Convert.ToInt32(numAchCanLvl.Value));

            foreach (var achievement in achievements)
            {
                ListViewItem ListInit = new ListViewItem();
                ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_reward = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_levelnumber = new ListViewItem.ListViewSubItem();

                ListInit.Text = achievement.Id.ToString();
                field_name.Text = achievement.Name;
                field_reward.Text = achievement.Reward.ToString();
                field_levelnumber.Text = achievement.LevelNumber.ToString();

                ListInit.SubItems.Add(field_name);
                ListInit.SubItems.Add(field_reward);
                ListInit.SubItems.Add(field_levelnumber);

                listAchCanLvl.Items.Add(ListInit);
            }
        }

        private void btnMapFinWave_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            listMapFinWave.Clear();

            listMapFinWave.Columns.Add("id", 100, HorizontalAlignment.Left);
            listMapFinWave.Columns.Add("name", 100, HorizontalAlignment.Left);
            listMapFinWave.Columns.Add("waves", 100, HorizontalAlignment.Left);
            listMapFinWave.Columns.Add("levelnumber", 100, HorizontalAlignment.Left);

            var maps=myRep.MoreWaves(Convert.ToInt32(numMapFinWave.Value));
            if (cmbMapFinWave.Text == "Меньше") maps = myRep.LessWaves(Convert.ToInt32(numMapFinWave.Value));

            foreach (var map in maps)
            {
                ListViewItem ListInit = new ListViewItem();
                ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_waves = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_levelnumber = new ListViewItem.ListViewSubItem();

                ListInit.Text = map.Id.ToString();
                field_name.Text = map.Name;
                field_waves.Text = map.Waves.ToString();
                field_levelnumber.Text = map.LevelNumber.ToString();

                ListInit.SubItems.Add(field_name);
                ListInit.SubItems.Add(field_waves);
                ListInit.SubItems.Add(field_levelnumber);

                listMapFinWave.Items.Add(ListInit);
            }

        }

        private void btnCurEvents_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            listCurEvents.Clear();

            listCurEvents.Columns.Add("id", 100, HorizontalAlignment.Left);
            listCurEvents.Columns.Add("description", 100, HorizontalAlignment.Left);
            listCurEvents.Columns.Add("conditions", 100, HorizontalAlignment.Left);
            listCurEvents.Columns.Add("count_of_conditions", 100, HorizontalAlignment.Left);
            listCurEvents.Columns.Add("reward", 100, HorizontalAlignment.Left);
            listCurEvents.Columns.Add("name", 100, HorizontalAlignment.Left);
            listCurEvents.Columns.Add("datestart", 100, HorizontalAlignment.Left);

            var events = myRep.CurEvents();

            foreach (var Event in events)
            {
                ListViewItem ListInit = new ListViewItem();
                ListViewItem.ListViewSubItem field_description = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_conditions = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_count_of_conditions = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_reward = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_datestart = new ListViewItem.ListViewSubItem();

                ListInit.Text = Event.Id.ToString();
                field_description.Text = Event.description;
                field_conditions.Text = Event.conditions;
                field_count_of_conditions.Text = Event.countofconditions.ToString();
                field_reward.Text = Event.reward.ToString();
                field_name.Text = Event.name;
                field_datestart.Text = Event.datestart;

                ListInit.SubItems.Add(field_description);
                ListInit.SubItems.Add(field_conditions);
                ListInit.SubItems.Add(field_count_of_conditions);
                ListInit.SubItems.Add(field_reward);
                ListInit.SubItems.Add(field_name);
                ListInit.SubItems.Add(field_datestart);

                listCurEvents.Items.Add(ListInit);
            }
        }

        private void btnTopUsersMoney_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            listTopUsersMoney.Clear();

            listTopUsersMoney.Columns.Add("id", 100, HorizontalAlignment.Left);
            listTopUsersMoney.Columns.Add("name", 100, HorizontalAlignment.Left);
            listTopUsersMoney.Columns.Add("isadmin", 100, HorizontalAlignment.Left);
            listTopUsersMoney.Columns.Add("money", 100, HorizontalAlignment.Left);

            var users = myRep.GetUsersBestMoney(Convert.ToInt32(numTopUsersMoney.Value));


            foreach (var user in users)
            {
                ListViewItem ListInit = new ListViewItem();
                ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_isadmin = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_money = new ListViewItem.ListViewSubItem();

                string Admin = "Нет";
                if (user.IsAdmin == 1) Admin = "Да";

                ListInit.Text = user.Id.ToString();
                field_name.Text = user.Name;
                field_isadmin.Text = Admin;
                field_money.Text = user.Money.ToString();

                ListInit.SubItems.Add(field_name);
                ListInit.SubItems.Add(field_isadmin);
                ListInit.SubItems.Add(field_money);

                listTopUsersMoney.Items.Add(ListInit);
            }
        }

        private void btnShowEventsByCond_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            listShowEventsByCond.Clear();

            listShowEventsByCond.Columns.Add("id", 100, HorizontalAlignment.Left);
            listShowEventsByCond.Columns.Add("description", 100, HorizontalAlignment.Left);
            listShowEventsByCond.Columns.Add("conditions", 100, HorizontalAlignment.Left);
            listShowEventsByCond.Columns.Add("count_of_conditions", 100, HorizontalAlignment.Left);
            listShowEventsByCond.Columns.Add("reward", 100, HorizontalAlignment.Left);
            listShowEventsByCond.Columns.Add("name", 100, HorizontalAlignment.Left);
            listShowEventsByCond.Columns.Add("datestart", 100, HorizontalAlignment.Left);

            var Events = myRep.EventsByCondCount(Convert.ToInt32(numShowEventsByCond.Value));


            foreach (var Event in Events)
            {
                ListViewItem ListInit = new ListViewItem();
                ListViewItem.ListViewSubItem field_description = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_conditions = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_count_of_conditions = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_reward = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_datestart = new ListViewItem.ListViewSubItem();

                ListInit.Text = Event.Id.ToString();
                field_description.Text = Event.description;
                field_conditions.Text = Event.conditions;
                field_count_of_conditions.Text = Event.countofconditions.ToString();
                field_reward.Text = Event.reward.ToString();
                field_name.Text = Event.name;
                field_datestart.Text = Event.datestart;

                ListInit.SubItems.Add(field_description);
                ListInit.SubItems.Add(field_conditions);
                ListInit.SubItems.Add(field_count_of_conditions);
                ListInit.SubItems.Add(field_reward);
                ListInit.SubItems.Add(field_name);
                ListInit.SubItems.Add(field_datestart);

                listShowEventsByCond.Items.Add(ListInit);
            }
        }

        private void btnNo_AdminUser_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            if (cmbNo_AdminUser.Text=="Администраторы")
            numNo_AdminUser.Value = Convert.ToDecimal(myRep.GetPercentAdminUsers());
            else
                numNo_AdminUser.Value = Convert.ToDecimal(myRep.GetPercentNoAdminUsers());
        }

        private void btnShowTHFromUser_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            listShowTHFromUser.Clear();

            listShowTHFromUser.Columns.Add("ID пользователя", 120, HorizontalAlignment.Left);
            listShowTHFromUser.Columns.Add("Количество башен", 120, HorizontalAlignment.Left);
            listShowTHFromUser.Columns.Add("Количество героев", 120, HorizontalAlignment.Left);

            var results = myRep.GetCountTowersHeroesFromUser();

            foreach (var result in results)
            {
                ListViewItem ListInit = new ListViewItem();
                ListViewItem.ListViewSubItem field_towers = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_heroes = new ListViewItem.ListViewSubItem();

                List<string> OutString = new List<string>();
                OutString.AddRange(result.ToString().Split(' '));

               
                ListInit.Text = OutString[0];
                field_towers.Text = OutString[1];
                field_heroes.Text = OutString[2];

                ListInit.SubItems.Add(field_towers);
                ListInit.SubItems.Add(field_heroes);

                listShowTHFromUser.Items.Add(ListInit);
            }
        }

        private void btnUsersCompleteEvent_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
                txtUsersCompleteEvent.Text=myRep.GetCompleteEvent(Convert.ToInt32(numUsersCompleteEvent.Value)).ToString();
        }

        private void btnPriceAllGoods_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            txtPriceAllGoods.Text = myRep.GetFullPriceAllGoods().ToString();
        }

        private void btnFullRewardEvents_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            txtFullRewardEvents.Text = myRep.GetFullRewardEvents().ToString();
        }

        private void btnScheduleEvents_Click(object sender, EventArgs e)
        {
            IRepository myRep = new PGRepository();
            listScheduleEvents.Clear();

            listScheduleEvents.Columns.Add("id", 100, HorizontalAlignment.Left);
            listScheduleEvents.Columns.Add("description", 100, HorizontalAlignment.Left);
            listScheduleEvents.Columns.Add("conditions", 100, HorizontalAlignment.Left);
            listScheduleEvents.Columns.Add("count_of_conditions", 100, HorizontalAlignment.Left);
            listScheduleEvents.Columns.Add("reward", 100, HorizontalAlignment.Left);
            listScheduleEvents.Columns.Add("name", 100, HorizontalAlignment.Left);
            listScheduleEvents.Columns.Add("datestart", 100, HorizontalAlignment.Left);

            var Events = myRep.EventsGetSchedule(Convert.ToInt32(txtScheduleEvents.Text));


            foreach (var Event in Events)
            {
                ListViewItem ListInit = new ListViewItem();
                ListViewItem.ListViewSubItem field_description = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_conditions = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_count_of_conditions = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_reward = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_name = new ListViewItem.ListViewSubItem();
                ListViewItem.ListViewSubItem field_datestart = new ListViewItem.ListViewSubItem();

                ListInit.Text = Event.Id.ToString();
                field_description.Text = Event.description;
                field_conditions.Text = Event.conditions;
                field_count_of_conditions.Text = Event.countofconditions.ToString();
                field_reward.Text = Event.reward.ToString();
                field_name.Text = Event.name;
                field_datestart.Text = Event.datestart;

                ListInit.SubItems.Add(field_description);
                ListInit.SubItems.Add(field_conditions);
                ListInit.SubItems.Add(field_count_of_conditions);
                ListInit.SubItems.Add(field_reward);
                ListInit.SubItems.Add(field_name);
                ListInit.SubItems.Add(field_datestart);

                listScheduleEvents.Items.Add(ListInit);
            }
        }
    }
}
