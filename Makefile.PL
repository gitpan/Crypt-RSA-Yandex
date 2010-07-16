use 5.008000;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME              => 'Crypt::RSA::Yandex',
	VERSION_FROM      => 'lib/Crypt/RSA/Yandex.pm', # finds $VERSION
	PREREQ_PM         => {}, # e.g., Module::Name => 1.1
	ABSTRACT_FROM     => 'lib/Crypt/RSA/Yandex.pm', # retrieve abstract from module
	AUTHOR            => 'Vladimir Timofeev <vovkasm@gmail.com>',
	AUTHOR            => 'Mons Anderson <mons@cpan.org>',
	LIBS              => ['-lstdc++'], # e.g., '-lm'
	#DEFINE            => '-D__DEBUG__', # e.g., '-DHAVE_SOMETHING'
	DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
	INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	OBJECT            => '$(O_FILES)', # link all the C files too
	H                 => ['CP_RSA.h'],
	C                 => ['CP_RSA.cpp','Yandex.c'],
	CC                => 'g++',
	XSOPT             => '-C++',
	TYPEMAPS          => ['perlobject.map'],
);
