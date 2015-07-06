Cfgf is a tool for automated system administration, specifically a "build system" for configuration files. It's based on make, m4 and Perl.

It has a modular structure and can be extended with make rules, scripts or configuration file templates by dropping files in specific subdirectories of /etc/cfgf. It can install the generated files and reload the affected daemons.

Cfgf is usable but still in development. My primary focus is Debian GNU/Linux, but the ultimate target is any Unix system with GNU make, GNU m4 and Perl.