package Test::MockManager;
use Data::Dumper;
use base qw(Test::Class);
use lib 'lib';
use MockManager;
use Test::More;
use Test::Exception;

use Fable::Personaje;

sub before : Test(setup) {
  MockManager->limpiar;
};


sub personaje_var_set_get : Test(1) {
  my $self = shift;
  my $p = Personaje->new();
  $p->var('atributo1','valor1');
  is($p->var('atributo1'),'valor1');
}

sub del : Test(1){
  my $self = shift;
  my $p = Personaje->new();
  $p->var('atributo1','valor1');
  $p->del('atributo1');
  is($p->var('atributo1'),undef);

}

1;
__PACKAGE__->new->runtests
