package Test::MockManager;
use Data::Dumper;
use base qw(Test::Class);
use lib 'lib';
use MockManager;
use Test::More;
use Test::Exception;

use Fable::Evento;

sub before : Test(setup) {
  MockManager->limpiar;
};

#DADO que e1 es un Evento
#Y que e2 es un Evento
#Y que e3 es un Evento
#Y que e4 es un Evento
#CUANDO 
#e1->agregar(e2,e3,e4)
#ENTONCES
#e1->hijos es igual a [e2,e3,e4]

sub agregar_eventos_a_evento : Test(1) {
  my $self = shift;
  my $e1 = Evento->new();
  my $e2 = Evento->new();
  my $e3 = Evento->new();
  my $e4 = Evento->new();
  $e1->agregar($e2,$e3,$e4);
  is_deeply($e1->hijos, [$e2,$e3,$e4]);
}

1;
__PACKAGE__->new->runtests
