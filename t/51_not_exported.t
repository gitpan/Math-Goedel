
use strict;
use warnings;

use Test::More tests => 2;
use Math::Goedel;

eval "goedel(9)";
ok($@);
eval "enc(9)";
ok($@);

