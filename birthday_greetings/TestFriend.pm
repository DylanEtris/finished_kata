#!/usr/bin/perl

use lib qw/./;
use Test::Class;

package TestFriend;
use base qw/Test::Class/;
use Test::More;
use Friend;
use MockFriendDB;
use MockMessagePreference;

sub setup : Test(setup) {
  my $f = Friend->new(0, 'Doe', 'Jane', $time, 'Jane.Doe@foobar.com');
  shift->{_testFriend} = $f;
}

sub testFriendData : Test(5) {
  my $f = shift->{_testFriend};
  my $time = localtime();
  ok($f->getId() == 0);
  ok($f->getFName() eq 'Jane');
  ok($f->getLName() eq 'Doe');
  ok($f->getBDate() == $time);
  ok($f->getEmail() == 'Jane.Doe@foobar.com');
}

sub testQueryFriends : Test {
  my $time = localtime();
  my $f = shift->{_testFriend};
  my $db = MockFriendDB->new();
  $db->add($f);
  my $result = $db->find(0);
  ok($result->getFName() eq 'Jane');
}

sub sendGreetingSendsGreeting : Test {
  my $f = shift->{_testFriend};
  my $mp = MockMessagePreference->new();
  $f->addMessagePreference($mp);
  $f->sendGreeting();
  ok($mp->greetingSent() == 1);
}

Test::Class->runtests();
