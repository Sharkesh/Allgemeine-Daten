using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericsUndCollections
{
    public class LL<G> //Logik zum Verlinken der List (Name für Datentyp kann beliebig sein; CARE: Konsistenz wahren -> Innerhalb der Klasse muss die Bezeichnung übereinstimmen!!! (hier G)
    {
        public LLNode<G> start; //Feld anlegen
        public LLNode<G> last; //Feld anlegen
        public int size { get; set; } //dient der Größenbestimmung für Index
        public LL(G d)
        {
            start = last = new LLNode<G>(d);
        }

        public int AddAtEnd(G d)
        {
            LLNode<G> newNode = new LLNode<G>(d); //neuer Knoten
            last.next = newNode; //Letztes Element zeigt auf neues Node Element
            last = newNode; //Letztes Element ist gleichzeitig zuletzt hinzugefügtes Element

            size++;
            return size - 1; //gibt uns die Position zurück
        }

        public int InsertAfterIndex(G d, int pos)
        {
            LLNode<G> newNode = new LLNode<G>(d);
            LLNode<G> currentNode = start;
            for (int i = 0; i < pos; i++) //ohne pos-1 wird vom Index 0 an gezählt
            {
                currentNode = currentNode.next;
            }
            newNode.next = currentNode.next; //wg. hinzufuegen: newNode zeigt nun auf das "nächste Element", zwischen dem es eingefügt werden soll
            currentNode.next = newNode;
            size++;
            return pos;
        }

        public void RemoveIndex(int pos)
        {
            LLNode<G> currentNode = start; //Startpos angeben
            for (int i = 0; i < pos - 1; i++)
            {
                currentNode = currentNode.next; //damit pro Iteration der Knoten mit aktualisiert wird
            }

            //LLNode<G> toDelete = currentNode; //WOZU?! PALKOVICH FRAGEN!!!
            
            currentNode.next = currentNode.next.next;
            currentNode = null;
            //toDelete = null; //Objekt auflösen //WOZU?!
            size--;
        }
        public void PrintList()
        {
            LLNode<G> currentNode = start; //Startfeld angeben
            while (currentNode != null)
            {
                Console.WriteLine(currentNode.data); //gibt aktuellen Knoten aus
                currentNode = currentNode.next; //zum nächsten Knoten weiter gehen
            }
        }
    }

    public class LLNode<T> //Datentypbezeichnung = T, Platzhalter
    {
        public T data; //Feld anlegen
        public LLNode<T> next; //Feld anlegen

        public LLNode(T d)
        {
            data = d; //data erhält Parameterwert d
            next = null; //Aufs nächste Element noch kein Zeiger
        }
    }
}
