package MockFriendDB;

sub new {
  my $class = shift;
  my $self = {
    _friends => {}
  };
  bless $self, $class;
  return $self 
}

sub add {
  my $self = shift;
  my ($id, $friend) = @_;
  $self->{_friends}->{$id} = $friend;
}

sub find {
  my $self = shift; 
  my ($id) = @_;
  return $self->{_friends}->{$id};
}

return 1;
