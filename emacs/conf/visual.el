(tool-bar-mode -1)

(when window-system
  (set-default-font
   (if (boundp 'mk9/font)
       mk9/font
     "Ubuntu Mono-13:weight=bold"))
  (dolist (range '((#x3000 . #x303f) (#x3040 . #x309f) (#x30a0 . #x30ff)
		   (#xff00 . #xffef) (#x4e00 . #x9faf) (#x3400 . #x4dbf)))
    (set-fontset-font "fontset-default"
		      range
		      (if (boundp 'mk9/font-jp)
			  mk9/font-jp
			"Meiryo-12")))
  (load-theme
   (if (boundp 'mk9/theme) mk9/theme 'mac-classic)
   t))

(global-set-key [f10] 'menu-bar-mode)
