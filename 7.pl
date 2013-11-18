#!/usr/bin/perl env

#-------------------------------------------------------------------------------

# Lexical or code reference callbacks lose the callers scope
my $cb = sub {
    my ($result) = @_;

    # Only have access to $result
    # $self isn't in scope here
};
sub my_sub {
    my ($result) = @_;

    # Same as above, $self isn't in scope
}

sub action {
    my ($self) = @_;

    Some::Module->something("foo" => $cb);
    Some::Module->something("foo" => \&my_sub);
}

#-------------------------------------------------------------------------------

# Lexical scope is maintained inside a closure
sub action {
    my ($self) = @_;

    Some::Module->something("foo" => sub {
        my ($result) = @_;

        # Still have access to $self here
    });
}

#-------------------------------------------------------------------------------
