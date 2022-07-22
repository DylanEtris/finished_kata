package MockIo;

sub new {
  my $class = shift;
  my $self = {};
  bless $self, $class;
  return $self;
}

sub write {
  my $self = shift;
  my ($msg) = @_;
  $self->{_contents} = $msg;
}

sub read {
  my $self = shift;
  return $self->{_contents};
}

return 1;
