#8 9.947 Installing /usr/local/share/xmltv/tv_grab_it_dvb/sky_it.themes
#8 9.947 Installing /usr/local/share/xmltv/tv_grab_it_dvb/sky_it.dict
#8 9.947 Installing /usr/local/share/xmltv/tv_grab_eu_epgdata/channel_ids
#8 9.947 Installing /usr/local/share/xmltv/tv_grab_huro/catmap.sk
#8 9.947 Installing /usr/local/share/xmltv/tv_grab_huro/catmap.ro
#8 9.947 Installing /usr/local/share/xmltv/tv_grab_huro/catmap.cz
#8 9.947 Installing /usr/local/share/xmltv/tv_grab_huro/catmap.hu
#8 9.947 Installing /usr/local/share/xmltv/tv_grab_huro/jobmap
#8 9.947 Installing /usr/local/share/xmltv/tv_grab_it/channel_ids
#8 9.947 Installing /usr/local/share/xmltv/tv_grab_uk_tvguide/tv_grab_uk_tvguide.map.conf
#8 DONE 11.4s

#9 [5/8] RUN tv_grab_zz_sdjson --version || (echo "ERROR: tv_grab_zz_sdjson not found!" && exit 1)
#9 1.207 Can't locate XML/LibXML.pm in @INC (you may need to install the XML::LibXML module) (@INC entries checked: /usr/local/lib/perl5/site_perl /usr/local/share/perl5/site_perl /usr/local/lib/perl5/site_perl /usr/local/share/perl5/site_perl /usr/lib/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib/perl5/core_perl /usr/share/perl5/core_perl) at /usr/local/share/perl5/site_perl/XMLTV/Configure.pm line 22.
#9 1.207 BEGIN failed--compilation aborted at /usr/local/share/perl5/site_perl/XMLTV/Configure.pm line 22.
#9 1.207 Compilation failed in require at /usr/local/share/perl5/site_perl/XMLTV/Options.pm line 37.
#9 1.207 BEGIN failed--compilation aborted at /usr/local/share/perl5/site_perl/XMLTV/Options.pm line 37.
#9 1.207 Compilation failed in require at /usr/local/bin/tv_grab_zz_sdjson line 51.
#9 1.207 BEGIN failed--compilation aborted at /usr/local/bin/tv_grab_zz_sdjson line 51.
#9 1.211 ERROR: tv_grab_zz_sdjson not found!
#9 ERROR: process "/bin/ash -o pipefail -c tv_grab_zz_sdjson --version || (echo \"ERROR: tv_grab_zz_sdjson not found!\" && exit 1)" did not complete successfully: exit code: 1
------
 > [5/8] RUN tv_grab_zz_sdjson --version || (echo "ERROR: tv_grab_zz_sdjson not found!" && exit 1):
1.207 Can't locate XML/LibXML.pm in @INC (you may need to install the XML::LibXML module) (@INC entries checked: /usr/local/lib/perl5/site_perl /usr/local/share/perl5/site_perl /usr/local/lib/perl5/site_perl /usr/local/share/perl5/site_perl /usr/lib/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib/perl5/core_perl /usr/share/perl5/core_perl) at /usr/local/share/perl5/site_perl/XMLTV/Configure.pm line 22.
1.207 BEGIN failed--compilation aborted at /usr/local/share/perl5/site_perl/XMLTV/Configure.pm line 22.
1.207 Compilation failed in require at /usr/local/share/perl5/site_perl/XMLTV/Options.pm line 37.
1.207 BEGIN failed--compilation aborted at /usr/local/share/perl5/site_perl/XMLTV/Options.pm line 37.
1.207 Compilation failed in require at /usr/local/bin/tv_grab_zz_sdjson line 51.
1.207 BEGIN failed--compilation aborted at /usr/local/bin/tv_grab_zz_sdjson line 51.
1.211 ERROR: tv_grab_zz_sdjson not found!
------

 1 warning found (use docker --debug to expand):
 - InvalidDefaultArgInFrom: Default value for ARG $BUILD_FROM results in empty or invalid base image name (line 2)
Dockerfile:45
--------------------
  43 |
  44 |     # Verify tv_grab_zz_sdjson is installed and works
  45 | >>> RUN tv_grab_zz_sdjson --version || (echo "ERROR: tv_grab_zz_sdjson not found!" && exit 1)
  46 |
  47 |     # Create data directory
--------------------
ERROR: failed to build: failed to solve: process "/bin/ash -o pipefail -c tv_grab_zz_sdjson --version || (echo \"ERROR: tv_grab_zz_sdjson not found!\" && exit 1)" did not complete successfully: exit code: 1

2025-12-07 13:47:51.809 INFO (MainThread) [supervisor.api.middleware.security] /supervisor/logs access from core_ssh
[core-ssh /]$
