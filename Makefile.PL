
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "the async counterpart to Test::HTTP::Server",
  "AUTHOR" => "Stanislaw Pusep <stas\@sysd.org>",
  "BUILD_REQUIRES" => {
    "AnyEvent::HTTP" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "HTTP::Tiny" => 0,
    "Scalar::Util" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Test-HTTP-AnyEvent-Server",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Test::HTTP::AnyEvent::Server",
  "PREREQ_PM" => {
    "Any::Moose" => 0,
    "AnyEvent" => 0,
    "AnyEvent::Handle" => 0,
    "AnyEvent::Log" => 0,
    "AnyEvent::Socket" => 0,
    "AnyEvent::Util" => 0,
    "HTTP::Headers" => 0,
    "HTTP::Request" => 0,
    "HTTP::Response" => 0,
    "POSIX" => 0,
    "feature" => 0,
    "strict" => 0,
    "utf8" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.005",
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



