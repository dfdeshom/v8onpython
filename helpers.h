// didier deshommes <dfdeshom@gmail.com>
// BSD license
#include "v8-src/include/v8.h"
#define HANDLESCOPE() v8::HandleScope scope
#define ATTACH_SCOPE_TO_CONTEXT(context)  v8::Context::Scope s = v8::Context::Scope (context)
#define RUN_SCRIPT(script) script->Run()
