#!/usr/bin/env python
import gtk
import webkit
import os

view = webkit.WebView()
win = gtk.Window(gtk.WINDOW_TOPLEVEL)

win.connect("destroy", gtk.main_quit)
#win.set_keep_above(True)
win.fullscreen()

view.uri = 'file://' + os.path.dirname(__file__)

settings = view.get_settings()
settings.set_property('enable-default-context-menu', True)
settings.set_property("enable-scripts", True)
settings.set_property("javascript-can-open-windows-automatically", True)
settings.set_property("enable-file-access-from-file-uris", True)
settings.set_property("enable-dom-paste", True)
settings.set_property('enable-universal-access-from-file-uris', True)



scroller = gtk.ScrolledWindow()
win.add(scroller)
scroller.add(view)

win.add(view)
win.show_all()
view.open("http://192.168.1.14:3000")

gtk.main()