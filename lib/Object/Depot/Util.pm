package Object::Depot::Util;
use strictures 2;

use Carp qw();
use Exporter qw( import );

our @EXPORT_OK = qw( croak croakf );

sub croak {
    local $Carp::Internal{'Object::Depot'} = 1;
    local $Carp::Internal{'Object::Depot::Carp'} = 1;
    local $Carp::Internal{'Object::Depot::Singleton'} = 1;

    goto &Carp::croak;
}

sub croakf {
    my $msg = shift;
    $msg = sprintf( $msg, @_ );
    @_ = ( $msg );
    goto &croak;
}

1;
