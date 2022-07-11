use warnings;
use strict;
use 5.010;
use lib qw/./;
use ChopStrat;

package RecursiveChopStrat;
our @ISA = qw/ChopStrat/;

sub chop {
  my $this = shift;
  my ($val, $nums_r) = @_; 
  my @nums = @{$nums_r};
  return -1 unless @nums;

  my $low = 0;
  my $high = scalar (@nums) - 1;
  return $this->recurse($high, $low, $nums_r, $val);
}

sub recurse {
  my $this = shift;
  my ($high, $low, $nums_r, $val) = @_;
  my @nums = @{$nums_r};
  my $mid = int(($high + $low) / 2); 

  $this->printDebug($low, $high);

  if ($high == $low) {
    return $nums[$low] == $val ? $low : -1;
  }
  given ($nums[$mid]) {
    when ($_ == $val) {return $mid;}
    when ($_ < $val) {return $this->recurse($high, $mid+1, $nums_r, $val);}
    when ($_ > $val) {return $this->recurse($mid, $low, $nums_r, $val);}
  }
}

return 1;
