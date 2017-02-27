using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dictionary
{
    class Program
    {
        static void Main(string[] args)
        {
            //GenericsUndCollections
            Dictionary<string, int> dict = new Dictionary<string, int>();
            dict.Add("Montag", 5); //der erste Wert ist immer der KEY!!! kann ein beliebiger Datentyp sein!
            dict.Add("Dienstag", 3);
            dict.Add("Mittwoch", 5);
            dict.Add("Freitag", 2);

            if (dict.ContainsKey("Mittwoch"))
            {
                Console.WriteLine("Existiert");
            }
            else
            {
                Console.WriteLine("Exisitiert nicht");
            }

            if (dict.ContainsKey("gwehtbhs"))
            {
                Console.WriteLine("Existiert");
            }
            else
            {
                Console.WriteLine("Exisitiert nicht");
            }

            int erg;
            if (dict.TryGetValue("Dienstag", out erg))
            {
                Console.WriteLine(erg);
            }
            else
            {
                Console.WriteLine(false);
            }

            foreach (var x in dict) //durch var keine Kenntnis über die Datentypen in der Dictionary notwendig!!!
            {
                Console.WriteLine(x.Key);
                Console.WriteLine(x.Value);
            }
            //Alternative:
            //VORTEIL: Keine Bit-Konvertierung notwendig!!! Jedoch muss man wissen, welche Datentypen in der Dictionary vorhanden sind

            //foreach (KeyValuePair<string,int> x in dict)
            //{
            //Console.WriteLine(x.Key);
            //Console.WriteLine(x.Value);
            //}
            Console.WriteLine(dict["Montag"]); //Zugriff ähnlich wie bei einem Array!
            Console.ReadKey();

            //Anm.: Wenn man ein sortiertes "Dictionary" möchte, ist eine SortedList die erste Wahl
            //    -> hat ebenfalls KeyPairs und kann wie gesagt sortiert werden!

            //IEnumerable<> Interface ermöglicht das Durchzählen in Klassen
            //IDictionary -> Das KeyValuePair-Verhalten kann an die Klasse übergeben werden
            //IList...
            //ICollection...
        }
    }
}
