use lib qw/./;
use Friend;

package FlatFileFriendDB;

sub new {
  my $class = shift;
  my ($file) = @_;
  my $self = {
    _friends => {}
  };
  bless $self, $class;

  open my $fh, "<", $file;
  chomp(my @lines = <$fh>);
  for (my $i = 1; $i < scalar(@lines); $i++) {
    my $line = $lines[$i];
    my @attributes = split ",", $line;
    @attributes = map { s/(^\s*)|(\s*$)//g; $_ } @attributes;
    my $friend = Friend->new($id-1, @attributes);
    $self->{_friends}->{$i-1} = $friend; 
  }
  return $self;
}

sub find {
  my $self = shift;
  my ($id) = @_;
  return $self->{_friends}->{$id};
}

return 1;
