(tool-bar-mode -1)

(defun mk9/gtk-dark-variant (frame)
  "Enable dark gtk+ theme for current frame"
  (call-process "xprop" nil t nil
		"-f" "_GTK_THEME_VARIANT" "8u"
		"-set" "_GTK_THEME_VARIANT" "dark"
		"-name"
		(frame-parameter (or frame (selected-frame)) 'name)))

(defun mk9/new-frame-hook (frame)
  (if (and (eq system-type 'gnu/linux)
	   (eq window-system 'x)
	   (not (boundp 'mk9/light-theme)))
      (mk9/gtk-dark-variant frame))
  (mk9/set-font))

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
  (load-theme (if (boundp 'mk9/theme) mk9/theme 'mac-classic) t))
(mk9/set-theme)

(add-hook 'after-make-frame-functions 'mk9/new-frame-hook)
(mk9/new-frame-hook nil)

(defun mk9/emacsclient-hook ()
  (let ((win-id (frame-parameter (selected-frame) 'outer-window-id)))
    (call-process "wmctrl" nil nil nil "-i" "-r" win-id "-e" "0,100,100,-1,-1")
    (call-process "wmctrl" nil nil nil "-i" "-R" win-id)
    (mk9/gtk-dark-variant (selected-frame))))

(add-hook 'server-switch-hook 'mk9/emacsclient-hook)

(global-set-key [f10] 'menu-bar-mode)
