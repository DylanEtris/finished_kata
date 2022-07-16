use warnings;
use strict;
use 5.010;
use lib qw/./;
use ChopStrat;

package IterativeSliceChopStrat;
our @ISA = qw/ChopStrat/;

sub chop {
  my $this = shift;
  my ($val, $nums_r) = @_;
  return -1 unless @{$nums_r};

  my @nextList = @$nums_r;
  my $offset = 0;
  while (scalar(@nextList) != 1) {
    my $length = scalar(@nextList);
    my $mid = int(($length - 1) / 2);
    my $midVal = @nextList[$mid];

    if ($midVal == $val) { 
      return $offset + $mid; 
    }
    if ($midVal < $val) {
      $offset += $mid + 1;
      @nextList = @nextList[($mid+1)..($length-1)];
    }
    if ($midVal > $val) {
      @nextList = @nextList[0..($mid)];
    }
  }
  return $nextList[0] == $val ? $offset : -1;
}
