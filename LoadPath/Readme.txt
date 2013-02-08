Notes for talk on the

The $PATH
  On the command line there is the $PATH
  This can be thought of as an array which holds directories.
  Really it's string with directories separated by colons.
  `$ echo $PATH`
  `$ echo $PATH | tr : "\n"`
  When I run a program like `$ls`, it searches through these directories until it finds the program, and then runs it.
  You can see where a program is by saying `$which ls` (/bin/ls)
  And we can see that /bin is in the $PATH, so when we run it, it will search through these directories until it finds the ls in /bin
  Now what if we put another directory in front of it, which has an ls program in it?
  Then it will find the other ls program.

  `
  $ cat > ls
  echo this is the fake ls
  ^D

  $ ls
  some_file.rb ls

  $ PATH=".:$PATH" ls
  this is the fake ls
  `

  In fact, this is how RVM switches out which Ruby you are currently using, it modifies the load path so that the ruby you want to use will always be found first.

How the $LOAD_PATH works
  The Ruby $LOAD_PATH works very similarly to the Unix PATH variable
  When you say `require "filename"` how does Ruby know where to find that file?
  It uses a similar construct called the `$LOAD_PATH`
  The $LOAD_PATH is an array of directories as well. You can see it with `$ ruby -r pp -e 'pp $LOAD_PATH'`
  Ruby uses a similar concept in order to find files when you require them.
  You say `require 'filename'` and it searches, sequentially, through each directory in the `$LOAD_PATH` until it finds the one with that file, and then it loads it up.
  Lets try an example (example1)
    The first file requires the second, and it is in the same directory
    Notice it fails
    Lets fix the load path and try again
  Lets try a more common example (example2)
    The binary puts lib into the load path, and then the library requires everything relative to lib.

Setting the $LOAD_PATH
  The global variable
    The ways that I've shown you so far involve manually editing the $LOAD_PATH variable to add your directory
  The RUBYLIB environment variable contains dirs to be added to the load path
    `$ RUBYLIB=/abc ruby -r pp -e 'pp $LOAD_PATH'` Now we can see that /abc was added to the $LOAD_PATH
    back to example 1
    `$ ruby file1.rb` blows up still
    `RUBYLIB=. ruby file1.rb` will work because we've set the environment variable
  The -I flag will also set directories on the load path
    `ruby -I /abc -r pp -e 'pp $LOAD_PATH'`
    `ruby -I . file1.rb`
  What about when running specs?
    RSpec will automatically put lib and spec into the load path if it sees them, if you named yours differently or have other dirs, you can use the -I switch like with Ruby

Related topics we can cover if we have time
  Why do we do `$LOAD_PATH.unshift dirname` instead of `$LOAD_PATH << dirname` ?
  What happens if you require a file more than once?
  Why do gems follow the directory structure of example2?

