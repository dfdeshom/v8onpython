# didier deshommes

cdef extern from "scopehandle.h":
    void HANDLESCOPE() 

cdef extern from "include/v8.h":
    ctypedef struct c_handlescope "v8::HandleScope":
        pass
    void** c_create_handle "v8::HandleScope::CreateHandle"(void*)

    # Context
    ctypedef struct c_context "v8::Handle<v8::Context>":
        pass
    c_context c_context_factory "v8::Context::New"()

    # Value
    ctypedef struct c_value "v8::Handle<v8::Value>":
        pass
    
cdef class Value:
    cdef c_handlescope handlescope
    cdef c_value c
    cdef c_context context

    def __cinit__(self):
        """  
        Create a Context() 
        """
        HANDLESCOPE()
        
    def set_value(self,int val):
        pass
        #cdef c_value r = <c_value>cstring_factory('2',1)
        
    def print_value(self):
        pass
        #r= (<c_value>self.c).Int32Value()
        #return r
