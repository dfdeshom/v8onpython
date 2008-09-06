# didier deshommes <dfdeshom@gmail.com>
# BSD license

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
    
    # Ascii
    ctypedef struct c_ascii "v8::String::AsciiValue":
        void (* to_str "operator*") ()
    c_ascii c_ascii_factory "v8::String::AsciiValue" (c_value c)

    # Script
    ctypedef struct c_script "v8::Handle<v8::Script>":
        void (* Run) ()
        void (* IsEmpty) ()
    c_script c_script_compile "v8::Script::Compile"(c_string c)

    # Exceptions
    ctypedef struct c_try_catch "v8::TryCatch":
        void (* Exception) ()
    

# Helpers
cdef extern from "helpers.h":
    void HANDLESCOPE() 
    void ATTACH_SCOPE_TO_CONTEXT(c_context (c))
    c_value RUN_SCRIPT(c_script (s))
        
cdef class Script:
    cdef c_context context 

    def __cinit__(self):
        """  
        Create a Context() 
        """
        # Create a new context
        self.context = c_context_factory()
        pass
    

    def compile(self,code):
        """
        Compile, run and return JS code from V8 
        """
        # handle scope
        HANDLESCOPE()

        # set up exception mechanism
        cdef c_try_catch _try
        cdef c_value _try_result
        
        # Context scope 
        ATTACH_SCOPE_TO_CONTEXT(self.context) 
        #cdef c_scope scope =  
        #c_scope_factory(context)
         
        # Create a string object to store the source
        cdef c_string clone = c_string_factory(code)
                
        # Create a script object and compile it
        cdef c_script script = c_script_compile(clone)
        
        if <bint>script.IsEmpty():
            _try_result = <c_value>_try.Exception()
            _exception = str(<char*>c_ascii_factory(_try_result).to_str())
            return _exception
        
        # Run it
        cdef c_value result
        result = RUN_SCRIPT(script)
        
        # Print out the result
        s = str(<char*>c_ascii_factory(result).to_str())
        return s
         
