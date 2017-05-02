#!/usr/local/bin/perl
use feature 'say';
use warnings;
use strict;
my $dir = $ARGV[0];
my %fileCntByType;
opendir(my $dh, $dir) || die;
while (readdir $dh) {
	next if /^..?$/;
	$fileCntByType{"plain"}++ if -f "$dir/$_";
	$fileCntByType{"dir"}++ if -d "$dir/$_";
}

END {
	for (keys(%fileCntByType)) {
		say "$_ => $fileCntByType{$_}";
	}
}
