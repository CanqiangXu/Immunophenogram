# 提取IPS基因，计算出基因涉及的TPM

$Sample{'SRR3184279'}='Pt1';
$Sample{'SRR3184280'}='Pt2';
$Sample{'SRR3184281'}='Pt4';
$Sample{'SRR3184282'}='Pt5';
$Sample{'SRR3184283'}='Pt6';
$Sample{'SRR3184284'}='Pt7';
$Sample{'SRR3184285'}='Pt8';
$Sample{'SRR3184286'}='Pt9';
$Sample{'SRR3184287'}='Pt10';
$Sample{'SRR3184288'}='Pt12';
$Sample{'SRR3184289'}='Pt13';
$Sample{'SRR3184290'}='Pt14';
$Sample{'SRR3184291'}='Pt15';
$Sample{'SRR3184292'}='Pt16';
$Sample{'SRR3184293'}='Pt19';
$Sample{'SRR3184294'}='Pt20';
$Sample{'SRR3184295'}='Pt22';
$Sample{'SRR3184296'}='Pt23';
$Sample{'SRR3184297'}='Pt25';
$Sample{'SRR3184298'}='Pt27A';
$Sample{'SRR3184299'}='Pt27B';
$Sample{'SRR3184300'}='Pt28';
$Sample{'SRR3184301'}='Pt29';
$Sample{'SRR3184302'}='Pt31';
$Sample{'SRR3184303'}='Pt32';
$Sample{'SRR3184304'}='Pt35';
$Sample{'SRR3184305'}='Pt37';
$Sample{'SRR3184306'}='Pt38';

#open I,"IPS_genes.txt" or die();
#while(<I>){
#	chomp;
#	$_=(split/\t/)[0];
#	$Mark{'#'}{$_}=$_;
#}
#close I;

foreach $x(glob "*.genes.results"){
	$x=~m/(SRR\d+)/;
	$S=$1;
	open I,"<$x";
    <I>;
	while(<I>){
		chomp;
		@a=split/\t/;
		$a[0]=(split/\_/,$a[0])[-1];
        #unless($Mark{'#'}{$a[0]}){next;}
        $IPS{'#'}{$S}=$Sample{$S};
            $IPS{$a[0]}{$S}=$a[-2];
	}
	close I;
}


#foreach(sort keys %IPS){
#    if($_ eq '#'){next;}
#    print "\t$Sample{$_}";
#}
#print "\n";
#open I,"IPS_genes.txt";
#<I>;
#while(<I>){
#        chomp;
#    $_=(split/\t/)[0];
#    unless($IPS{'#'}{$_}){next;}
#    foreach $x(sort keys %IPS){
#        if($x eq '#'){print $_;next;}
#         print "\t$IPS{$x}{$_}";
#    }
#    print "\n";
#}
#close I;

foreach (sort keys %IPS){
    unless($_ eq '#'){print $_;}
    foreach $x(sort keys %Sample){
        print "\t$IPS{$_}{$x}";
    }
    print "\n";
}

