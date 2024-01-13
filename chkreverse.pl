print "Enter The DNA sequence:";
$dna=<>;
chomp($dna);
$revcom=reverse($dna);
$revcom=~tr/ACGT acgt/TGCA tgca/;
print"This is reverse compliment of given dna seq:$revcom";
exit;