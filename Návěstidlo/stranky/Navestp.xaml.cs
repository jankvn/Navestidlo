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
using System.Windows.Threading;
using System.Xml.Linq;

namespace Návěstidlo.stranky
{
    /// <summary>
    /// Interaction logic for Navestp.xaml
    /// </summary>
    public partial class Navestp : Page
    {
        internal string xcls;
        internal string xrych;
        internal string xnazev;
        internal string xsvetla;
        internal string xpopis;
        internal string xblik;
        internal string xblikx;
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
                                 rych = (string)ele.Element("xr"),
                                 nazev = (string)ele.Element("nazev"),
                                 blik = (string)ele.Element("blik"),
                                 blikx = (string)ele.Element("blikx"),
                                 svetla = (string)ele.Element("svetla"),
                                 popis = (string)ele.Element("popis"),
                             };
                foreach (var t in result)
                {
                    xcls = t.cls;
                    xrych = t.rych;
                    xnazev = t.nazev;
                    xblik = t.blik;
                    xblikx = t.blikx;
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
                    //nazevnavesti.Content = xnazev;
                    vzhlednav.Content = xsvetla;
                    popisnav.Text = xpopis;
                    headline.Content = xnazev;
                    if (xblik == "pomalu")
                    {
                        Loaded += Blink_slow;
                    }
                    if (xblik == "rychle")
                    {
                        Loaded += Blink_fast;
                    }
                    if(xrych != "")
                    {
                        ocekavanarychlost.Visibility = Visibility.Visible;
                        ocekavanarychlost.Foreground = new SolidColorBrush(Color.FromRgb(255, 255, 0));
                        ocekavanarychlost.Text = xrych;
                    }
                }
                /*nazevnavesti.Content = xnazev;
                vzhlednav.Content = xsvetla;
                popisnav.Text = xpopis;
                headline.Content = xnazev;
                if (xblik == "pomalu")
                {
                    Loaded += Blink_slow;
                }
                if (xblik == "rychle")
                {
                    Loaded += Blink_fast;
                }*/
               /* if (xblik == "")
                {
                    //
                }*/
            }
        }
        private bool BlinkOn = false;
        private void Blink_slow(object sender, RoutedEventArgs e)
        {
            DispatcherTimer timer = new DispatcherTimer();
            timer.Tick += timer_Tick;
            timer.Interval = new TimeSpan(0, 0, 0, 0, 900);
            timer.Start();
        }
        private void Blink_fast(object sender, RoutedEventArgs e)
        {
            DispatcherTimer timer = new DispatcherTimer();
            timer.Tick += timer_Tick;
            timer.Interval = new TimeSpan(0, 0, 0, 0, 450);
            timer.Start();
        }
        private void timer_Tick(object sender, EventArgs e)
        {
            object prvekovl1 = navest.FindName(xblikx);
            if (prvekovl1 is Ellipse)
            {
                Ellipse relement = prvekovl1 as Ellipse;
                if (BlinkOn)
                {
                    relement.Visibility = Visibility.Visible;
                }
                else
                {
                    relement.Visibility = Visibility.Hidden;
                }
                BlinkOn = !BlinkOn;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
