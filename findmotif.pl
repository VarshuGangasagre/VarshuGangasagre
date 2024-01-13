@protein ="CTGATGCCTGATGGCGTACTATGAGTGACGATAGCGATAGACAGTAGAC";
$protein = join( ' ', @protein);
$protein =~ s/\s//g;
do{
print "Enter the motif (sequence) to search for = ";
$motif =<>;
chomp ($motif);
if( $protein =~ /$motif/ )
{
print "Found It !\n\n";
exit;
}
else{
print "Not found !\n\n";
exit;
 }
 }
until( $motif =~ /^\s*$/ );