using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace admin
{
    internal class DiakAdmin
    {
        public static Diakadat mod_seged;
        static string sql;
        static byte ssz = 0;
        static bool vanenev = false;
        public static void tisztit()
        {
            MainWindow.instance.hozzavnev.Text = "";
            MainWindow.instance.hozzaknev.Text = "";
            MainWindow.instance.hozzatabid.Text = "";
        }
        public static void beolvas()
        {
            try
            {
                Segedfv.beolvaseleje(MainWindow.instance.torol_diak, MainWindow.instance.mod_diak, MainWindow.instance.megszuntet_d, MainWindow.instance.hozzaad_diak, MainWindow.instance.diakok, MainWindow.instance.ujdiak, MainWindow.instance.diak_mod);
                tisztit();

                MySqlConnection kapcs = new MySqlConnection(MainWindow.instance.server);
                kapcs.Open();

                sql = "select * from diakok;";
                MySqlCommand parancs = new MySqlCommand(sql, kapcs);
                MySqlDataReader kap = parancs.ExecuteReader();

                while (kap.Read())
                {
                    MainWindow.instance.diakok.Items.Add(new Diakadat(int.Parse(kap[0].ToString()), kap[1].ToString(), kap[2].ToString(), kap[3].ToString(), kap[4].ToString(), kap[5].ToString(), bool.Parse(kap[6].ToString()), bool.Parse(kap[7].ToString()), bool.Parse(kap[8].ToString()), kap[9].ToString(), int.Parse(kap[10].ToString())));
                }

                kap.Close();

                kapcs.Close();
            }
            catch
            {
                Segedfv.collvis(MainWindow.instance.diakadmin, MainWindow.instance.gombok);
            }
        }        
        public static bool vnevknev(string vnev, string knev, int tabid)
        {
            bool vane = false;
            ssz = 0;
            string teljesnev = $"{vnev} {knev}";

            MySqlConnection kapcs = new MySqlConnection(MainWindow.instance.server);

            kapcs.Open();

            sql = $"select vnev, knev from diakok where tabid = {tabid};";
            MySqlCommand parancs = new MySqlCommand(sql, kapcs);
            MySqlDataReader kap = parancs.ExecuteReader();

            while (kap.Read())
            {
                if ((kap[0] + " " + kap[1]) == teljesnev)
                {
                    vane = true;
                    ssz++;
                }
            }

            kap.Close();

            kapcs.Close();

            return vane;
        }
        public static void diakment()
        {
            try
            {
                string vnev = MainWindow.instance.hozzavnev.Text;                
                string knev = MainWindow.instance.hozzaknev.Text;                
                int tabid = int.Parse(MainWindow.instance.hozzatabid.Text);

                if (vnev.Length == 0 || knev.Length == 0) MessageBox.Show("Üres adat", "Hiba");
                else if (vnev.Length < 51 && knev.Length < 51 && MainWindow.instance.tabloazonok.Contains(tabid) && Segedfv.spacekereso(vnev) && Segedfv.spacekereso(knev))
                {
                    MainWindow.instance.aktido = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                    vanenev = vnevknev(vnev, knev, tabid);

                    sql = $"insert into diakok (vnev, knev, mappa, eng, van, torol, idobelyeg, tabid) values ('{vnev}', '{knev}', 'kepek/diakok/{tabid}/', true, true, false, '{MainWindow.instance.aktido}', {tabid});";
                    Segedfv.sqlnonquery(sql);

                    int id = Segedfv.maxid("diakok");                    

                    vnev = vnev.Replace(' ', '_');
                    knev = knev.Replace(' ', '_');

                    if (vanenev)
                    {
                        sql = $"update diakok set keppng = '{vnev}_{knev}{ssz}.png', kepjpg = '{vnev}_{knev}{ssz}.jpg' where id = {id};";
                        Segedfv.sqlnonquery(sql);
                    }
                    else
                    {
                        sql = $"update diakok set keppng = '{vnev}_{knev}.png', kepjpg = '{vnev}_{knev}.jpg' where id = {id};";
                        Segedfv.sqlnonquery(sql);
                    }

                    beolvas();
                }
                else
                {
                    if (!MainWindow.instance.tabloazonok.Contains(tabid)) MessageBox.Show("Ez a tablóazonosító nem létezik", "Hiba");
                    else MessageBox.Show("Vidd az egeret a beviteli mezőhöz tartozó címke fölé", "Hiba");
                }
            }
            catch
            {
                MessageBox.Show("Vidd az egeret a beviteli mezőhöz tartozó címke fölé", "Hiba");
            }
        }
        public static void torol()
        {
            try
            {
                MessageBoxResult valasz;
                valasz = MessageBox.Show("Biztosan törölni szeretnéd?", "Törlés kérdés", MessageBoxButton.YesNo);
                if (valasz == MessageBoxResult.Yes)
                {
                    for (int i = 1; i <= MainWindow.instance.diakok.SelectedItems.Count; i++) //többet is törölhtsz 'egyszerre'
                    {
                        MainWindow.instance.aktido = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        Diakadat peldany = (Diakadat)MainWindow.instance.diakok.SelectedItems[i - 1];

                        sql = $"update diakok set torol = true, idobelyeg = '{MainWindow.instance.aktido}' where id = {peldany.id};";
                        Segedfv.sqlnonquery(sql);
                    }

                    beolvas();
                }
                else Segedfv.alap(MainWindow.instance.diakok, MainWindow.instance.hozzaad_diak, MainWindow.instance.torol_diak, MainWindow.instance.mod_diak, MainWindow.instance.megszuntet_d);
            }
            catch
            {
                Segedfv.collvis(MainWindow.instance.diakadmin, MainWindow.instance.gombok);
            }     
        }
        public static void kitolt(Diakadat peldany)
        {
            if (peldany.van) MainWindow.instance.vantrue_diak.IsChecked = true;
            else MainWindow.instance.vanfalse_diak.IsChecked = true;
            if (peldany.eng) MainWindow.instance.engtrue_diak.IsChecked = true;
            else MainWindow.instance.engfalse_diak.IsChecked = true;
            MainWindow.instance.modvnev.Text = peldany.vnev;
            MainWindow.instance.modknev.Text = peldany.knev;
            MainWindow.instance.modtabid.Text = peldany.tabid.ToString();
        }
        public static void kijelol()
        {
            mod_seged = (Diakadat)MainWindow.instance.diakok.SelectedItem;
            kitolt(mod_seged);
        }
        public static void adatokmodositasa()
        {
            try
            {
                bool vane = mod_seged.van;
                if (MainWindow.instance.vantrue_diak.IsChecked == true) vane = true;
                else vane = false;
                bool enge = mod_seged.eng;
                if (MainWindow.instance.engtrue_diak.IsChecked == true) enge = true;
                else enge = false;
                string vnev = MainWindow.instance.modvnev.Text;
                string knev = MainWindow.instance.modknev.Text;
                int tabid = int.Parse(MainWindow.instance.modtabid.Text);

                if (vnev.Length == 0 || knev.Length == 0) MessageBox.Show("Üres adat", "Hiba");
                else if (vane == mod_seged.van && enge == mod_seged.eng && vnev == mod_seged.vnev && knev == mod_seged.knev && tabid == mod_seged.tabid) MessageBox.Show("Nem módosítottál semmit", "Hiba");
                else if ((vane != mod_seged.van || enge != mod_seged.eng || vnev != mod_seged.vnev || knev != mod_seged.knev || tabid != mod_seged.tabid) && vnev.Length < 51 && knev.Length < 51 && MainWindow.instance.tabloazonok.Contains(tabid) && Segedfv.spacekereso(vnev) && Segedfv.spacekereso(knev))
                {
                    MainWindow.instance.aktido = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                    MySqlConnection kapcs = new MySqlConnection(MainWindow.instance.server);

                    if (tabid == mod_seged.tabid)
                    {
                        vanenev = vnevknev(vnev, knev, tabid);

                        sql = $"update diakok set vnev = '{vnev}', knev = '{knev}', eng = {enge}, van = {vane}, idobelyeg = '{MainWindow.instance.aktido}' where id = {mod_seged.id};";
                        Segedfv.sqlnonquery(sql);

                        vnev = vnev.Replace(' ', '_');
                        knev = knev.Replace(' ', '_');

                        if (vanenev)
                        {
                            sql = $"update diakok set keppng = '{vnev}_{knev}{ssz}.png', kepjpg = '{vnev}_{knev}{ssz}.jpg' where id = {mod_seged.id};";
                            Segedfv.sqlnonquery(sql);
                        }
                        else
                        {
                            sql = $"update diakok set keppng = '{vnev}_{knev}.png', kepjpg = '{vnev}_{knev}.jpg' where id = {mod_seged.id};";
                            Segedfv.sqlnonquery(sql);
                        }
                    }
                    else
                    {
                        vanenev = vnevknev(vnev, knev, tabid);

                        sql = $"update diakok set vnev = '{vnev}', knev = '{knev}', mappa = 'kepek/diakok/{tabid}/', tabid = {tabid}, eng = {enge}, van = {vane}, idobelyeg = '{MainWindow.instance.aktido}' where id = {mod_seged.id};";
                        Segedfv.sqlnonquery(sql);

                        vnev = vnev.Replace(' ', '_');
                        knev = knev.Replace(' ', '_');

                        if (vanenev)
                        {
                            sql = $"update diakok set keppng = '{vnev}_{knev}{ssz}.png', kepjpg = '{vnev}_{knev}{ssz}.jpg' where id = {mod_seged.id};";
                            Segedfv.sqlnonquery(sql);
                        }
                        else
                        {                            
                            sql = $"update diakok set keppng = '{vnev}_{knev}.png', kepjpg = '{vnev}_{knev}.jpg' where id = {mod_seged.id};";
                            Segedfv.sqlnonquery(sql);
                        }
                    }

                    beolvas();
                }
                else
                {
                    if (!MainWindow.instance.tabloazonok.Contains(tabid)) MessageBox.Show("Ez a tablóazonosító nem létezik", "Hiba");
                    else MessageBox.Show("Vidd az egeret a beviteli mezőhöz tartozó címke fölé", "Hiba");
                }
            }
            catch
            {
                MessageBox.Show("Vidd az egeret a beviteli mezőhöz tartozó címke fölé", "Hiba");
            }
        }
    }
}
