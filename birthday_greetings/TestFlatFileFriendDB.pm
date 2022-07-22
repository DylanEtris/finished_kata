#!/usr/bin/perl

use lib qw/./;
use Test::Class;

package TestFlatFileFriendDB;
use base qw/Test::Class/;
use Test::More;
use FlatFileFriendDB;

sub testReadsTheFile : Test(4) {
  my $db = FlatFileFriendDB->new('friends.txt');
  my $friend = $db->find(0); 
  ok($friend->getFName() eq 'Jane');
  ok($friend->getLName() eq 'Doe');

  my $friend = $db->find(1);
  ok($friend->getFName() eq 'Mary');
  ok($friend->getLName() eq 'Ann');
}

Test::Class->runtests();
