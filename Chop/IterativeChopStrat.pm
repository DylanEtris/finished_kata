use warnings;
use strict;
use 5.010;
use lib qw/./;
use ChopStrat;

package IterativeChopStrat;
our @ISA = qw/ChopStrat/;

sub chop {
  my $this = shift;
  my ($val, $nums_r) = @_;
  my @nums = @{$nums_r};
  return -1 unless @nums;

  my $low = 0;
  my $high = scalar(@nums) - 1;
  $this->iterate($high, $low, $nums_r, $val);
}

sub iterate {
  my $this = shift;
  my ($high, $low, $nums_r, $val) = @_;
  my @nums = @{$nums_r};

  while ($low != $high) {
    my $mid = int(($low + $high) / 2);
    given ($nums[$mid]) {
      when ($val == $_) {return $mid;}
      when ($val < $_) {$high = $mid;}
      when ($val > $_) {$low = $mid + 1;}
    }
    $this->printDebug($low, $high);
  }
  # check one last time to see if the outermost element matches $val
  if ($high == $low) {
    return $nums[$low] == $val ? $low : -1;
  }
}

return 1;
