#!/usr/bin/env perl

# Non-blocking code

use Mojo::IOLoop;

my $complete = 0;
sub delay {
    print "Hi\n";
    # Stop the event loop if we've been called 10 times
    Mojo::IOLoop->stop if ++$complete == 10;
}

# Call delay 10 times in parallel
Mojo::IOLoop->timer(1 => \&delay) for (1..10);

# Start the event loop (blocks until we stop it)
Mojo::IOLoop->start unless Mojo::IOLoop->is_running;

# IOLoop has returned, so we're done
print "Done\n";
