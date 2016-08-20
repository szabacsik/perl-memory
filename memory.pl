#!/usr/bin/perl

#for i in {1..10}; do ./randomstring.pl; done

use strict;
use warnings;

#initialize an array
my @stack = ();

#scalar variable will hold random string
my $data = '';

#length of the random string
my $min_length = 3;
my $max_length = 2000;
my $length = 0;

#set to 1 when you read for an infinite loop
my $endless = 1;

#sleep seconds during loops
my $sleep_seconds = 0;

#main loop
for ( ; ; )
{
	$length = $min_length + int rand ( $max_length );
	push @stack, randStr ( $length );
	#print $stack[$#stack]."\n";
	if ( $sleep_seconds ) {	sleep ( $sleep_seconds ); }
	if ( !$endless ) { last; }
}

exit 0;

#random string function
sub randStr {
    return join('', map{('a'..'z','A'..'Z',0..9)[rand 62]} 0..shift);
}