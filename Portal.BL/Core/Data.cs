﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.BL.Core
{
    public static class Data
    {
        public static int AccessoriesFirstDay = 1;
        public static int AccessoriesLastDay = 27;

        internal static string UKMHost = "192.168.24.254";
        internal static string UKMUser = "root";
        internal static string UKMPassword = "CtHDbCGK.C";

        internal static string PostHost = "192.168.25.205";
        internal static int PostPort = 25;
        internal static string messageFrom = "portal@bobruysk.korona.by";

        internal static string DB01KBDataSource = @"DB01KB\DB01KB";
        internal static string DB01KBInitialCatalog = "TimeControl";
        internal static string DB01KBUser = "administrator";
        internal static string DB01KBPassword = "128500";

        //const
        public static string BirthdayMessageBottom = "Желаем хорошего настроения, успехов в «Короне», улыбок близких и коллег!!!";
        //const
        public static int TimeoutRefresh = 90;
        public static string PathPhotoEmployee = "";
        //const
        public static string PathFileImport1C = @"\\gs01kb\export$\1c\Export\exp_ej.DBF";
        //const
        public static string ConnectToTabel = "0";
        //
        public static int HourShiftExit = 1;
    }
}
