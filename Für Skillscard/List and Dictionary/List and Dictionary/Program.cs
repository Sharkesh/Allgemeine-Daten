
using GenericsUndCollections;
using GenericUndCollections;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericsUndColletions
{
    class Program
    {
        static void Main(string[] args)
        {
            /// List ist eine generische Klasse, wird so programmiert, dass man hineinspeichern kann, was man möchte
            /// z.B. int, string, float,...
            List<int> list = new List<int>();
            list.Add(5);
            list.Add(-3);
            Program[] abc = new Program[10];
            abc[0].machEtwas();

            // myTry
            List<object> test = new List<object>();
            test.Add(2.3);
            test.Add("hallo");
            test.Add(list[0]);

            List<string> sList = new List<string>();
            sList.Add("Hallo");
            sList.Add("Welt");

            MeinContainer<int, string> mc = new MeinContainer<int, string>(5, "Zahl");
            mc.print();
            MeinContainer<double, int> mc2 = new MeinContainer<double, int>(3.3, 5);
            mc2.print();

            //Stack: First In, Last Out (FILO)
            //Queue: First In, First Out (FIFO)
            MeinStack<int> s = new MeinStack<int>();

            // Push: zum Stack hinzufügen (drauflegen); Pop: vom Stack (von oben) entfernen; Peek: oberstes Element des Stacks anzeigen
            s.Push(5);
            s.Push(7);
            s.Push(-4);
            s.Push(9);
            Console.WriteLine(s.Peek()); //9
            Console.WriteLine(s.Pop()); //9
            Console.WriteLine(s.Pop()); //-4
            Console.WriteLine(s.Peek()); //7

            LL<int> LL = new LL<int>(1);
            LL.AddAtEnd(2);
            LL.AddAtEnd(3);
            LL.AddAtEnd(4);
            LL.AddAtEnd(5);
            LL.AddAtEnd(6);
            LL.AddAtEnd(7);
            LL.PrintList();
            LL.InsertAfterIndex(100, 2);
            LL.PrintList();
            Console.ReadKey();
            LL.RemoveIndex(3);
            LL.PrintList();
            Console.ReadKey();            
        }
        public void machEtwas()
        {

        }
    }
    class MeinContainer<T, U> //beim erstellen der Klasse, gibt man die unbekannten Datentypen an, welche erst bei
                              //Verwendung zur Laufzeit initialisiert werden
                              //(hier T und U, welche die Namen dafür sind)
                              //Container mit Verbindungsobjekten?!
    {
        protected T inhalt; //Platzhalter für einen konkreten Datentypen
        protected U bezeichnung;
        public MeinContainer(T inh, U bez)
        {
            inhalt = inh;
            bezeichnung = bez;
        }
        public void print()
        {
            Console.Write("{0}: ", bezeichnung);
            Console.WriteLine("{0}", inhalt);
        }

        public virtual T MachEtwas(T inhalt)
        {
            return inhalt;
        }
    }

    class AufzaehlContainer<T> where T : IEnumerable //hiermit können Interfaces übergeben werden (sehr speziell)
    {

    }
    //Wenn die BasisKlasse generisch ist, muss man für die Unterklasse den selben Typ verwenden!
    class UnterContainer<T, U> : MeinContainer<T, U>
    {
        public UnterContainer(T inh, U bez)
        {
            
        }
        public virtual T MachEtwas()
        {
            return inhalt;
        }
        
        
    }
    class AndererUnterContainer<T, U> : MeinContainer<int, double>
    {
        public AndererUnterContainer(int inh, double bez) : base(inh, bez)
        {
            
        }

        public UnterContainer()
        {
            
        }
        public UnterContainer<T, U> : MeinContainer<T, U>()
        {

        }
        
    }
    public class NichtGenerischeKlasse
    {
        public NichtGenerischeKlasse()
        {

        }
    }
    class Abgeleitet<T> : NichtGenerischeKlasse
    {

    }
    //class ABC : MeinContainer<T, U>
    //{
    //    public ABC(T inh, U bez) : base(inh, bez)
    //    {
    //    }
    //}
}
