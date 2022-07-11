
use warnings;
use strict;
use 5.010;

package ChopStrat;

sub new {
  my $class = shift;
  my $self = {};
  bless $self, $class;
  return $self
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

package IterativeChopStrat;
our @ISA = qw/ChopStrat/;

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

package RecursiveChopStrat;
our @ISA = qw/ChopStrat/;

sub chop {
  my $this = shift;
  my ($num, $nums_r) = @_; 
  my @nums = @{$nums_r};
  return -1 unless @nums;
  my $high = scalar (@nums) - 1;
  my $low = 0;
  return $this->recurse($high, $low, $nums_r, $num);
}

sub recurse {
  my $this = shift;
  my ($high, $low, $nums_r, $num) = @_;
  my @nums = @{$nums_r};
  my $mid = int(($high + $low) / 2); 

  $this->printDebug($low, $high);

  if ($high == $low) {
    return $nums[$low] == $num ? $low : -1;
  }
  given ($nums[$mid]) {
    when ($_ == $num) {return $mid;}
    when ($_ < $num) {return $this->recurse($high, $mid+1, $nums_r, $num);}
    when ($_ > $num) {return $this->recurse($mid, $low, $nums_r, $num);}
  }
}

return 1;
