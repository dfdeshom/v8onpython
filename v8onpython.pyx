# didier deshommes

cdef extern from "scopehandle.h":
    void HANDLESCOPE() 

    # Context
    ctypedef struct c_context "v8::Handle<v8::Context>":
        pass
    c_context c_context_factory "v8::Context::New"()

    # Scope
    ctypedef struct c_scope "v8::Context::Scope":
        pass
    c_scope c_scope_factory "v8::Context::Scope _scope"(c_context)

    # Value
    ctypedef struct c_value "v8::Handle<v8::Value>":
        pass

    # String
    ctypedef struct c_string "v8::Handle<v8::String>":
        void (* Length)()
    c_string c_string_factory "v8::String::New"(char *s)
    
    # Script
    ctypedef struct c_script "v8::Handle<v8::Script>":
        pass
    c_script c_script_fatory "v8::Script::Compile"(c_string)


cdef class Value:
    #cdef c_context context
    
    def __cinit__(self):
        """  
        Create a Context() 
        """
        # Create a handle scope
        HANDLESCOPE()
        
        # Create a new context
        c_context_factory()

        # New scope
        
    def compile(self,code):
        # handle scope
        HANDLESCOPE()
        print 'done 1'
        # Create a new context
        cdef c_context context = c_context_factory()
        print 'done 2'
        # Context scope
        cdef c_scope scope = c_scope_factory(context)
        print 'done 3'
        cdef c_string clone = c_string_factory(code)
        print 'done 4'
        cdef c_script script = c_script_fatory(clone)

    def set_value(self,int val):
        pass
        #cdef c_value r = <c_value>cstring_factory('2',1)
        
    def print_value(self):
        pass
        #r= (<c_value>self.c).Int32Value()
        #return r
