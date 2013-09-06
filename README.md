PHPDaemon overlay
=================

An overlay to install [PHPDaemon](http://github.com/kakserpom/phpdaemon) in right way in Gentoo Linux.

Add it to Layman
----------------

To add this overlay you need to add this url to your overlays section of layman.cfg:

    https://github.com/lexa-uw/layman-phpdaemon/blob/master/layman.xml

It will look something like this:

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                https://github.com/lexa-uw/layman-phpdaemon/blob/master/layman.xml

Then you need to fetch layman overlays list with

    sudo layman -L

And then you can add overlay:

    sudo layman -a phpdaemon
