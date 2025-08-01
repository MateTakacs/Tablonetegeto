using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace admin
{
    internal class HelyMagyarazat
    {
        static List<Hely> l = new List<Hely>();

        public static void feltoltes()
        {
            l.Add(new Hely(1, "Alagsor"));
            l.Add(new Hely(2, "Alagsor, Terem: 11"));
            l.Add(new Hely(3, "Alagsor, Terem: A1"));
            l.Add(new Hely(4, "Alagsor, Lépcső"));
            l.Add(new Hely(5, "Földszint, Terem: 1"));
            l.Add(new Hely(6, "Földszint, Terem: 2"));
            l.Add(new Hely(7, "Földszint, Terem: 7"));
            l.Add(new Hely(8, "Földszint, Terem: 6"));
            l.Add(new Hely(9, "Földszint, folyosó"));
            l.Add(new Hely(10, "Félemelet 1"));
            l.Add(new Hely(11, "1. emelet, folyosó"));
            l.Add(new Hely(12, "1. emelet, közlekedő"));
            l.Add(new Hely(13, "1. emelet, Terem: 20"));
            l.Add(new Hely(14, "1. emelet, Terem: 19"));
            l.Add(new Hely(15, "1. emelet, Tanári pihenő"));
            l.Add(new Hely(16, "1. emelet, Terem: 18"));
            l.Add(new Hely(17, "1. emelet, Terem: 17"));
            l.Add(new Hely(18, "1. emelet, Terem: 15"));
            l.Add(new Hely(19, "1. emelet, Hátsólépcső"));
            l.Add(new Hely(20, "Félemelet 2"));
            l.Add(new Hely(21, "Félemelet 2, Terem: 22"));
            l.Add(new Hely(22, "Félemelet 2, Nyelvilabor"));
            l.Add(new Hely(23, "2. emelet, folyosó"));
            l.Add(new Hely(24, "2. emelet, Terem: 25"));
            l.Add(new Hely(25, "2. emelet, Terem: 26"));
            l.Add(new Hely(26, "2. emelet, Terem: 27"));
            l.Add(new Hely(27, "2. emelet, Terem: 28"));
            l.Add(new Hely(28, "2. emelet, Terem: 29"));
            l.Add(new Hely(29, "2. emelet, Terem: 31 könyvtár"));
            l.Add(new Hely(30, "Félemelet 3"));
            l.Add(new Hely(31, "Félemelet 3, Taniroda külső"));
            l.Add(new Hely(32, "Félemelet 3, Taniroda"));
            l.Add(new Hely(40, "Kocsiszín, Zrínyi 19."));
            l.Add(new Hely(41, "Földszint folyosó, Zrínyi 19."));
            l.Add(new Hely(42, "Földszint,Terem:2, Zrínyi 19."));
            l.Add(new Hely(43, "Földszint,Terem:3, Zrínyi 19."));
            l.Add(new Hely(44, "Földszint,Terem:4, Zrínyi 19."));
            l.Add(new Hely(46, "1. emelet,Folyosó, Zrínyi 19."));
            l.Add(new Hely(47, "1. emelet,Terem:7, Zrínyi 19."));
            l.Add(new Hely(50, "PADLÁS , Zrínyi 19."));
        }
        public static void kiir()
        {
            l.Clear();
            MainWindow.instance.helytipusok.Items.Clear();
            feltoltes();
            foreach (var item in l)
            {
                MainWindow.instance.helytipusok.Items.Add(new Hely(item.szam, item.jelentes));
            }
        }
    }
    public struct Hely
    {
        public byte szam { get; set; }
        public string jelentes { get; set; }

        public Hely(byte _szam, string _jelentes)
        {
            szam = _szam;
            jelentes = _jelentes;
        }
    }
}
