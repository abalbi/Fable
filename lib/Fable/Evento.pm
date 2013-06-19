package Evento;
use Data::Dumper;
sub new {
  my $self = bless({},'Evento');
  $self->{hijos} = [];
  return $self;
}

sub hijos {
  my $self = shift;
  return $self->{hijos};
}

sub agregar {
  my $self = shift;
  my @hijos = @_;
  push @{$self->hijos}, @hijos;
  return $self;
}

1;
