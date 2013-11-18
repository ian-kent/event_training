#!/usr/bin/env perl

# Callback hell
Some::Module->something("foo" => sub {
    my ($result) = @_;

    Some::Module->something("foo" => sub {
        my ($result) = @_;

        Some::Module->something("foo" => sub {
            my ($result) = @_;

            Some::Module->something("foo" => sub {
                my ($result) = @_;

            });
        });
    });
});
