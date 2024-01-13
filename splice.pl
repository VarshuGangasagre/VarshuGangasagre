@bases=('A','T','G','C','T','G','A');
print "Normal array = @bases\n";
splice(@bases,2,0,'X');
print "After insertion of base= @bases\n";
exit;