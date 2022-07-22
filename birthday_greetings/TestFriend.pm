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
  my $this = shift;
  my $fid = 0;
  my $f = Friend->new($fid, 'Doe', 'Jane', $time, 'Jane.Doe@foobar.com');
  $this->{_testFriend} = $f;
  $this->{_fid} = $fid;
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
  my $this = shift;
  my $f = $this->{_testFriend};
  my $time = localtime();
  my $db = MockFriendDB->new();
  $db->add($this->{_fid}, $f);
  my $result = $db->find(0);
  ok($result->getFName() eq 'Jane');
}

sub sendGreetingSendsGreeting : Test {
  my $f = shift->{_testFriend};
  my $mp = MockMessagePreference->new();
  my $msg = "Hello there!";
  $f->addMessagePreference($mp);
  $f->sendGreeting($msg);
  ok($mp->greetingSent() eq $msg);
}

Test::Class->runtests();
