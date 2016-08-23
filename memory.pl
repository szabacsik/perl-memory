#!/usr/bin/perl

#for i in {1..10}; do ./memory.pl; done

use strict;
use warnings;

#Enable Autoflush
select(STDERR);
local $| = 1;
select(STDOUT);
local $| = 1;

#initialize an array
my @stack = ();

#scalar variable will hold random string
#my $data = '';

#length of the random string
my $min_length = 100000;
my $max_length = 900000;
my $length = 0;

#set to not zero when you read for an infinite loop
my $endless = 1;

#sleep seconds during loops
my $sleep_seconds = 0;

#main loop
for ( ; ; )
{
	add_to_stack ();
	remove_from_stack ();
	check_things ();
	if ( $sleep_seconds ) {	sleep ( $sleep_seconds ); }
	if ( !$endless ) { last; }
}

exit 0;

sub add_to_stack
{
	$length = $min_length + int rand ( $max_length );
	my $string = randStr ( $length );
	$length = length $string;
	push @stack, $string;
}

sub check_things
{
	my $line_count = scalar @stack;
	my $size = "@stack"; 
	my $howbig = length $size;
	#print $stack[$#stack]."\n";
	print "New line of length $length added. ";
	print "Stack has $line_count lines of strings. ";
	print "Stack size is $howbig bytes now.\r";
}

sub remove_from_stack
{
	my $line_count = scalar @stack;	
	#pop @stack;
	if ( $line_count >= 3 )
	{
		splice ( @stack, 2, 1 );
	}
}

#random string function
sub randStr {
    return join('', map{('a'..'z','A'..'Z',0..9)[rand 62]} 0..shift);
}

