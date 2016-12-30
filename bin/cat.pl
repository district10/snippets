#!/usr/bin/perl

# Usage:
#       $ perl cat.pl INPUT_FILE > OUTPUT_FILE

use 5.010;
use strict;
use File::Basename;
use Cwd 'abs_path';

sub inList {
    my $needle = shift;
    my @haystack = @_;
    foreach my $hay (@haystack) {
        if ( $needle eq $hay ) { return 1; }
    }
    return 0;
}

sub printLines {
    my $padding     = shift;
    my $filename    = shift;
    open my $input, '<', $filename;
    while(<$input>) {
        print $padding.$_;
    }
}

sub unfold {
    my $padding     = shift;
    my $filename    = shift;
    my $fullname    = abs_path($filename);
    if (&inList($fullname, @_) == 1) {
        &printLines($padding, $filename);
    } else {
        unshift(@_, $fullname);
        open my $input, '<', $filename;
        while(<$input>) {
            if (/^(\s*)\@include <-=(.*)=/) {
                &unfold($padding.$1, dirname($filename)."/".$2, @_);
            } elsif (/^(\s*)\%include <-=(.*)=/) {
                &printLines($padding.$1, $2);
            } else {
                print $padding.$_;
            }
        }
    }
}

&unfold("", $ARGV[0]);
