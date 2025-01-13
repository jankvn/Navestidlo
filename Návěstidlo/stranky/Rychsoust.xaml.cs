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

namespace Návěstidlo.stranky
{
    /// <summary>
    /// Interaction logic for Rychsoust.xaml
    /// </summary>
    public partial class Rychsoust : Page
    {
        public Rychsoust()
        {
            InitializeComponent();
            vybrych1.SelectedIndex = 0;
            vybrych2.SelectedIndex = 0;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            ComboBoxItem ComboItem = (ComboBoxItem)vybrych1.SelectedItem;
            string vybran = ComboItem.Name;
            ComboBoxItem ComboItem2 = (ComboBoxItem)vybrych2.SelectedItem;
            string vybran2 = ComboItem2.Name;
            MessageBox.Show(vybran + vybran2);
            sigshow.Navigate(new Navestp(vybran+vybran2));
            /* if (ComboItem != null)
             {
                 string vybran = ComboItem.Name;
                 if (vybran != "placeholder")
                     npages.Navigate(new Navestp(vybran));
             }*/
        }
        private void ComboBox_DropDownClosed(object sender, EventArgs e)
        {
            ComboBoxItem ComboItem = (ComboBoxItem)vybrych1.SelectedItem;
            ComboBoxItem ComboItem2 = (ComboBoxItem)vybrych2.SelectedItem;
            string vybran = ComboItem.Name;
            string vybran2 = ComboItem2.Name;
            if (vybran2 == "em1" && vybran == "em")
            {
                MainWindow win = (MainWindow)MainWindow.GetWindow(this);
                win.Showmessage("Neplatné zadání!", "Chyba", "Chyba");
            }
            if (vybran != "em" && vybran2 != "em1")
            {
                sigshow.Navigate(new Navestp(vybran + vybran2));
            }
            if (ComboItem == null)
            {
                MessageBox.Show("Vyberte prosím jednu z návěstí");
            }
            if (ComboItem != null)
            {
                if (vybran == null)
                {
                    MessageBox.Show("Vyberte prosím jednu z návěstí");
                }
                if (vybran != "em") {
                    sigshow.Navigate(new Navestp(vybran));
                }
                if (vybran == "em" && vybran2 != "em1")
                {
                    sigshow.Navigate(new Navestp(vybran2));
                }
            
            }
            if (ComboItem2 != null && ComboItem != null)
            {
                    if (vybran != "em" && vybran2 != "em1")
                    {
                        sigshow.Navigate(new Navestp(vybran + vybran2));
                    }
            }
            }

        }
        
        }
