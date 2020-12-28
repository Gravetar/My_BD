using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using Npgsql;

namespace BD
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        #region Функции
        public void HideAll()
        {
            AddUser.Visible = false;
            EditUser.Visible = false;
            DelUser.Visible = false;
            AddHero.Visible = false;
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
    }
}
