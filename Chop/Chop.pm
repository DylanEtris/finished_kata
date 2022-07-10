
use warnings;
use strict;
use 5.010;

package IterativeChopStrat;

sub new {
  my $class = shift;
  my $self = {};
  bless $self, $class;
  return $self
}

sub chop {
  my $this = shift;
  my ($val, $nums_r) = @_;
  my @nums = @{$nums_r};
  return -1 unless @nums;

  my $low = 0;
  my $high = scalar(@nums) - 1;
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
  if ($nums[$low] == $val) {
    return $low;
  } else {
    return -1;
  }
}

sub printDebug {
  my $this = shift;
  my ($low, $high) = @_;
  if ($ENV{'DEBUG'} eq 'true') {
    print "High: $high\n";
    print "Low $low\n";
    sleep 5;
  }
}

return 1;
