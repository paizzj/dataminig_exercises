use v6;

my @age;
for "age.txt".IO.lines  -> $line {
    @age.append:  split(',', $line);
}

my $count =  @age.elems;
my $sum   = [+] @age;

say "age 's count is "　~ $count;
say "a) mean is :" ~ $sum / $count;

my $median;
if  $count.lsb {
    # even number of elements
    $median = (@age[$count/2] + @age[$count/2 + 1]) / 2;
} else  {
    # odd number of elements
    $median = @age[($count +1) / 2];
}
say "a) median is: " ~ $median;

# 
# NOTE: need deal with bimodal & trimodal data sets
#
my @mode;
my %freq_hash;
my $freq_max = 0;
for @age.unique -> $i {
    my $t = (@age .grep: $i).elems;
    %freq_hash.push($i => $t);
    if ($t >= $freq_max) {
	$freq_max = $t;
    }
}
for %freq_hash.kv -> $k, $v {
    #say $k ~ "," ~ $v;
    if ($v == $freq_max) {
	@mode.push($k);
    }
}
say "b) mode is: " ~ @mode;


my $midrange = (@age[0] + @age[$count-1]) / 2;
say "c) midrange is: " ~ $midrange;


# TODO
say "d) Q1: , Q3: ";
say "e) five-number summary: ";
