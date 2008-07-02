
use strict;
use warnings;

use Test::More tests => 9;

use Math::Goedel;

SKIP: {
  eval "use bigint";
  skip("cannot use bigint") if $@;


  is(Math::Goedel::enc('9'),
    2**9 );
  is(Math::Goedel::enc('99'),
    2**9 * 3**9 );
  is(Math::Goedel::enc('999'),
    2**9 * 3**9 * 5**9 );
  is(Math::Goedel::enc('9999'),
    2**9 * 3**9 * 5**9 * 7**9 );
  is(Math::Goedel::enc('99999'),
    2**9 * 3**9 * 5**9 * 7**9 * 11**9 );
  is(Math::Goedel::enc('999999'),
    2**9 * 3**9 * 5**9 * 7**9 * 11**9 * 13**9 );
  is(Math::Goedel::enc('9999999'),
    2**9 * 3**9 * 5**9 * 7**9 * 11**9 * 13**9 * 17**9 );
  is(Math::Goedel::enc('99999999'),
    2**9 * 3**9 * 5**9 * 7**9 * 11**9 * 13**9 * 17**9 * 19**9 );
  is(Math::Goedel::enc('999999999'),
    2**9 * 3**9 * 5**9 * 7**9 * 11**9 * 13**9 * 17**9 * 19**9 * 23**9);
}


