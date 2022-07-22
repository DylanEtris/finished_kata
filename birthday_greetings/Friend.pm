use warnings;
use strict;
use v5.10;

package Friend;

sub new {
  my $class = shift;
  my ($id, $lname, $fname, $bdate, $email) = @_;
  my $this = {
    _id => $id,
    _fname => $fname,
    _lname => $lname,
    _email => $email,
    _mp => undef,
  };
  bless $this, $class;
  return $this;
}

sub getFName {
  my $this = shift;
  return $this->{_fname};
}

sub getLName {
  my $this = shift;
  return $this->{_lname};
}

sub getBDate {
  my $this = shift;
  return $this->{_bdate};
}

sub getEmail {
  my $this = shift;
  return $this->{_email};
}

sub getId {
  my $this = shift;
  return $this->{_id};
}

sub addMessagePreference {
  my $self = shift;
  my ($mp) = @_;
  $self->{_mp} = $mp;
}

sub sendGreeting {
  my $self = shift;
  my ($msg) = shift;
  $self->{_mp}->send($msg);
}

return 1;
