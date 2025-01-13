using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
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
    /// Interakční logika pro oaplikaci.xaml
    /// </summary>
    public partial class oaplikaci : Page
    {
        public oaplikaci()
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
            vernum.Content = Assembly.GetExecutingAssembly().GetName().Version.ToString();
        }
        private void Hyperlink_RequestNavigate(object sender, RequestNavigateEventArgs e)
        {
            Process.Start(new ProcessStartInfo(e.Uri.AbsoluteUri) { UseShellExecute = true });
            e.Handled = true;
        }
        private string themefile;
        private void ComboBox_DropDownClosed(object sender, EventArgs e)
        {

            ComboBoxItem ComboItem = (ComboBoxItem)((ComboBox)sender).SelectedItem;
            if (ComboItem != null)
            {
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
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
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
