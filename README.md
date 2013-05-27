ruby-native-extension-bug
=========================

Just a proof of concept repository for a bug.

To try it:
  * clone the repository
  * bundle install
  * rake compile (Produces an error)

To fix the bug:
  * patch MakeMakefile.link_command() to reverse order of libraries