using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace admin
{
    internal class Bejelentkezes
    {
        static string kiir;
        public static void proba()
        { 
            string beirtfnev = MainWindow.instance.fnev.Text;
            string beirtjelszo = MainWindow.instance.jelszo.Password;

            if (beirtfnev.Length == 0 || beirtjelszo.Length == 0)
            {
                MessageBox.Show("Üres adat");
                MainWindow.instance.fnev.Focus();
            }
            else if (beirtfnev.Length < 10 && beirtjelszo.Length < 15)
            {
                try
                {                    
                    MySqlConnection kapcs = new MySqlConnection(MainWindow.instance.server);
                    kapcs.Open();

                    try
                    {                        
                        string sql = $"select jelszo from felhasznalok where fnev = '{beirtfnev}';";
                        MySqlCommand parancs = new MySqlCommand(sql, kapcs);
                        MySqlDataReader kap = parancs.ExecuteReader();

                        string kapottjelszo = "";

                        while (kap.Read())
                        {
                            kapottjelszo = kap[0].ToString();
                        }

                        kapcs.Close();

                        if (kapottjelszo.Length > 0)
                        {
                            string valtas = titkositas(beirtjelszo);

                            if (valtas == kapottjelszo)
                            {
                                if (Segedfv.letezotablak())
                                {
                                    if (Segedfv.nullkeresoadatbazisban())
                                    {
                                        MainWindow.instance.bej.Visibility = Visibility.Collapsed;
                                        MainWindow.instance.gombok.Visibility = Visibility.Visible;
                                    }
                                    else
                                    {
                                        kiir = "Valamelyik attributum értéke 'null' az adatbázisban";
                                        uresuzenetfocus(kiir);
                                    }
                                }
                                else
                                {
                                    kiir = "Importáld a hozzaad.sql fájlt az adatbázisba";
                                    uresuzenetfocus(kiir);
                                }
                                
                            }
                            else
                            {
                                MainWindow.instance.jelszo.Password = "";
                                MessageBox.Show("Hibás jelszó");
                                MainWindow.instance.jelszo.Focus();
                            }
                        }
                        else
                        {
                            kiir = "Nem létezik a megadott felhasználónév";
                            uresuzenetfocus(kiir);
                        }
                    }
                    catch
                    {
                        kiir = "A felhasználók tábla nem létezik az adatbázisban";
                        uresuzenetfocus(kiir);
                    }
                    
                }
                catch
                {
                    kiir = "Nem tudtam kapcsolódni az adatbázishoz";
                    uresuzenetfocus(kiir);
                }                
            }
            else
            {
                kiir = "Valamelyik adat túl hosszú";
                uresuzenetfocus(kiir);
            }
        }
        public static void uresuzenetfocus(string kiir)
        {
            MainWindow.instance.fnev.Text = "";
            MainWindow.instance.jelszo.Password = "";
            MessageBox.Show(kiir);
            MainWindow.instance.fnev.Focus();
        }
        public static string titkositas(string beirtjelszo)
        {
            //https://riptutorial.com/csharp/example/9342/sha1
            SHA1 sha1 = SHA1.Create();
            byte[] seged = Encoding.UTF8.GetBytes(beirtjelszo);
            byte[] ered = sha1.ComputeHash(seged);
            string valtas = BitConverter.ToString(ered).Replace("-", String.Empty);
            valtas = valtas.ToLower();

            return valtas;
        }
    }
}
