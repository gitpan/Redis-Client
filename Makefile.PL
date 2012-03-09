
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Perl client for Redis 2.4 and up",
  "AUTHOR" => "Mike Friedman <friedo\@friedo.com>",
  "BUILD_REQUIRES" => {
    "Encode" => 0,
    "Module::Build" => "0.3601",
    "Test::More" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "Redis-Client",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Redis::Client",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Data::Dumper" => 0,
    "IO::Socket::INET" => 0,
    "Moose" => 0,
    "Moose::Role" => 0,
    "Scalar::Util" => 0,
    "aliased" => 0,
    "namespace::sweep" => "0.003",
    "overload" => 0,
    "utf8" => 0
  },
  "VERSION" => "0.013",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



