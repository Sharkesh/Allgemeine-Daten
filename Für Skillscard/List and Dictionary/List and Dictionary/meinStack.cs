using GenericsUndCollections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericUndCollections
{
    public class MeinStack<T>
    {
        List<T> lst;

        public MeinStack()
        {
            lst = new List<T>();
        }

        public T Peek()
        {
            return lst[lst.Count - 1];
        }
        public void Push(T el)
        {
            lst.Add(el);
        }
        public T Pop()
        {
            T el = lst[lst.Count - 1];
            lst.RemoveAt(lst.Count - 1);
            return el;
        }
    }
    public class LLStack<T>
    {
        LL<T> lst;

        public LLStack(T d)
        {
            lst = new LL<T>(d);
        }

        public T Peek()
        {
            return lst.getData(lst.Count - 1);
        }
        public void Push(T el)
        {
            lst.InsertAfterIndex(el, lst.size-1);            
        }
        public T Pop()
        {
            T el = lst.getData(lst.size-1);
            lst.RemoveIndex(lst.size - 1);
            return el;
        }
    }
}
