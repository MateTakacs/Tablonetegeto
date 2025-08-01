using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
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


namespace admin
{
    public partial class MainWindow : Window
    {
        internal static MainWindow instance;

        public string server = "server=localhost;user id=root;database=tabloadatok;password=1234";
        public List<int> tabloazonok = new List<int>();
        public List<int> tanarazonok = new List<int>();
        public List<string> beosztas = new List<string>() { "igazgató", "igazgatóhelyettes", "osztályfőnök", "tanár​" };
        public string aktido;
        public MainWindow()
        {
            InitializeComponent();            

            instance = this;
        }

        private void justnumber(object sender, TextCompositionEventArgs e)
        {
            Segedfv.csakszamok(e);
        }
        private void barmikorbezar(object sender, System.ComponentModel.CancelEventArgs e)
        {
            Segedfv.bezar(e);
        }

        private void betolt(object sender, RoutedEventArgs e)
        {
            bej.Visibility = Visibility.Visible;
        }
        private void indulas_fnevfocus(object sender, RoutedEventArgs e)
        {
            Keyboard.Focus(fnev);
        }

        private void vizsgalat(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter) Bejelentkezes.proba();
        }

        private void tablo_Click(object sender, RoutedEventArgs e)
        {
            if (Segedfv.letezotablak())
            {
                if (Segedfv.nullkeresoadatbazisban())
                {
                    Segedfv.collvis(gombok, tabloadmin);
                    TabloAdmin.beolvas();
                }
                else MessageBox.Show("Valamelyik táblában 'null' érték található", "Hiba");
            }            
            else MessageBox.Show("Valamelyik tábla hiányzik az adatbázisban", "Hiba");
        }
        private void megnyitashoz(object sender, RoutedEventArgs e)
        {
            ujtablo.Visibility = Visibility.Visible;
            Segedfv.listviewandplusz(false, hozzaad, tablok);
        }
        private void megsemadokhozzagomb(object sender, RoutedEventArgs e)
        {
            ujtablo.Visibility = Visibility.Collapsed;
            Segedfv.listviewandplusz(true, hozzaad, tablok);
            TabloAdmin.tisztit();
        }
        private void tabloment(object sender, RoutedEventArgs e)
        {
            TabloAdmin.tabloment();
        }
        private void tablok_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Segedfv.elemkijeloles(tablok, hozzaad, torol, mod, megszuntet_t);
            Segedfv.tabidandtanarid(tablok, tabid);
        }
        private void torles(object sender, RoutedEventArgs e)
        {
            TabloAdmin.torol();
        }
        private void modosit(object sender, RoutedEventArgs e)
        {
            Segedfv.tabidandtanarid(tablok,tabid);
            TabloAdmin.kijelol();
            if (TabloAdmin.mod_seged.torol == true)
            {
                Segedfv.alap(tablok, hozzaad, torol, mod, megszuntet_t);
                MessageBox.Show("Törölt tabló adatait nem módosíthatod!", "Hiba");
            }
            else
            {
                tablo_mod.Visibility = Visibility.Visible;
                Segedfv.listviewandplusz(false, hozzaad, tablok);
                Segedfv.tormodkij(false, torol, mod, megszuntet_t);
            }
        }
        private void nemakarokmodositani(object sender, RoutedEventArgs e)
        {
            tablo_mod.Visibility = Visibility.Collapsed;
            Segedfv.alap(tablok, hozzaad, torol, mod, megszuntet_t);
        }
        private void adatokmodositasa(object sender, RoutedEventArgs e)
        {
            TabloAdmin.adatokmodositasa();
        }
        private void tabidtarolas(object sender, RoutedEventArgs e)
        {
            TabloAdmin.tabidtarolas();
            Segedfv.alap(tablok, hozzaad, torol, mod, megszuntet_t);
        }
        private void kijlevesz(object sender, RoutedEventArgs e)
        {
            Segedfv.alap(tablok, hozzaad, torol, mod, megszuntet_t);
        }
        private void tabvissza(object sender, RoutedEventArgs e)
        {
            Segedfv.collvis(tabloadmin, gombok);
        }

        private void diak_Click(object sender, RoutedEventArgs e)
        {
            if (Segedfv.letezotablak())
            {
                if (Segedfv.nullkeresoadatbazisban())
                {
                    Segedfv.collvis(gombok, diakadmin);
                    DiakAdmin.beolvas();
                    Segedfv.azonoktoltese(tabloazonok, "tablok");
                }
                else MessageBox.Show("Valamelyik táblában 'null' érték található", "Hiba");
            }
            else MessageBox.Show("Valamelyik tábla hiányzik az adatbázisban", "Hiba");
        }
        private void megnyitashoz_diak(object sender, RoutedEventArgs e)
        {
            ujdiak.Visibility = Visibility.Visible;
            if (TabloAdmin.tabid != 0) hozzatabid.Text = TabloAdmin.tabid.ToString();
            Segedfv.listviewandplusz(false, hozzaad_diak, diakok);
        }
        private void megsemadokhozzagomb_diak(object sender, RoutedEventArgs e)
        {
            ujdiak.Visibility = Visibility.Collapsed;
            Segedfv.listviewandplusz(true, hozzaad_diak, diakok);
            DiakAdmin.tisztit();
        }
        private void diakment(object sender, RoutedEventArgs e)
        {
            DiakAdmin.diakment();
        }
        private void diakok_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Segedfv.elemkijeloles(diakok, hozzaad_diak, torol_diak, mod_diak, megszuntet_d);
        }
        private void torles_diak(object sender, RoutedEventArgs e)
        {
            DiakAdmin.torol();
        }
        private void modosit_diak(object sender, RoutedEventArgs e)
        {
            DiakAdmin.kijelol();

            if (DiakAdmin.mod_seged.torol == true)
            {
                Segedfv.alap(diakok, hozzaad_diak, torol_diak, mod_diak, megszuntet_d);
                MessageBox.Show("Törölt diák adatait nem módosíthatod!", "Hiba");
            }
            else
            {
                diak_mod.Visibility = Visibility.Visible;
                Segedfv.listviewandplusz(false, hozzaad_diak, diakok);
                Segedfv.tormodkij(false, torol_diak, mod_diak, megszuntet_d);
            }
        }
        private void nemakarokmodositani_diak(object sender, RoutedEventArgs e)
        {
            diak_mod.Visibility = Visibility.Collapsed;
            Segedfv.alap(diakok, hozzaad_diak, torol_diak, mod_diak, megszuntet_d);
        }
        private void adatokmodositasa_diak(object sender, RoutedEventArgs e)
        {
            DiakAdmin.adatokmodositasa();
        }
        private void kijlevesz_d(object sender, RoutedEventArgs e)
        {
            Segedfv.alap(diakok, hozzaad_diak, torol_diak, mod_diak, megszuntet_d);
        }
        private void divissza(object sender, RoutedEventArgs e)
        {
            Segedfv.collvis(diakadmin, gombok);
        }

        private void tanar_Click(object sender, RoutedEventArgs e)
        {
            if (Segedfv.letezotablak())
            {
                if (Segedfv.nullkeresoadatbazisban())
                {
                    Segedfv.collvis(gombok, tanaradmin);
                    TanarAdmin.beolvas();
                }
                else MessageBox.Show("Valamelyik táblában 'null' érték található", "Hiba");
            }
            else MessageBox.Show("Valamelyik tábla hiányzik az adatbázisban", "Hiba");
        }
        private void megnyitashoz_tanar(object sender, RoutedEventArgs e)
        {
            ujtanar.Visibility = Visibility.Visible;
            Segedfv.listviewandplusz(false, hozzaad_tanar, tanarok);
        }
        private void megsemadokhozzagomb_tanar(object sender, RoutedEventArgs e)
        {
            ujtanar.Visibility = Visibility.Collapsed;
            Segedfv.listviewandplusz(true, hozzaad_tanar, tanarok);
            TanarAdmin.tisztit();
        }
        private void tanarment(object sender, RoutedEventArgs e)
        {
            TanarAdmin.tanarment();
        }
        private void tanarok_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Segedfv.elemkijeloles(tanarok, hozzaad_tanar, torol_tanar, mod_tanar, megszuntet_ta);
            Segedfv.tabidandtanarid(tanarok, tanarid);
        }
        private void torles_tanar(object sender, RoutedEventArgs e)
        {
            TanarAdmin.torol();
        }
        private void modosit_tanar(object sender, RoutedEventArgs e)
        {
            Segedfv.tabidandtanarid(tanarok, tanarid);
            TanarAdmin.kijelol();            
            if (TanarAdmin.mod_seged.torol == true)
            {
                Segedfv.alap(tanarok, hozzaad_tanar, torol_tanar, mod_tanar, megszuntet_ta);
                MessageBox.Show("Törölt tanár adatait nem módosíthatod!", "Hiba");
            }
            else
            {
                tanar_mod.Visibility = Visibility.Visible;
                Segedfv.listviewandplusz(false, hozzaad_tanar, tanarok);
                Segedfv.tormodkij(false, torol_tanar, mod_tanar, megszuntet_ta);
            }
        }
        private void nemakarokmodositani_tanar(object sender, RoutedEventArgs e)
        {
            tanar_mod.Visibility = Visibility.Collapsed;
            Segedfv.alap(tanarok, hozzaad_tanar, torol_tanar, mod_tanar, megszuntet_ta);
        }
        private void adatokmodositasa_tanar(object sender, RoutedEventArgs e)
        {
            TanarAdmin.adatokmodositasa();
        }
        private void tanaridtarolas(object sender, RoutedEventArgs e)
        {
            TanarAdmin.tanaridtarolas();
            Segedfv.alap(tanarok, hozzaad_tanar, torol_tanar, mod_tanar, megszuntet_ta);
        }
        private void kijlevesz_ta(object sender, RoutedEventArgs e)
        {
            Segedfv.alap(tanarok, hozzaad_tanar, torol_tanar, mod_tanar, megszuntet_ta);

        }
        private void tavissza(object sender, RoutedEventArgs e)
        {
            Segedfv.collvis(tanaradmin, gombok);
        }

        private void tanarkep_Click(object sender, RoutedEventArgs e)
        {
            if (Segedfv.letezotablak())
            {
                if (Segedfv.nullkeresoadatbazisban())
                {
                    Segedfv.collvis(gombok, tanarkepadmin);
                    TanarkepAdmin.beolvas();
                    Segedfv.azonoktoltese(tabloazonok, "tablok");
                    Segedfv.azonoktoltese(tanarazonok, "tanarok");
                }
                else MessageBox.Show("Valamelyik táblában 'null' érték található", "Hiba");
            }
            else MessageBox.Show("Valamelyik tábla hiányzik az adatbázisban", "Hiba");
        }
        private void megnyitashoz_tanarkep(object sender, RoutedEventArgs e)
        {
            ujtanarkep.Visibility = Visibility.Visible;
            if (TabloAdmin.tabid != 0) hozzatabid_kep.Text = TabloAdmin.tabid.ToString();
            if (TanarAdmin.tanarid != 0) hozzatanarid_kep.Text = TanarAdmin.tanarid.ToString();
            Segedfv.listviewandplusz(false, hozzaad_tanarkep, tanarkepek);
            TanarkepAdmin.tanarkepbeosztas(hozzabeosztas_kep);
        }
        private void megsemadokhozzagomb_tanarkep(object sender, RoutedEventArgs e)
        {
            ujtanarkep.Visibility = Visibility.Collapsed;
            Segedfv.listviewandplusz(true, hozzaad_tanarkep, tanarkepek);
            TanarkepAdmin.tisztit();
        }
        private void tanarkepment(object sender, RoutedEventArgs e)
        {
            TanarkepAdmin.tanarkepment();
        }
        private void tanarkepek_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Segedfv.elemkijeloles(tanarkepek, hozzaad_tanarkep, torol_tanarkep, mod_tanarkep, megszuntet_tk);
        }
        private void torles_tanarkep(object sender, RoutedEventArgs e)
        {
            TanarkepAdmin.torol();
        }
        private void modosit_tanarkep(object sender, RoutedEventArgs e)
        {
            TanarkepAdmin.tanarkepbeosztas(modbeosztas_kep);
            TanarkepAdmin.kijelol();

            if (TanarkepAdmin.mod_seged.torol == true)
            {
                Segedfv.alap(tanarkepek, hozzaad_tanarkep, torol_tanarkep, mod_tanarkep, megszuntet_tk);
                MessageBox.Show("Törölt tanárkép adatait nem módosíthatod!", "Hiba");
            }
            else
            {
                tanarkep_mod.Visibility = Visibility.Visible;
                Segedfv.listviewandplusz(false, hozzaad_tanarkep, tanarkepek);
                Segedfv.tormodkij(false, torol_tanarkep, mod_tanarkep, megszuntet_tk);                
            }
        }
        private void nemakarokmodositani_tanarkep(object sender, RoutedEventArgs e)
        {
            tanarkep_mod.Visibility = Visibility.Collapsed;
            Segedfv.alap(tanarkepek, hozzaad_tanarkep, torol_tanarkep, mod_tanarkep, megszuntet_tk);
        }
        private void adatokmodositasa_tanarkep(object sender, RoutedEventArgs e)
        {
            TanarkepAdmin.adatokmodositasa();
        }
        private void kijlevesz_tk(object sender, RoutedEventArgs e)
        {
            Segedfv.alap(tanarkepek, hozzaad_tanarkep, torol_tanarkep, mod_tanarkep, megszuntet_tk);
        }
        private void takepvissza(object sender, RoutedEventArgs e)
        {
            Segedfv.collvis(tanarkepadmin, gombok);
        }

        private void osztalyinf_Click(object sender, RoutedEventArgs e)
        {
            Segedfv.collvis(gombok, osztaly);
            OsztalyMagyarazat.kiir();
        }
        private void ovissza(object sender, RoutedEventArgs e)
        {
            Segedfv.collvis(osztaly, gombok);
        }

        private void helyinf_Click(object sender, RoutedEventArgs e)
        {
            Segedfv.collvis(gombok, hely);
            HelyMagyarazat.kiir();
        }
        private void hvissza(object sender, RoutedEventArgs e)
        {
            Segedfv.collvis(hely, gombok);
        }
    }
}
