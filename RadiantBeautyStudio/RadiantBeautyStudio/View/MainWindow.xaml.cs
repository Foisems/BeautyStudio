﻿using Microsoft.Win32;
using RadiantBeautyStudio;
using RadiantBeautyStudio.Model;
using RadiantBeautyStudio.View;
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

namespace Radiant_Beauty_Studio.View
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private AddAppWindow addAppWindow;

        private int idRole = 0;
        public MainWindow(int IdRole)
        {

            InitializeComponent();

            dataGrid.ItemsSource = BeautyStudioDBEntities.GetContext().Appointment.ToList();
            dataGrid1.ItemsSource = BeautyStudioDBEntities.GetContext().Service.ToList();
            dataGrid2.ItemsSource = BeautyStudioDBEntities.GetContext().Client.ToList();
            dataGrid3.ItemsSource = BeautyStudioDBEntities.GetContext().Staffer.ToList();

            if (IdRole == 2)                                            //проверка на роль сотрудника
            {
                stafferTabItem.Visibility = Visibility.Collapsed;
                
                updateBtn.Visibility = Visibility.Collapsed;
                addBtn.Visibility = Visibility.Collapsed;
                delBtn.Visibility = Visibility.Collapsed;               
            }
            idRole = IdRole;
        }
       

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            App.Current.Shutdown();
        }
        // Выход
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
        }

        // печать
        private void Print(object sender, RoutedEventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();

         
            PrintDialog printDialog = new PrintDialog();

            if (printDialog.ShowDialog() == true)
            {
                FlowDocument doc = new FlowDocument();
                
                using (var context = new BeautyStudioDBEntities())
                {
                    //печать записей
                    if(appTabItem.IsSelected)
                    {
                        var allItem = context.Appointment.ToList();

                        foreach (var item in allItem)
                        {
                            Paragraph paragraph = new Paragraph();
                            var itemInfo = item;

                            if (itemInfo != null)
                            {
                                paragraph.Inlines.Add(new Run("Дата: " + itemInfo.Date));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Клиент: " + itemInfo.Client.FirstName + " " + itemInfo.Client.Surname + " " + itemInfo.Client.Patronymic));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Номер клиента: " + itemInfo.Client.PhoneNumber));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Услуга: " + itemInfo.Service.Name));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Цена: " + itemInfo.Service.Price));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Сотрудник: " + itemInfo.Staffer.FirstName + " " + itemInfo.Staffer.Surname + " " + itemInfo.Staffer.Patronymic));
                            }
                            doc.Blocks.Add(paragraph);
                            doc.Blocks.Add(new BlockUIContainer(new Separator()));
                        }
                    }
                    //печать услуг
                    if (serviceTabItem.IsSelected)
                    {
                        var allItem = context.Service.ToList();

                        foreach (var item in allItem)
                        {
                            Paragraph paragraph = new Paragraph();
                            var itemInfo = item;

                            if (itemInfo != null)
                            {
                                paragraph.Inlines.Add(new Run("Название услуги: " + itemInfo.Name));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Цена: " + itemInfo.Price));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Длительность: " + itemInfo.Time));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Тип услуги: " + itemInfo.TypeService.Name));
                            }
                            doc.Blocks.Add(paragraph);
                            doc.Blocks.Add(new BlockUIContainer(new Separator()));
                        }
                    }
                    //печать клиентов
                    if (clientTabItem.IsSelected)
                    {
                        var allItem = context.Client.ToList();

                        foreach (var item in allItem)
                        {
                            Paragraph paragraph = new Paragraph();
                            var itemInfo = item;

                            if (itemInfo != null)
                            {
                                paragraph.Inlines.Add(new Run("Имя: " + itemInfo.FirstName));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Фамилия: " + itemInfo.Surname));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Отчество: " + itemInfo.Patronymic));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Номер телефона: " + itemInfo.PhoneNumber));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Дата рождения: " + itemInfo.BirthDate?.ToShortDateString()));
                            }
                            doc.Blocks.Add(paragraph);
                            doc.Blocks.Add(new BlockUIContainer(new Separator()));
                        }
                    }
                    //печать сотрудников
                    if (stafferTabItem.IsSelected)
                    {
                        var allItem = context.Staffer.ToList();

                        foreach (var item in allItem)
                        {
                            Paragraph paragraph = new Paragraph();
                            var itemInfo = item;

                            if (itemInfo != null)
                            {
                                paragraph.Inlines.Add(new Run("Имя: " + itemInfo.FirstName));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Фамилия: " + itemInfo.Surname));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Отчество: " + itemInfo.Patronymic));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Номер телефона: " + itemInfo.PhoneNumber));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Должность: " + itemInfo.Staff.Name));
                                paragraph.Inlines.Add(new LineBreak());
                                paragraph.Inlines.Add(new Run("Зарплата: " + itemInfo.Staff.Salary));
                            }
                            doc.Blocks.Add(paragraph);
                            doc.Blocks.Add(new BlockUIContainer(new Separator()));
                        }
                    }
                }
               
                

                printDialog.PrintDocument(((IDocumentPaginatorSource)doc).DocumentPaginator, "Печать всех элементов");
            }

        }

        //добавление записи

        private void addBtn_Click(object sender, RoutedEventArgs e)
        {
            if (appTabItem.IsSelected)
            {
                addAppWindow = new AddAppWindow(null);
                addAppWindow.ShowDialog();
            }
        }

        private int item = 0;


        //вывод информации в tabcontrol
        private void tabControl_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
            string tabItem = ((sender as TabControl).SelectedItem as TabItem).Header as string;
            switch (tabItem)
            {
                case "Записи":
                    if (item == 1)
                    {
                        if (idRole == 2)                                            //проверка на роль сотрудника
                        {
                            stafferTabItem.Visibility = Visibility.Collapsed;

                            updateBtn.Visibility = Visibility.Collapsed;
                            addBtn.Visibility = Visibility.Collapsed;
                            delBtn.Visibility = Visibility.Collapsed;
                        }
                        else
                        {
                            updateBtn.Visibility = Visibility.Visible;
                            addBtn.Visibility = Visibility.Visible;
                            delBtn.Visibility = Visibility.Visible;
                            item = 0;
                        }
                    }
                    break;
                case "Клиенты":
                    if (idRole == 2)                                            
                    {
                        updateBtn.Visibility = Visibility.Collapsed;
                        addBtn.Visibility = Visibility.Collapsed;
                        delBtn.Visibility = Visibility.Collapsed;
                    }
                    else
                    {
                        updateBtn.Visibility = Visibility.Visible;
                        addBtn.Visibility = Visibility.Collapsed;
                        delBtn.Visibility = Visibility.Collapsed;
                        item = 1;
                    }
                   
                    break;
                case "Услуги":
                    updateBtn.Visibility = Visibility.Collapsed;
                    addBtn.Visibility = Visibility.Collapsed;
                    delBtn.Visibility = Visibility.Collapsed;
                    item = 1;
                    break;
                case "Сотрудники":
                    updateBtn.Visibility = Visibility.Collapsed;
                    addBtn.Visibility = Visibility.Collapsed;
                    delBtn.Visibility = Visibility.Collapsed;
                    item = 1;
                    break;
                default:
                    return;
            }
        }

       // обновление

        private void updateBtn_Click(object sender, RoutedEventArgs e)
        {
            //записи
            if (appTabItem.IsSelected)
            {
                BeautyStudioDBEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                dataGrid.ItemsSource = BeautyStudioDBEntities.GetContext().Appointment.ToList();
            }
            //клиенты
            if (clientTabItem.IsSelected)
            {
                BeautyStudioDBEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                dataGrid2.ItemsSource = BeautyStudioDBEntities.GetContext().Client.ToList();
            }
        }

        //удаление записи

        private void delBtn_Click(object sender, RoutedEventArgs e)
        {
            if (appTabItem.IsSelected)
            {
                var delApp = dataGrid.SelectedItems.Cast<Appointment>().ToList();
                if (MessageBox.Show($"Вы точно хотите удалить данные?", "Предупреждение", MessageBoxButton.YesNo,
                    MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    try
                    {
                        BeautyStudioDBEntities.GetContext().Appointment.RemoveRange(delApp);
                        BeautyStudioDBEntities.GetContext().SaveChanges();
                        MessageBox.Show("Данные удалены.");
                        dataGrid.ItemsSource = BeautyStudioDBEntities.GetContext().Appointment.ToList();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString());
                    }
                }
            }
        }
       

        // Редактирование записи
        private void btnChangeApp_Click(object sender, RoutedEventArgs e)
        {
            if (addAppWindow == null || !addAppWindow.IsVisible)
            {
                addAppWindow = new AddAppWindow((sender as Button).DataContext as Appointment);
                addAppWindow.Title = "Изменение записи";
                addAppWindow.Show();
            }
        }
    }
}
