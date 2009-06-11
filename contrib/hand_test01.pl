#!/usr/bin/perl

BEGIN {
    use IPC::System::Simple qw(systemx);
    systemx($^X, "Makefile.PL") if not -f "Makefile" or ((stat "Makefile")[9] > (stat "Makefile.PL")[9]);
    systemx("make");
}

use strict;
use warnings;
use lib 'contrib', "blib/lib", "blib/arch";
use slurp_fetchmail;

my $imap = slurp_fetchmail->login(use_ssl=>1, debug=>1);

my $c1 = $imap->select("jet");
my $c2 = $imap->select("aga");
my $c3 = $imap->select("fakemailbox");

die "c1=$c1; c2=$c2; c3=$c3\n";