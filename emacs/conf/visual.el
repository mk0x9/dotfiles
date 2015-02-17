(tool-bar-mode -1)

(when window-system
  (set-default-font "Ubuntu Mono-13")
  (dolist (range '((#x3000 . #x303f) (#x3040 . #x309f) (#x30a0 . #x30ff)
		   (#xff00 . #xffef) (#x4e00 . #x9faf) (#x3400 . #x4dbf)))
    (set-fontset-font "fontset-default" range "Meiryo-12"))
  (load-theme 'gruber-darker t))

(global-set-key [f10] 'menu-bar-mode)
