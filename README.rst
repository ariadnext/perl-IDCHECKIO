perl-IDCHECKIO                                                                      
================
Perl Library for IDCHECKIO API
================================

.. image:: https://www.idcheck.io/content/uploads/sites/2/2015/12/tick_mark.png

Web application : <https://idcheck.io>

Mashape REST API : <https://market.mashape.com/ariadnext/idcheck-io-api>

Swagger REST API : <https://api.idcheck.io/swagger/#/>

Requirements
------------

To do.

Installation
------------

Soon...

.. code-block:: bash

    $ cpan install idcheckio

**Account**

To create your account an credit, contact us by email with your needs at : contact@idcheck.io

Usage
-----
**AnalyseMRZ**

.. code-block:: perl

    use IDCheckIO;
    my $object = new IDCheckIO('example@exemple.com', 'example');
    my $res = $object->analyse_mrz("P<UTOBANDERAS<<LILIAN<<<<<<<<<<<<<<<<<<<<<<<",
                                   "01234567894UTO8001014F2501017<<<<<<<<<<<<<06");

