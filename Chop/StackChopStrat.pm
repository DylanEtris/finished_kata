use warnings;
use strict;
use 5.010;
use lib qw/./;
use ChopStrat;

package StackChopStrat;
our @ISA = qw/ChopStrat/;

sub chop {
  my ($this, $val, $nums_r) = @_;
  return -1 unless @$nums_r;

  my @queue;
  unshift @queue, [0, scalar @$nums_r];
  while (my $next = shift @queue) {
    my ($low, $high) = @$next;
    my $mid = int (($low + $high-1) / 2); 
    if ($ENV{'DEBUG'}) {
      say "VAL: $val";
      say "MID: $mid";
      say "LOW: $low";
      say "HIGH: $high";
      sleep 3;
    }
    if ($low == $high) {
      return $nums_r->[$low-1] == $val ? $low : -1;
    }
    if ($nums_r->[$mid] == $val) {
      return $mid;
    } elsif ($nums_r->[$mid] < $val) {
      unshift @queue, [$mid+1, $high];
    } elsif ($nums_r->[$mid] > $val) {
      unshift @queue, [0, $mid];
    }
  }
}

return 1;
