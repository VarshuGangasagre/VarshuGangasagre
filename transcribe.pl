#!/usr/bin/perl -w
# Transcribing DNA into RNA

$DNA= 'AATTCCGGTTTCCGGAATTGGCCTTGGAA';
print "Starting DNA:\n\n";
print"$DNA\n\n";
$RNA=$DNA;
$RNA=~s/T/U/g;
print"$RNA\n";
exit;