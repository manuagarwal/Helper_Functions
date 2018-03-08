Perl function to convert a given timestamp(nanoseconds from mid-night) to human readable time and minute bucket (from mid-night).

sub convert_ts_to_tm{
	
	my $ts = shift;
	my $sec = int($ts/1000000000);
	my $ns = ($ts%1000000000);
	
	my $s1 = floor($sec/3600);
	my $s2 = floor(($sec%3600)/60);
	my $s3 = $sec%60;
	
	my $h = ($s1 < 10)? "0".$s1 : $s1;
	my $m = ($s2 < 10) ? "0".$s2 : $s2; 
	my $s = ($s3 < 10) ? "0".$s3 : $s3;
	
	my $bkt = int(($sec)/60 + 1);
	
	my $tm =  $h.":".$m.":".$s.".$ns";
	
	my %ret;
	$ret{bkt} = $bkt;
	$ret{tm} = $tm; 
	
	return \%ret;
	
}