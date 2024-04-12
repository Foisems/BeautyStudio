using Radiant_Beauty_Studio.View;
using RadiantBeautyStudio.Model;
using System;
using System.Collections.Generic;
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

namespace RadiantBeautyStudio.View
{
    /// <summary>
    /// Логика взаимодействия для AddAppWindow.xaml
    /// </summary>
    public partial class AddAppWindow : Window
    {
        private Appointment _currentAppointment = new Appointment();
        public AddAppWindow(Appointment selectAppointment)
        {
            InitializeComponent();
            if (selectAppointment != null)
            {
                _currentAppointment = selectAppointment;
            }

            DataContext = _currentAppointment;

            ComboClient.ItemsSource = BeautyStudioDBEntities.GetContext().Client.ToList();
            ComboService.ItemsSource = BeautyStudioDBEntities.GetContext().Service.ToList();
            ComboStaffer.ItemsSource = BeautyStudioDBEntities.GetContext().Staffer.ToList();
                                 
        }

        // Добавление клиента

        private void btnAddClient_Click(object sender, RoutedEventArgs e)
        {
            AddClientWindow addClientWindow = new AddClientWindow();
            addClientWindow.ShowDialog();
        }

        // Добавление записи

        private async void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            // Проверка на заполнение обязательных полей

            DateTime? date = dpAppDate.SelectedDate;
            using (BeautyStudioDBEntities db = new BeautyStudioDBEntities())
            {
                if(ComboClient.Text != null)
                {
                    Client text = (Client)ComboClient.Items[ComboClient.SelectedIndex];
                    _currentAppointment.Client = text;
                }
                if (ComboStaffer.Text != null)
                {
                    var text = (Staffer)ComboStaffer.Items[ComboStaffer.SelectedIndex];
                    _currentAppointment.Staffer = text;
                }
            }
                

            if (_currentAppointment.Client == null)
                errors.AppendLine("Выберите клиента");
            if (_currentAppointment.Staffer == null)
                errors.AppendLine("Выберите сотрудника");
            if (_currentAppointment.Service == null)
                errors.AppendLine("Выберите услугу");
            if (date == null)
                errors.AppendLine("Выберите дату");



            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
            }
            else
            {
                _currentAppointment.Date = (DateTime)date;

                Appointment existingApp = BeautyStudioDBEntities.GetContext().Appointment.FirstOrDefault(p => p.Id == _currentAppointment.Id);

                if (existingApp != null)
                {
                    // Обновляем данные о записи
                    existingApp.Client = _currentAppointment.Client;
                    existingApp.Staffer = _currentAppointment.Staffer;
                    existingApp.Service = _currentAppointment.Service;
                    existingApp.Date = _currentAppointment.Date;
                }
                // Добавляем новую запись
                else
                    BeautyStudioDBEntities.GetContext().Appointment.Add(_currentAppointment);

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
        public void UpdateComboBoxData()
        {
            ComboClient.ItemsSource = BeautyStudioDBEntities.GetContext().Client.ToList();
        }
    }
}
