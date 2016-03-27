# ruby-align [![Build Status](https://travis-ci.org/key-amb/ruby-align.svg?branch=master)](https://travis-ci.org/key-amb/ruby-align)

A code formatter for Ruby.

# Usage

```
ruby-align --[f]ile=your_program.rb
```

Or it can receive input from _STDIN_ and output formatted code.

# How this works?

This script provides functionality of aligning code elements such as variable
assignments or hash declarations.

Here's an example:

```ruby
## before
a = 1
dddd = (1..3)
bb = 20
e = { foo: 1, bar: 'Bar' }

stash = {
  foo: 123,
  'bar' => 'Bar',
  "bazz" => %w[ x y z ]
}

## after
a    = 1
dddd = (1..3)
bb   = 20
e    = { foo: 1, bar: 'Bar' }

stash = {
  foo:      123,
  'bar'  => 'Bar',
  "bazz" => %w[ x y z ]
}
```

If you are curious, you can see formatting examples under `spec/` directory.
In `spec/subjects/` directory, there are some unformatted code snippets.
And formatted results of them are in `spec/expects/` directory.

# Call `ruby-align` in Text Editors

Because I am a _vimmer_, here is only example of `.vimrc`.

```vim
" == ruby-align ==
" set your favorite leader key
let mapleader = ","
noremap <Leader>ra <Esc>:%! /path/to/ruby-align<Return>
noremap <Leader>rav <Esc>:'<,'>! /path/to/ruby-align<Return>
```

If you add this into your `.vimrc`, you can call `ruby-align` to whole your
buffer by typing `,ra`.
Or you can partially apply it by `,rav` for selected area in visual mode.

Settings for other editors are welcome.

# CAUTION

This program might have bugs.  
Please take a backup before you apply this to your code.

# LICENSE

The MIT License (MIT)

Copyright (c) 2016 YASUTAKE Kiyoshi
