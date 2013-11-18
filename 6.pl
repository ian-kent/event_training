#!/usr/bin/env perl

# Inline callback
Some::Module->something("foo" => sub {
    my ($result) = @_;

    # Handle result here
});

# Lexical assignment
my $cb = sub {
    my ($result) = @_;

    # Handle result here
};
Some::Module->something("foo" => $cb);

# Code reference
sub handle_result {
    my ($result) = @_;

    # Handle result here
}
Some::Module->something("foo" => \&handle_result);
