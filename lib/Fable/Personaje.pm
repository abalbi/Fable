package Personaje;
use fields qw(_vars);
our $AUTOLOAD;

sub new {
  my $self = shift;
  unless (ref $self) {
    $self = fields::new($self);
  }
  return $self;
}

sub var {
  my $self = shift;
  my $var = shift;
  my $val = shift;
  if (defined $val) {
    $self->{_vars}->{$var} = $val;
  }
  return $self->{_vars}->{$var};
}

sub del {
  my $self = shift;
  my $var = shift;
  return delete $self->{_vars}->{$var};
}

sub AUTOLOAD {
  my $self = shift;
  my $val = shift;
  my $var = $AUTOLOAD;
  $var =~ s/.*://;   # strip fully-qualified portion
  return if $var =~ /DESTROY/;
  return $self->var($var,$val);
}
1;
