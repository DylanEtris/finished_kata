package IoMessagePreference;

sub new {
  my $class = shift;
  my ($io) = @_;
  my $self = {
    _io => $io
  };
  bless $self, $class;
  return $self;
}

sub send {
  my $this = shift;
  my ($msg) = @_;
  $this->{_io}->write($msg);
}

return 1;
