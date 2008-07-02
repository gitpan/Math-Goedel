package Math::Goedel;

use warnings;
use strict;

use Exporter qw/import/;

our @EXPORT_OK = qw/goedel/;

use Math::Prime::XS qw/is_prime/;
use List::Util qw/reduce max/;
use List::MoreUtils qw/pairwise/;

=head1 NAME

Math::Goedel - Goedel number calculator

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    use Math::Goedel qw/goedel/;

    print goedel(9);  # will print 512 (2**9)
    print goedel(81); # will print 768 (2**8 * 3**1)
    print goedel(230);# will print 108 (2**2 * 3**3 * 5**0)

    print Math::Goedel::enc(9); # same as goedel(9)

=head1 EXPORT

  @EXPORT_OK => qw/goedel/

=head1 FUNCTIONS

=head2 goedel($n)

calculate goedel number for I<n>

=cut

my %_pow_cache = (
  2 => [1,2,4,8,16,32,64,128,256,512]
);
my @_primes = (2);
my $_next_prime = sub
{
  my ($m) = @_;
  ++$m;
  while ( 1 ) {
    last if is_prime($m);
  }
  continue {
    ++$m;
  }
  $_pow_cache{$m} =
  [map { $m ** $_ } 0 .. 9];
  $m;
};

sub goedel {
  my ($n) = @_;
  my $nlen = length($n);

  push @_primes,$_next_prime->(max keys %_pow_cache)
  while ( scalar(keys %_pow_cache) < $nlen );

  my @primes_ = @_primes[0 .. $nlen-1];
  my @digits_ = split //, $n;

  reduce { $a * $b }
  pairwise { $_pow_cache{$a}[$b] }
  @primes_, @digits_;
}

=head2 enc($n)

synonym for goedel($n)

=cut

sub enc {
  goedel(@_);
}

=head1 SEE ALSO

L<http://en.wikipedia.org/wiki/G%C3%B6del_number>

=head1 AUTHOR

KATOU Akira (turugina), C<< <turugina at floralcompany.jp> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-math-goedel at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Math-Goedel>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Math::Goedel


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Math-Goedel>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Math-Goedel>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Math-Goedel>

=item * Search CPAN

L<http://search.cpan.org/dist/Math-Goedel>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2008 KATOU Akira (turugina), all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Math::Goedel
