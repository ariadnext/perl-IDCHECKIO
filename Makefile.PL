use ExtUtils::MakeMaker;
    WriteMakefile(
        NAME           => 'IdcheckioPerl::Client',
        VERSION        => '1.0.0',
        AUTHOR         => 'ariadnext (dev@ariadnext.com)',
        ABSTRACT       => 'IDCHECK.IO API',
        LICENSE        => 'perl',
        BUILD_REQUIRES => {
          'DateTime'             => '1.41',
          'Log::Any'             => '1.045',
          'LWP::UserAgent'       => '6.15',
          'LWP::Protocol::https' => '6.06',
          'Module::Runtime'      => '0.014',
          'Test::Exception'      => '0.43',
          'URI::Query'           => '0.16',
          'JSON'                 => '2.90',
          'CPAN'                 => '2.11',
          'Date::Parse'          => '2.30',
          'Class::Accessor'      => '0.34'
        },
    );
