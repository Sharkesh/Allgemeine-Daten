using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericUndCollections
{
    public class MeinLinkedStack<T>
    {
        List<T> llist;

        public MeinLinkedStack()
        {
            llist = new List<T>();
        }

        public T Peek()
        {
            return llist[llist.Count - 1];
        }
        public void Push(T el)
        {
            llist.Add(el);
        }
        public T Pop()
        {
            T el = llist[llist.Count - 1];
            llist.RemoveAt(llist.Count - 1);
            return el;
        }
    }
}
