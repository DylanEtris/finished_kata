#!/usr/bin/perl

use Test::More;
use lib qw /./;
use IterativeChopStrat;
use RecursiveChopStrat;

sub runTheGauntlet {
  my $chopStrat = $_[0];
  ok($chopStrat->chop(3, []) == -1);
  ok($chopStrat->chop(3, [1]) == -1);
  ok($chopStrat->chop(1, [1]) == 0);

  ok($chopStrat->chop(1, [1, 3, 5]) == 0);
  ok($chopStrat->chop(3, [1, 3, 5]) == 1);
  ok($chopStrat->chop(5, [1, 3, 5]) == 2);
  ok($chopStrat->chop(0, [1, 3, 5]) == -1);
  ok($chopStrat->chop(2, [1, 3, 5]) == -1);
  ok($chopStrat->chop(4, [1, 3, 5]) == -1);
  ok($chopStrat->chop(6, [1, 3, 5]) == -1);

  ok($chopStrat->chop(1, [1, 3, 5, 7]) == 0);
  ok($chopStrat->chop(3, [1, 3, 5, 7]) == 1);
  ok($chopStrat->chop(5, [1, 3, 5, 7]) == 2);
  ok($chopStrat->chop(7, [1, 3, 5, 7]) == 3);
  ok($chopStrat->chop(0, [1, 3, 5, 7]) == -1);
  ok($chopStrat->chop(2, [1, 3, 5, 7]) == -1);
  ok($chopStrat->chop(4, [1, 3, 5, 7]) == -1);
  ok($chopStrat->chop(6, [1, 3, 5, 7]) == -1);
  ok($chopStrat->chop(8, [1, 3, 5, 7]) == -1);
}

$ENV{'DEBUG'} = 'false';
runTheGauntlet(IterativeChopStrat->new());

$ENV{'DEBUG'} = 'false';
runTheGauntlet(RecursiveChopStrat->new());

done_testing();
