cmudict
=======

.. image:: http://www.repostatus.org/badges/latest/inactive.svg
   :alt: Project Status: Inactive – The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows.
   :target: http://www.repostatus.org/#inactive

This is an R dataset package which provides a few pronunciation dictionaries as data frames.  It also provides a data frame that maps ARPABET values to IPA and X-SAMPA.

It currently comes with the following pronunciation dictionaries:

.. list-table:: Included Pronuciation dictionaries
   :header-rows: 1

   * - Name
     - Dataset name
     - Version

   * - `Carnegie Mellon Pronuncing Dictionary (CMUdict) <https://github.com/cmusphinx/cmudict>`_
     - enUSxgaCMU
     - 2e7a882 (2018-07-09)

   * - `American English Pronunciation Dictionary (AmEPD) <https://github.com/rhdunn/amepd>`_
     - enUSxgaCainteoir
     - v0.2 (2018-04-01)

   * - `Received Pronunciation Dictionary <https://github.com/rhdunn/en-GB-x-rp.dict>`_
     - enGBxrpCainteoir
     - v0.1 (2018-03-28)

   * - `Scottish English Dictionary <https://github.com/rhdunn/en-scotland.dict>`_
     - enScotlandCainteoir
     - v0.1 (2017-07-04)

In the latter two dictionaries the following non-standard ARPABET was re-mapped to ARPABET:

.. list-table:: Non-standard Arpabet re-mapped to ARPABET
   :header-rows: 1

   * - Non-standard Arpabet
     - Standard Arpabet
     
   * - IA
     - IH AX
   * - EA
     - EH AX
   * - HW
     - WH
   * - I
     - Either IH or IY depending on context
   * - OH 
     - AO
   * - UA
     - UH AX

Examples
========

:: 

    > library("cmudict")
    >     head(enUSxgaCMU) 
         word  alt   pronunciation comment
    1   'bout <NA>         B AW1 T    <NA>
    2  'cause <NA>         K AH0 Z    <NA>
    3 'course <NA>       K AO1 R S    <NA>
    4   'cuse <NA>       K Y UW1 Z    <NA>
    5     'em <NA>           AH0 M    <NA>
    6 'frisco <NA> F R IH1 S K OW0    <NA>
    >     head(enUSxgaCainteoir)
        word  alt pronunciation                       comment
    1      a  det            AX @@{ "usage": "unstressed" }@@
    2      a  det           EY1   @@{ "usage": "stressed" }@@
    3      a noun           EY1                          <NA>
    4    a's <NA>         EY1 Z                          <NA>
    5 aaberg <NA>   AA1 B AXR G                          <NA>
    6 aachen <NA>    AA1 K AX N                          <NA>
    >     head(enGBxrpCainteoir)
           word  alt           pronunciation                       comment
    1         a  det                      AX @@{ "usage": "unstressed" }@@
    2         a  det                     EY1   @@{ "usage": "stressed" }@@
    3         a noun                     EY1                          <NA>
    4 abandoned <NA> AX - B AE1 N - D AX N D                          <NA>
    5     abbey <NA>             AE1 - B IH0                          <NA>
    6    abbeys <NA>           AE1 - B IH0 Z                          <NA>
    >     head(enScotlandCainteoir)
          word alt         pronunciation comment
    1        a  NA                   EY1      NA
    2    above  NA          AX - B AH1 V      NA
    3    adore  NA          AX - D OW1 R      NA
    4    again  NA          AX - G EH1 N      NA
    5 agreeing  NA AX - G R IY1 - IH0 NG      NA
    6       ah  NA                   AE1      NA
    >     head(arpabet)
      arpabet ipa xsampa
    1       -          -
    2      AA   ɑ      A
    3      AE   æ      {
    4      AH   ʌ      V
    5      AO   ɔ      O
    6      AW  aʊ     aU
    > 
    

License
=======

This package is available under the BSD 2-Clause license.
