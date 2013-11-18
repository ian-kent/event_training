#!/usr/bin/env perl

# Linear blocking code

sub delay {
    sleep 1;
    print "Hi\n";
}

# Call delay 10 times
delay for (1..10);

# Linear, so we're done
print "Done\n";
