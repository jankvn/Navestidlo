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
    /// Interaction logic for Nastaveni.xaml
    /// </summary>
    public partial class Nastaveni : Page
    {
        public Nastaveni()
        {
            InitializeComponent();
            string apptheme = Properties.Settings.Default.theme;
            if (apptheme == "lighttheme")
            {
                themepick.SelectedValue = lighttheme;
            }
            if (apptheme == "darktheme")
            {
                themepick.SelectedValue = darktheme;
            }
        }
        private string themefile;
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            ComboBoxItem ComboItem = (ComboBoxItem)themepick.SelectedItem;
            string theme = ComboItem.Name;
            if (theme == "lighttheme")
            {
                themefile = "light";
            }
            if (theme == "darktheme")
            {
                themefile = "dark";
            }
            System.Windows.Application.Current.Resources.MergedDictionaries.Clear();
            System.Windows.Application.Current.Resources.MergedDictionaries.Add(new ResourceDictionary()
            {
                Source = new Uri("/Návěstidlo;component/data/themes/" + themefile + ".xaml", UriKind.RelativeOrAbsolute)
            });
            Properties.Settings.Default.theme = theme;
            Properties.Settings.Default.Save();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Properties.Settings.Default.theme = "lighttheme";
            themepick.SelectedValue = lighttheme;
            Properties.Settings.Default.Save();
            System.Windows.Application.Current.Resources.MergedDictionaries.Clear();
            System.Windows.Application.Current.Resources.MergedDictionaries.Add(new ResourceDictionary()
            {
                Source = new Uri("/Návěstidlo;component/data/themes/light.xaml", UriKind.RelativeOrAbsolute)
            });
        }
    }
}
