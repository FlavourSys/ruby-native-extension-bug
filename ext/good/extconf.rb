require 'mkmf'

# unless find_executable('g++')
#   abort 'Error: could not find g++'
# end

fail_lib_dir = File.expand_path(File.join(File.dirname(__FILE__), '../../lib'))
fail_inc_dir = File.expand_path(File.join(File.dirname(__FILE__), '../libfail'))

unless find_library('fail', nil, fail_lib_dir)
   abort 'no fail found'
end

$INCFLAGS << " " << "-I#{fail_inc_dir}"

create_makefile('good')
