(tool-bar-mode -1)

(defun mk9/gtk-dark-variant (frame)
  "Enable dark gtk+ theme for current frame"
  (call-process "xprop" nil t nil
   		"-f" "_GTK_THEME_VARIANT" "8u"
   		"-set" "_GTK_THEME_VARIANT" "dark"
   		"-name" (if (framep frame)
			    (frame-parameter frame 'name)
			  (cdr (assoc 'name (frame-parameters))))))

(defun mk9/new-frame-hook (frame)
  (if (and (eq system-type 'gnu/linux)
	   (eq window-system 'x)
	   (not (boundp 'mk9/light-theme)))
      (mk9/gtk-dark-variant frame))
  (mk9/set-font)
  (mk9/set-theme))

(defun mk9/set-font ()
  (set-default-font
   (if (boundp 'mk9/font)
       mk9/font
     "Ubuntu Mono-13:weight=bold") nil t)
  (dolist (range '((#x3000 . #x303f) (#x3040 . #x309f) (#x30a0 . #x30ff)
		   (#xff00 . #xffef) (#x4e00 . #x9faf) (#x3400 . #x4dbf)))
    (set-fontset-font "fontset-default"
		      range
		      (if (boundp 'mk9/font-jp)
			  mk9/font-jp
			"Meiryo-12"))))

(defun mk9/set-theme ()
  (load-theme (if (boundp 'mk9/theme) mk9/theme 'mac-classic) t t))

(add-hook 'after-make-frame-functions 'mk9/new-frame-hook)
(mk9/new-frame-hook nil)

(global-set-key [f10] 'menu-bar-mode)
