using RadiantBeautyStudio.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using RadiantBeautyStudio.View;

namespace Radiant_Beauty_Studio.View
{
    /// <summary>
    /// Логика взаимодействия для AddClientWindow.xaml
    /// </summary>
    public partial class AddClientWindow : Window
    {
        private Client _currentClient = new Client();
        public AddClientWindow()
        {
            InitializeComponent();
            DataContext = _currentClient;
        }

        //Сохранение новго клиента

        private async void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            // Проверка на заполнение обязательных полей
            if (string.IsNullOrEmpty(_currentClient.FirstName))
                errors.AppendLine("Укажите имя клиента");
            if (string.IsNullOrEmpty(_currentClient.Surname))
                errors.AppendLine("Укажите фамилию клиента");
            if (string.IsNullOrEmpty(_currentClient.PhoneNumber))
                errors.AppendLine("Укажите номер телефона клиента");

            DateTime? date = dpBirthDate.SelectedDate;
            


            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
            }
            else
            {
                _currentClient.BirthDate = date;
                // Добавляем нового клиента
                BeautyStudioDBEntities.GetContext().Client.Add(_currentClient);

                try
                {
                    await BeautyStudioDBEntities.GetContext().SaveChangesAsync();
                    MessageBox.Show("Новая запись добавлена!");
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }

            }
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            AddAppWindow addAppWindow = Application.Current.Windows.OfType<AddAppWindow>().FirstOrDefault();

            if (addAppWindow != null)
            {
                // Обновляем данные в ComboBox в окне AddAppWindow
                addAppWindow.UpdateComboBoxData();
            }
        }
    }
}
