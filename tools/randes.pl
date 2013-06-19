use Data::Dumper;
my $data = {};

&crear_silabas();


int(rand(3))+1


sub crear_silabas {
  my $cantidad = shift;
  $cantidad = 20 if not $cantidad;
  my $cc = $cantidad;
  my @silabas;
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
      push @silabas, $silaba;
      $cc--;
    }
  }
  $data->{silabas} = [@silabas];
}

sub formulas {
  return (
    qr/^[^AEIOU][AEIOU]$/,
    qr/^[BPDVCFGKT][R][AEIOUY]$/,
    qr/^[BPVCFGK][L][AEIOUY]$/,
    qr/^[AEIOUY]$/
  );
}
