#!/usr/bin/perl

use lib qw/./;
use Test::Class;
use MockIo;
use IO::Handle;

package TestIoMessagePreference;
use base qw/Test::Class/;
use Test::More;
use IoMessagePreference;

sub testWrites : Test {
  my $io = MockIo->new();
  my $iomp = IoMessagePreference->new($io);
  $iomp->send("Hello!");
  ok($io->read() eq "Hello!");
}

Test::Class->runtests();
