#A program with subroutine to append ACGT
# The original DNA
$dna ='ATGACGATAGACAGTAGACAGATAGTCGTACTGAGCTGCTAT';
# The call to the Subroutine "addACGTccTTggAA"
# The argument being passed in is $dna
$longer_dna =addACGTaagt($dna);
print "I added ACGT to $dna and got $longer_dna\n\n";
exit;

#Here is the defination for subroutine "addACGTaagt"
sub addACGTaagt{
my ($dna)= @_;
$dna .='ACGT';
return $dna;
}