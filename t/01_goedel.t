
use strict;
use warnings;

use Test::More tests => 7;

BEGIN { use_ok('Math::Goedel'); }

is(Math::Goedel::goedel(9), 512);
is(Math::Goedel::goedel(81), 768);
is(Math::Goedel::goedel(230), 108);

is(Math::Goedel::goedel(q/9/), 512);
is(Math::Goedel::goedel(q/81/), 768);
is(Math::Goedel::goedel(q/230/), 108);

