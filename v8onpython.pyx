# didier deshommes

cdef extern from "v8.h":
    # Context
    ctypedef struct c_context "v8::Handle<v8::Context>":
        pass
    c_context c_context_factory "v8::Context::New"()

    # Scope
    ctypedef struct c_scope "v8::Context::Scope":
        pass
    c_scope c_scope_factory "v8::Context::Scope"(c_context c)

    # Global
    ctypedef struct c_object_template "v8::Handle<v8::ObjectTemplate>":
        pass
    c_object_template c_template_factory "v8::ObjectTemplate::New"()

    # Value
    ctypedef struct c_value "v8::Handle<v8::Value>":
        pass


    # String
    ctypedef struct c_string "v8::Handle<v8::String>":
        pass
    c_string c_string_factory "v8::String::New"(char *s)
    c_string ascii "v8::String::AsciiValue" (c_value c)

    # Script
    ctypedef struct c_script "v8::Handle<v8::Script>":
        void (* Run) ()
    c_script c_script_compile "v8::Script::Compile"(c_string c)
    

cdef extern from "scopehandle.h":
    void HANDLESCOPE() 
    void ATTACH_SCOPE_TO_CONTEXT(c_context (c))
    c_value RUN_SCRIPT(c_script (s))
    void ascii(c_value,char *res)

cdef class Value:
    #cdef c_context context
    
    def __cinit__(self):
        """  
        Create a Context() 
        """
        pass
        # Create a handle scope
        #HANDLESCOPE()
        
        # Create a new context
        #c_context_factory()

        # New scope
        
    def compile(self,code):
        
        # handle scope
        HANDLESCOPE()
        #print 'done 1'
        
        # Create a new context
        cdef c_context context = c_context_factory()
        #print 'done 2'
        
        # Context scope 
        ATTACH_SCOPE_TO_CONTEXT(context) 
        #cdef c_scope scope = c_scope_factory(context)
        #print 'done 3'
 
        # Create a string object to store the source
        cdef c_string clone = c_string_factory("'a'")
        #print 'done 4'
        
        # Create a script object
        cdef c_script script = (c_script_compile(clone))
        cdef c_value result = RUN_SCRIPT(script)
        cdef char *res
        ascii(result ,*res)
        s = str(*res)
        return s
       #script.Run()
         
