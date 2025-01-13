using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Návěstidlo
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        internal string settheme;
        public ResourceDictionary deftheme;
        public MainWindow()
        {
            InitializeComponent();
            /*string hdtext = Návěstidlo.Properties.Settings.Default.hdtextcolor;
            string thmpck = Návěstidlo.Properties.Settings.Default.theme;
            string sapplang = Návěstidlo.Properties.Settings.Default.applang.ToLower();
            bool devm = Properties.Settings.Default.devmode;*/
            string thmpck = Návěstidlo.Properties.Settings.Default.theme;
            if (thmpck == "lighttheme")
            {
                settheme = "light";
            }
            if (thmpck == "darktheme")
            {
                settheme = "dark";
            }
            //bool appdevmode = Návěstidlo.Properties.Settings.Default.devmode;
            /*if (appdevmode == true)
            {
                Headline.Visibility = Visibility.Hidden;
                devmlabel.Visibility = Visibility.Visible;
            }
            if (appdevmode == false)
            {
                Headline.Visibility = Visibility.Visible;
                devmlabel.Visibility = Visibility.Hidden;
            }*/
            Themeset();
        }
        public void Themeset()
        {
            ResourceDictionary deftheme;
            System.Windows.Application.Current.Resources.MergedDictionaries.Clear();
            deftheme = new ResourceDictionary();
            {

                deftheme.Source = new Uri("/Návěstidlo;component/data/themes/" + settheme + ".xaml", UriKind.RelativeOrAbsolute);
            }
            System.Windows.Application.Current.Resources.MergedDictionaries.Add(deftheme);

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        public void Window_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            if (this.WindowState == WindowState.Maximized)
            {
                this.BorderThickness = new System.Windows.Thickness(6);
            }
            else
            {
                this.BorderThickness = new System.Windows.Thickness(0);
            }
        }

        /* Vypnutí aero snap*/
        void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                 
                 if (this.ResizeMode != System.Windows.ResizeMode.NoResize)
                 {
                     this.ResizeMode = System.Windows.ResizeMode.NoResize;
                     this.UpdateLayout();
                 }

                DragMove();
            }
        }

        void Window_MouseUp(object sender, MouseButtonEventArgs e)
        {
            if (this.ResizeMode == System.Windows.ResizeMode.NoResize)
            {
                // restore resize grips
                this.ResizeMode = System.Windows.ResizeMode.CanResizeWithGrip;
                this.UpdateLayout();
            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            //nav.Source = new Uri("stranky/teorie.xaml", UriKind.Relative);
        }
        public void Showmessage(string oznameni, string typ, string typ1)
        {
            if (typ1 == "Chyba")
            {
                messagepanel.Background = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#f74a4d"));
            }
            if (typ1 == "Info")
            {
                messagepanel.Background = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FF277D2F"));
            }
            messagepanel.Visibility = Visibility.Visible;
            typzpravy.Content = typ;
            zprava.Content = oznameni;
            var a = new DoubleAnimation
            {
                From = 1.0,
                To = 1.0,
                FillBehavior = FillBehavior.Stop,
                BeginTime = TimeSpan.FromSeconds(0),
                Duration = new Duration(TimeSpan.FromSeconds(10))
            };
            var storyboard = new Storyboard();
            storyboard.Children.Add(a);
            Storyboard.SetTarget(a, messagepanel);
            Storyboard.SetTargetProperty(a, new PropertyPath(OpacityProperty));
            storyboard.Completed += delegate { messagepanel.Visibility = System.Windows.Visibility.Hidden; };
            storyboard.Begin();
        }
        private void okbtn_Click(object sender, RoutedEventArgs e)
        {
            messagepanel.Visibility = Visibility.Hidden;
        }
    }
}