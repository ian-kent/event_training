#!/usr/bin/env perl

use Mojolicious::Lite;

# Calling this one lets other requests continue
get '/foo/:foo' => sub {
    my ($self) = @_;

    print "START\n";

    Mojo::IOLoop->timer(5 => sub {
        print STDERR "DONE\n";
        $self->render(text => "Hello world!");
    });

    print "END\n";
};

# Calling this one will block the event loop
get '/bar/:bar' => sub {
    my ($self) = @_;

    print "START\n";

    sleep 5;

    $self->render(text => "Hello world!");

    print "END\n";
};

app->start;
