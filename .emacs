;; fullscreen yay
; (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
; 		       '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
; (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
; 		       '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))

;; hide that crap
(tool-bar-mode 0)
; (menu-bar-mode)
(scroll-bar-mode 0)
(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 2) ;; keyboard scroll one line at a time

;; auto add all subdirectories in $HOME/.emacs.d/site-lisp
(let ((base "~/.emacs.d/site-lisp"))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

; (require 'nyan-mode)
;; (nyan-mode) ;; too hardcore for me right now
(require 'window-numbering)
(window-numbering-mode 1)
(require 'nav)
(require 'haml-mode)
(require 'sass-mode)
(require 'coffee-mode)
(require 'ido)
(require 'pastebin)
(ido-mode t)
; (require 'rinari)
(require 'tramp)
(require 'rvm)
(require 'color-theme)
(color-theme-initialize)
(color-theme-resolve)
;(load "~/.emacs.d/site-lisp/color-theme-gruber-darker/color-theme-gruber-darker.el")
;(color-theme-gruber-darker)
;(load "~/.emacs.d/site-lisp/color-theme-less/color-theme-less.el")
;(color-theme-less)
(rvm-use-default)
(load "~/.emacs.d/site-lisp/haskell-mode-2.8.0/haskell-site-file.el")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq auto-mode-alist (cons '("\\.js.erb$" . js-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("config.ru" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.handlebars$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.json.rabl$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("faye.ru" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.jst.dust$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.coffee.erb$" . coffee-mode) auto-mode-alist))

;; GOTO binding
(global-set-key "\C-l" 'goto-line)

;; global-whitespace-mode on F7
(global-set-key [f7] 'global-whitespace-mode)

(define-key coffee-mode-map "\C-c\C-l" 'coffee-compile-buffer)
(setq coffee-command "~/.local/bin/coffee")

;; turn off tab-indent for haml-mode
(add-hook 'coffee-mode-hook
	  '(lambda ()
	     (set (make-local-variable 'tab-width) 2)))
(add-hook 'haml-mode-hook
	  '(lambda ()
	     (setq indent-tabs-mode nil)
	     (define-key haml-mode-map "\C-m" 'newline-and-indent)))
(add-hook 'js-mode-hook
	  '(lambda ()
	     (setq indent-tabs-mode nil)))


; (autoload 'ghc-init "ghc" nil t)
; (add-hook 'haskell-mode-hook (lambda () (ghc-init)))


; color-themes sucks
; (if window-system
;     (dotimes (i 3) ;; looks like 1 time isn't enough :<
;       (progn
; 	(set-background-color "#dedfdf")
; 	(set-foreground-color "#141414"))))

(add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/emacs-color-theme-solarized")
(load-theme 'solarized-light t)

(set-default-font "Inconsolata-20")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
