use warnings;
use strict;
use 5.010;
use lib qw/./;
use ChopStrat;

package SliceChopStrat;
our @ISA = qw/ChopStrat/;

sub chop {
  my $this = shift;
  my ($val, $nums_r) = @_;
  my @nums = @{$nums_r};
  return -1 unless @nums;

  my $length = scalar @{$nums_r} - 1;
  if ($length == 0) {
    return $val == $nums[0] ? 0 : -1;
  }

  my $mid = int ($length / 2); 
  my @nextList;
  given($nums[$mid]) {
    when ($_ == $val) { 
      return $mid; 
    }
    when ($_ > $val) { 
      my @nextList = @nums[0..$mid];
      return -1 if ($this->chop($val, \@nextList))  == -1;
      return $this->recurseWithSlice($val, \@nextList, 0);
    }
    when ($_ < $val) {
      my @nextList = @nums[($mid+1)..$length];
      return $this->recurseWithSlice($val, \@nextList, $mid + 1);
    }
  }
}

sub recurseWithSlice {
  my $this = shift;
  my ($val, $nextList_r, $offset) = @_;
      return -1 if ($this->chop($val, $nextList_r))  == -1;
      return $offset + $this->chop($val, $nextList_r);
}
