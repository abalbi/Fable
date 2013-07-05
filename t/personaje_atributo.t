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

sub personaje_del : Test(1){
  my $self = shift;
  my $p = Personaje->new();
  $p->var('atributo1','valor1');
  $p->del('atributo1');
  is($p->var('atributo1'),undef);

}

sub personaje_var_autoload : Test(2) {
  my $self = shift;
  my $p = Personaje->new();
  $p->atributo1('valor1');
  is($p->atributo1, 'valor1');
  is($p->var('atributo1'),'valor1');
}

1;
__PACKAGE__->new->runtests
