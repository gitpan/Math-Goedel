use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Math::Goedel',
    AUTHOR              => 'KATOU Akira (turugina) <turugina@floralcompany.jp>',
    VERSION_FROM        => 'lib/Math/Goedel.pm',
    ABSTRACT_FROM       => 'lib/Math/Goedel.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        q{Test::More}       => 0,
        q{Exporter}         => 0,
        q{Math::Prime::XS}  => 0,
        q{List::Util}       => 0,
        q{List::MoreUtils}  => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Math-Goedel-*' },
);
