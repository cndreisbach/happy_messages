HappyMessages
=============

HappyMessages is a simple plugin to make dealing with displaying messages to
the user easier. Instead of setting `flash[:notice]` or whatever, you can call
`add_notice` or `add_error` with your message, like so:

    add_notice "Your mother just called."
    add_error "I drink your milkshake.", :now => true

Notice the one option, `:now`. This indicates to show the message in the
immediate page render, not on the next render. It doesn't actually set
`flash[:now]`, but fulfills much the same purpose.

To activate HappyMessages, add this line to ApplicationController:

    include HappyMessages

I could have done that in `init.rb`, but I didn't want to be presumptuous.


Copyright (c) 2010 Clinton R. Nixon of Viget Labs, released under the MIT license
