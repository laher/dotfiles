# vim config

* plugins.vim is the starting point
* settings.vim contains most of the general stuff

## Common stuff

Here's some common things which I tend to forget:

 * `gx`: open link in external browser

## vim-surround:

With cursor at the pipe below:

    |<div><em>hello</em></div>

, key in `cst<span>` to get:

    <span><em>hello</em></span>

Make sure the cursor is currently outside the tag though.


    <span><em>hello</em></span>
