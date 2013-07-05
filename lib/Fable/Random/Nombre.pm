package Fable::Random::Nombre;
use Data::Dumper;

our $instancia = Fable::Random::Nombre->new;

sub instancia {
  return $Fable::Random::Nombre;
}

sub new {
  my $self = bless({
    silabas => {},
  },'Fable::Random::Nombre');
  $self->crear_silabas;
  return $self;
}

sub hacer {
  my $self = $Fable::Random::Nombre::instancia;
  shift;
  my $numero_silabas = shift;
  $numero_silabas = 3 if not defined $numero_silabas;
  my $nombre = '';
  my $silabas = int(rand($numero_silabas))+2;
  for(1..$silabas) {
    my $numero = int(rand(scalar(values %{$self->{silabas}})));
    $nombre .= [values(%{$self->{silabas}})]->[$numero];
  }
  return $nombre
}

sub crear_silabas {
  my $self = shift;
  my $cantidad = shift;
  $cantidad = 20 if not $cantidad;
  my $cc = $cantidad;
  my %silabas;
  while($cc) {
    my @letras = (A..Z);
    my $longitud = 3;
    my $c = int(rand($longitud)+1);
    my $silaba = '';
    while ($c) {
      $silaba .= $letras[int(rand($#letras))];
      $c--;
    }
    my $boo = 0;
    foreach my $rx (&formulas) {
      if($silaba =~ /$rx/) {
        $boo = 1;
        last;
      }
    }
    if($boo) {
      $silabas{$silaba} = $silaba;
      $cc--;
    }
  }
  $self->{silabas} = {%silabas};
  return $self;
}

sub formulas {
  return (
    qr/^[^AEIOU][AEIOU]$/,
    qr/^[BPDVCFGKT][R][AEIOUY]$/,
    qr/^[BPVCFGK][L][AEIOUY]$/,
    qr/^[AEIOUY]$/
  );
}

1;
