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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace Návěstidlo.stranky
{
    /// <summary>
    /// Interakční logika pro teorie.xaml
    /// </summary>
    public partial class teorie : Page
    {
        public teorie()
        {
            InitializeComponent();
            signalpick.SelectedIndex = 0;
        }
        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            ComboBoxItem ComboItem = (ComboBoxItem)signalpick.SelectedItem;
            string vybran = ComboItem.Name;

        }
        internal string vybran;
        private void ComboBox_DropDownClosed(object sender, EventArgs e)
        {
            ComboBoxItem ComboItem = (ComboBoxItem)((ComboBox)sender).SelectedItem;
            if (ComboItem != null)                                                         
            {
                string vybran = ComboItem.Name;
                if (vybran != "placeholder")
                npages.Navigate(new Navestp(vybran)); 
                
                
            }
        }
    }
}
