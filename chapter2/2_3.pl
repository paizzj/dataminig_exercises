use v6;


my @age_freq;
for "data/age_freq.txt".IO.lines -> $line {
    say $line;
    # deal with white space lines
    if (chomp($line)) {
	@age_freq.append: split(':', $line, :skip_empty);
    }
}


my @sum_freq;
my $median_freq;
for @age_freq.pairup -> $p {
    @sum_freq.push($p.values.first);
}
say @sum_freq;

my $total_freq =  [+] @sum_freq;

if ($total_freq.lsb) {
    # even number
    $median_freq = $total_freq/2;    
} else {
    #  odd number
    $median_freq = ($total_freq+1)/2;    
}


my $cnt = 0;
my $t  = 0;
for @sum_freq -> $f {
    $cnt++;
    $t += $f;
    last if ($t >= $median_freq) ;
}

#compute  L1
my $L1 = @age_freq.pairup[$cnt-1].keys.first.split('-')[0];
my $Lm = @age_freq.pairup[$cnt-1].keys.first.split('-')[1];
# compute (Σfreq)ₗ
my $s = $t - @sum_freq[$cnt-1];
#say $s;

# compute freq_median
my $freq_median = @age_freq.pairup[$cnt-1].values.first;
#say $freq_median;

# compute width
my $width = $Lm - $L1;
#say $width;



# finalily compute the median;

say "median: " ~ $L1 + (($total_freq/2  - $s) / $freq_median)*$width;
