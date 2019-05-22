(setq mac-option-modifier 'meta)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
 (set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default))

(set-face-background 'vertical-border "gray")
(set-face-foreground 'vertical-border (face-background 'vertical-border))
(fringe-mode 12)


;(setq mk9/theme 'mac-classic)
;(setq mk9/theme 'sanityinc-tomorrow-day)
(setq mk9/theme 'mac-classic)
(setq mk9/font "Inconsolata-16")
(setq mk9/font "Inconsolata-18")

;; (setenv "PATH"
;; 	(concat "/Users/mikhailkuryshev/.local/bin:/Users/mikhailkuryshev/.nvm/versions/node/v10.15.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:" (getenv "PATH")))


;; (setq exec-path (nconc
;; 		 (split-string (getenv "PATH") ":")
;; 		 (cons (replace-regexp-in-string "/$" "" exec-directory) ())))
