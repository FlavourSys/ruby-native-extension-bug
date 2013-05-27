ruby-native-extension-bug
=========================

Just a proof of concept repository for a bug.

To try it:
  * clone the repository
  * bundle install
  * rake compile (Produces an error)

To fix the bug:
  * patch MakeMakefile.link_command() to reverse order of libraries

  Before in mkmf.rb:

    def link_command(ldflags, opt="", libpath=$DEFLIBPATH|$LIBPATH)
      librubyarg = $extmk ? $LIBRUBYARG_STATIC : "$(LIBRUBYARG)"
      conf = RbConfig::CONFIG.merge('hdrdir' => $hdrdir.quote,
                                    'src' => "#{CONFTEST_C}",
                                    'arch_hdrdir' => $arch_hdrdir.quote,
                                    'top_srcdir' => $top_srcdir.quote,
                                    'INCFLAGS' => "#$INCFLAGS",
                                    'CPPFLAGS' => "#$CPPFLAGS",
                                    'CFLAGS' => "#$CFLAGS",
                                    'ARCH_FLAG' => "#$ARCH_FLAG",
                                    'LDFLAGS' => "#$LDFLAGS #{ldflags}",
                                    'LOCAL_LIBS' => "#$LOCAL_LIBS #$libs",
                                    'LIBS' => "#{librubyarg} #{opt} #$LIBS")
      conf['LIBPATH'] = libpathflag(libpath.map {|s| RbConfig::expand(s.dup, conf)})
      RbConfig::expand(TRY_LINK.dup, conf)
    end

  After in mkmf.rb:

    def link_command(ldflags, opt="", libpath=$DEFLIBPATH|$LIBPATH)
      librubyarg = $extmk ? $LIBRUBYARG_STATIC : "$(LIBRUBYARG)"
      conf = RbConfig::CONFIG.merge('hdrdir' => $hdrdir.quote,
                                    'src' => "#{CONFTEST_C}",
                                    'arch_hdrdir' => $arch_hdrdir.quote,
                                    'top_srcdir' => $top_srcdir.quote,
                                    'INCFLAGS' => "#$INCFLAGS",
                                    'CPPFLAGS' => "#$CPPFLAGS",
                                    'CFLAGS' => "#$CFLAGS",
                                    'ARCH_FLAG' => "#$ARCH_FLAG",
                                    'LDFLAGS' => "#$LDFLAGS #{ldflags}",
                                    'LOCAL_LIBS' => "#$LOCAL_LIBS #$libs",
                                    'LIBS' => "#{opt} #$LIBS #{librubyarg}")
      conf['LIBPATH'] = libpathflag(libpath.map {|s| RbConfig::expand(s.dup, conf)})
      RbConfig::expand(TRY_LINK.dup, conf)
    end
