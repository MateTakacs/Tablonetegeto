using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace admin
{
    internal class Diakadat
    {
        public int id { get; set; }
        public string vnev { get; set; }
        public string knev { get; set; }
        public string mappa { get; set; }
        public string keppng { get; set; }
        public string kepjpg { get; set; }
        public bool eng { get; set; }
        public bool van { get; set; }
        public bool torol { get; set; }
        public string idobelyeg { get; set; }
        public int tabid { get; set; }

        public Diakadat(int _id, string _vnev, string _knev, string _mappa, string _keppng, string _kepjpg, bool _eng, bool _van, bool _torol, string _idobelyeg, int _tabid)
        {
            id = _id;
            vnev = _vnev;
            knev = _knev;
            mappa = _mappa;
            keppng = _keppng;
            kepjpg = _kepjpg;
            eng = _eng;
            van = _van;
            torol = _torol;
            idobelyeg = _idobelyeg;
            tabid = _tabid;
        }
    }
}
