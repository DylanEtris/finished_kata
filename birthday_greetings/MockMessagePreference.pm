package MockMessagePreference;

sub new {
  my $class = shift;
  my $self = {
    _sent => 0
  };
  bless $self, $class;
  return $self;
}

sub send {
  my $self = shift;
  my ($msg) = @_;
  $self->{_sent} = 1;
}

sub greetingSent {
  my $self = shift;
  return $self->{_sent};
}

return 1;
