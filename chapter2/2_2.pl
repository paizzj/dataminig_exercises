use v6;

my @age = 13, 15, 16, 16, 19 , 20, 20, 21, 22, 22, 25, 25, 25, 30, 33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70;

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
my $freq = 0;
for @age.unique -> $i {
    my $t = (@age .grep: $i).elems;
    %freq_hash.push($i => $t);
    if ($t >= $freq) {
	$freq = $t;
    }
}
for %freq_hash.kv -> $k, $v {
    #say $k ~ "," ~ $v;
    if ($v == $freq) {
	@mode.push($k);
    }
}
say "b) mode is: " ~ @mode;


my $midrange = (@age[0] + @age[$count-1]) / 2;
say "c) midrange is: " ~ $midrange;


# TODO
say "d) Q1: , Q3: ";
say "e) five-number summary: ";
