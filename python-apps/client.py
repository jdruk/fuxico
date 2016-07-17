#!/usr/bin/env python
import gtk
import webkit

view = webkit.WebView()
win = gtk.Window(gtk.WINDOW_TOPLEVEL)

win.connect("destroy", gtk.main_quit)
#win.set_keep_above(True)
#win.fullscreen()

settings = view.get_settings()
settings.set_property('enable-default-context-menu', False)
settings.set_property("enable-scripts", True)
settings.set_property("javascript-can-open-windows-automatically", True)

scroller = gtk.ScrolledWindow()
win.add(scroller)
scroller.add(view)

win.add(view)
win.show_all()
view.open("http://localhost:3000")

gtk.main()
