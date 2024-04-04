using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using ConsoleApp41.Models;

namespace ConsoleApp41.Data {
    internal class EventDao {
        public void Create(Event newEvent) {
            
        }
        public Event Read(int id) {
            return new Event();
        }
        public int Update(Event newEvent) {
            return 0;
        }

        public int Delete(int id) {
            return 0;
        }
    }
}
