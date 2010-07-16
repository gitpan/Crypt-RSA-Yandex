#!/usr/bin/env perl

use 5.010;
use MIME::Base64;
use Crypt::RSA::Yandex 'ya_encrypt';

use Crypt::RSA::Yandex;

my $crypter = Crypt::RSA::Yandex->new;
$crypter->import_public_key($pubkey);

my $encrypted = $crypter->encrypt($text);
    
use Crypt::RSA::Yandex 'ya_encrypt';
my $encrypted = ya_encrypt($pubkey,$text);

__END__

#my $pub_key = 'BFC949E4C7ADCC6F179226D574869CBF44D6220DA37C054C64CE48D4BAA36B039D8206E45E4576BFDB1D3B40D958FF0894F6541717824FDEBCEDD27C4BE1F057#10001';
for my $pub_key (
	'BFC949E4C7ADCC6F179226D574869CBF44D6220DA37C054C64CE48D4BAA36B039D8206E45E4576BFDB1D3B40D958FF0894F6541717824FDEBCEDD27C4BE1F057',
	'BFC949E4C7ADCC6F179226D574869CBF44D6220DA37C054C64CE48D4BAA36B039D8206E45E4576BFDB1D3B40D958FF0894F6541717824FDEBCEDD27C4BE1F057#',
	'12345#12345',
	'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ#ZZZZZZZ',
	'#',
) {
	my $text = '12345';
	my $expect =  MIME::Base64::decode('BQBAAKypbGqp3y2TkI4ZwEbpOmsRjBb/JIgd8Px4UcDewPi/bGGJiiDVSHUKa6kxIRRGqXvgbiPHcpO2R/3KEZ6tHRQ=');
	
	say $pub_key . ' => '.length eval{ yamrsa_encrypt($pub_key,$text) };
	warn if $@;
}
