#!/usr/bin/env perl

# Blocking
my $result;
eval {
    $result = Some::Module->something("foo");
};
if(my $error = $@) {
    # Handle error here
} else {
    # Handle result here
}

# Non-blocking using a callback
Some::Module->something("foo" => sub {
    my ($result, $error) = @_;

    if($error) {
        # Handle error here
    } else {
        # Handle result here
    }
});

# Non-blocking using events
my $e = Some::Module->something("foo");

$e->on(finish => sub {
    my $result = shift;
    # Handle result here
});

$e->on(error => sub {
    my $error = shift;
    # Handle error here
});
