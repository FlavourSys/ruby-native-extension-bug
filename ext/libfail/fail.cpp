#include <ruby.h>

VALUE rb_mFail = Qnil;

extern "C" {

  void Init_libfail() {
    rb_mFail = rb_define_module("Fail");
  }
}