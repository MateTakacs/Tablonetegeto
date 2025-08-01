using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace admin
{
    internal class OsztalyMagyarazat
    {
        static List<Osztaly> l = new List<Osztaly>();

        public static void feltoltes()
        {
            l.Add(new Osztaly(1, "A"));
            l.Add(new Osztaly(2, "B"));
            l.Add(new Osztaly(3, "C"));
            l.Add(new Osztaly(4, "D"));
            l.Add(new Osztaly(5, "E"));
            l.Add(new Osztaly(6, "F"));
            l.Add(new Osztaly(7, "G"));
            l.Add(new Osztaly(8, ""));
            l.Add(new Osztaly(9, "NY"));
            l.Add(new Osztaly(10,"SZ"));
            l.Add(new Osztaly(11, ""));
            l.Add(new Osztaly(12, ""));
            l.Add(new Osztaly(13, ""));
            l.Add(new Osztaly(14, ""));
            l.Add(new Osztaly(15, ""));        }
        public static void kiir()
        {
            l.Clear();
            MainWindow.instance.osztalytipusok.Items.Clear();
            feltoltes();
            foreach (var item in l)
            {
                MainWindow.instance.osztalytipusok.Items.Add(new Osztaly(item.szam, item.jelentes));
            }
        }
    }
    public struct Osztaly
    {
        public byte szam { get; set; }
        public string jelentes { get; set; }

        public Osztaly(byte _szam, string _jelentes)
        {
            szam = _szam;
            jelentes = _jelentes;
        }
    }
}
