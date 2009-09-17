%{

#include <sofia-sip/su_time.h>

int native_su_time_print(lua_State*L)
{
  int SWIG_arg = 0;
  int arg2 = 32;
  char buf[arg2];
  char *arg1 = buf;
  su_time_t *arg3 = NULL;
 
  SWIG_check_num_args("su_time_print",1,1)
  if(!SWIG_isptrtype(L,1)) SWIG_fail_arg("su_time_print",1,"su_time_t const *");
 
  if (!SWIG_IsOK(SWIG_ConvertPtr(L,1,(void**)&arg3,SWIGTYPE_p_su_time_s,0))){
    SWIG_fail_ptr("su_time_print",3,SWIGTYPE_p_su_time_s);
  }
 
  su_time_print(arg1, arg2, (struct su_time_s const *)arg3);

  lua_pushstring(L, arg1);
  SWIG_arg++;
  return SWIG_arg;
  
fail:
  lua_error(L);
  return SWIG_arg;
}

%}

%native(su_time_print) int native_su_time_print(lua_State*L);

/*
%typemap(in,numinputs=0,noblock=1) (char *s, int len)
{
    int n = 32;
    char buf[n];
    $1 = buf;
    $2 = n;
}

%typemap(argout,noblock=1) (char *s, int len)
{
    lua_pushstring(L, $1);
    SWIG_arg++;
}
*/

%include <sofia-sip/su_time.h>

