
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Encode" => 0,
    "Module::Build" => "0.3601",
    "Test::More" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Perl client for Redis 2.4 and up",
  "dist_author" => [
    "Mike Friedman <friedo\@friedo.com>"
  ],
  "dist_name" => "Redis-Client",
  "dist_version" => "0.010",
  "license" => "perl",
  "module_name" => "Redis::Client",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
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
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
