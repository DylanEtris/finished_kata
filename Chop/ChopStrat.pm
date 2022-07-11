
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

sub oneLastCheck {
  my $this = shift;
  my ($high, $low, $nums_r, $val) = @_;

  my @nums = @{$nums_r};

  if ($high == $low) {
    return $nums[$low] == $val ? $low : -1;
  }
}

return 1;
