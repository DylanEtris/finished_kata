#!/usr/bin/perl

use lib qw /./;
use Test::More;
use LetterDiamond;

my $ld = LetterDiamond->new();
ok($ld->print('a') eq "a\n");
ok($ld->print('b') eq " a \nb b\n a \n");
ok($ld->print('c') eq "  a  \n b b \nc   c\n b b \n  a  \n");
done_testing()
