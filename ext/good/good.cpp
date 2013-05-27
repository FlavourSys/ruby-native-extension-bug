#include <ruby.h>

VALUE rb_mGood = Qnil;

extern "C" {

  void Init_good() {
    rb_mGood = rb_define_module("Good");
  }
}