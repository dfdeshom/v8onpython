# didier deshommes
cdef extern from "include/v8.h":
    ctypedef struct c_value "v8::Number":
        void (*Int32Value)()
    
    c_value cvalue_factory "v8::Number::New"(int i)

    
cdef class Value:
    cdef c_value c 
    def __init__(self):
        """
        test
        """
        print 0  
        #cvalue_factory(2)
 
