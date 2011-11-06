;; fullscreen yay
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
		       '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
		       '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))

;; hide that crap
(tool-bar-mode)
(menu-bar-mode)
(scroll-bar-mode)
(setq inhibit-splash-screen t)

;; auto add all subdirectories in $HOME/.emacs.d/site-lisp
(let ((base "~/.emacs.d/site-lisp"))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(require 'nyan-mode)
;; (nyan-mode) ;; too hardcore for me right now
(require 'window-numbering)
(window-numbering-mode 1)
(require 'nav)
(require 'haml-mode)
(require 'sass-mode)
(require 'ido)
(ido-mode t)
(require 'rinari)
(require 'tramp)
(require 'rvm)
(rvm-use-default)
(load "~/.emacs.d/site-lisp/haskell-mode-2.8.0/haskell-site-file.el")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq auto-mode-alist (cons '("\\.js.erb$" . js-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("config.ru" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))

;; global-whitespace-mode on F7
(global-set-key [f7] 'global-whitespace-mode)

;; turn off tab-indent for haml-mode
(add-hook 'haml-mode-hook
	  '(lambda ()
	     (setq indent-tabs-mode nil)
	     (define-key haml-mode-map "\C-m" 'newline-and-indent)))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#dedede" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Ubuntu Mono")))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode t)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t)
 '(menu-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

;; color-themes sucks
(if window-system
    (dotimes (i 3) ;; looks like 1 time isn't enough :<
      (progn
	(set-background-color "#242424")
	(set-foreground-color "#dedede"))))
