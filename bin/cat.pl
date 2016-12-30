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
        if ($needle eq $hay) { return 1; }
    }
    return 0;
}

sub printLines {
    my $padding     = shift;
    my $filename    = shift;
    if (open my $input, '<', $filename) {
        while(<$input>) {
            s/\r?\n?$//;
            print $padding.$_."\n";
        }
    } else {
        print STDERR $padding."Error openning file: [".$filename."].\n";
        print        $padding."Error openning file: [".$filename."].\n";
    }
}

sub unfold {
    my $padding     = shift;
    my $filename    = shift;
    if (! -e $filename) {
        print STDERR $padding."Error openning file: [".$filename."].\n";
        print        $padding."Error openning file: [".$filename."].\n";
        return;
    }
    my $fullname    = abs_path($filename);
    if (&inList($fullname, @_) == 1) {
        &printLines($padding, $filename);
    } else {
        unshift(@_, $fullname);
        open my $input, '<', $filename or return;
        my $idx = 0;
        while(<$input>) {
            s/\r?\n?$//;
            if (/^(?<p>\s*)\@include <-=(?<f>.*)=$/) {
                my $p = $+{p}; my $f = $+{f};
                if ($f =~ /^.:/ or $f =~ /^\//) {
                    &unfold($padding.$p, $f, @_);
                } else {
                    &unfold($padding.$p, dirname($filename)."/".$f, @_);
                }
            } elsif (/^(?<p>\s*)\%include <-=(?<f>.*)=$/) {
                my $p = $+{p}; my $f = $+{f};
                if ($f =~ /^.:/ or $f =~ /^\//) {
                    &printLines($padding.$p, $f);
                } else {
                    &printLines($padding.$p, dirname($filename)."/".$f);
                }
            } elsif (/^(?<p>\s*)\%\%include <-=(?<f>.*)=$/) {
                print $padding.$+{p}.'%include <-='.$+{f}."=\n";
            } elsif (/^(?<p>\s*)\@\@include <-=(?<f>.*)=$/) {
                print $padding.$+{p}.'@include <-='.$+{f}."=\n";
            } else {
                print $padding.$_."\n";
            }
        }
    }
}

&unfold("", $ARGV[0]);
