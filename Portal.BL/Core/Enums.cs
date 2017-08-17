using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.BL.Core
{
    public class Enums
    {
        public enum Result
        {
            Start,
            Success,
            Error
        }

        public enum Status
        {
            Ready,
            Running
        }

        public enum RunType
        {
            Exit,
            Entrance
        }
    }
}
