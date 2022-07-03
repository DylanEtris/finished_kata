use strict;
use warnings;
use List::MoreUtils qw/firstidx/;

package LetterDiamond;
sub new {
  my $this = shift;
  my $self = {
    _letters => ['a'..'z']
  };
  bless $self, $this;
  return $self;
}

sub print {
  my $this = shift;
  my ($char) = @_;
  my $result = '';

  $result .= $this->upperHalf($char);
  $result .= $this->lowerHalf($char);
  return $result;
}

sub upperHalf {
  my $this = shift;
  my ($char) = @_;
  my $result = '';

  my $idx = -1; 
  while ($idx < $this->letterPos($char)) {
    $idx += 1;
    $result .= $this->formattedLine($char, $idx);
  }
  return $result;
}

sub lowerHalf {
  my $this = shift;
  my ($char) = @_;
  my $result = '';

  my $idx = $this->letterPos($char) - 1;
  while ($idx >= 0) {
    $result .= $this->formattedLine($char, $idx);
    $idx -= 1;
  }
  return $result;
}

sub formattedLine {
  my $this = shift;
  my ($char, $idx) = @_; 
  my $result = '';

  $result .= $this->outerPad($char, $idx);
  $result .= $this->innerContents($idx);
  $result .= $this->outerPad($char, $idx);
  $result .= "\n";
  return $result;
}

sub outerPad{
  my $this = shift;
  my ($char, $idx) = @_;
  return ' 'x($this->letterPos($char) - $idx);
}
  

sub innerContents{
  my $this = shift;
  my ($idx) = @_;
  if ($idx == 0) {
    return $this->{_letters}->[$idx];
  } else {
    return $this->{_letters}->[$idx] . ' 'x((2*$idx)-1) . $this->{_letters}->[$idx];
  }
}

sub letterPos {
  my $this = shift;
  my ($char) = @_;
  return List::MoreUtils::firstidx {$_ eq $char} @{$this->{_letters}};
}

return 1;
