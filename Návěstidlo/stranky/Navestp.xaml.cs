using Návěstidlo.data;
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
using System.Xml.Linq;

namespace Návěstidlo.stranky
{
    /// <summary>
    /// Interaction logic for Navestp.xaml
    /// </summary>
    public partial class Navestp : Page
    {
        internal string xcls;
        internal string xnazev;
        internal string xsvetla;
        internal string xpopis;
        public Navestp(string kodnavesti)
        {
            InitializeComponent();
            if (kodnavesti != null || kodnavesti != "")
            {
                XDocument doc = XDocument.Parse(files.data);

                var result = from ele in doc.Descendants(kodnavesti)
                             select new
                             {
                                 cls = (string)ele.Element("xa"),
                                 nazev = (string)ele.Element("nazev"),
                                 svetla = (string)ele.Element("svetla"),
                                 popis = (string)ele.Element("popis"),
                             };
                foreach (var t in result)
                {
                    xcls = t.cls;
                    xnazev = t.nazev;
                    xsvetla = t.svetla;
                    xpopis = t.popis;
                }
                if (kodnavesti != null)
                {
                    string[] xcl = xcls.Split(';', ' ');
                    xcl = xcl.Where(x => !string.IsNullOrEmpty(x)).ToArray();
                    xcl = xcl.Where(x => !string.IsNullOrWhiteSpace(x)).ToArray();
                    foreach (var sx in xcl)
                    {
                        string s = sx.Replace("/", "_");
                        object prvekovl = navest.FindName(s);
                        if (prvekovl is Ellipse)
                        {
                            Ellipse relement = prvekovl as Ellipse;
                            relement.Visibility = Visibility.Visible;
                        }
                    }
                }
                nazevnavesti.Content = xnazev;
                vzhlednav.Content = xsvetla;
                popisnav.Text = xpopis;
                headline.Content = xnazev;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
