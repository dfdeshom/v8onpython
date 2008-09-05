// didier deshommes
#include "include/v8.h"
#define HANDLESCOPE() v8::HandleScope scope
#define ATTACH_SCOPE_TO_CONTEXT(context)  v8::Context::Scope s = v8::Context::Scope (context)
#define RUN_SCRIPT(script) script->Run()

#include <stdio.h>
#include <string.h>

inline void ascii(v8::Handle<v8::Value> handle,char *res)
{
  v8::String::AsciiValue ascii(handle);
  memcpy(res,*ascii,strlen(*ascii)+1);
  
}
