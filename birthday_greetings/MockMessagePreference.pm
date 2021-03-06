package MockMessagePreference;

sub new {
  my $class = shift;
  my $self = {
  };
  bless $self, $class;
  return $self;
}

sub send {
  my $self = shift;
  my ($msg) = @_;
  $self->{_msg} = $msg;
}

sub greetingSent {
  my $self = shift;
  return $self->{_msg};
}

return 1;
