;; init package.el
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; package list
(load "~/.emacs.d/packages")
;; functions
(load "~/.emacs.d/functions")

;; visuals
(add-hook 'after-init-hook
	  (lambda ()
	    (load-theme 'solarized-light t)))
(set-default-font "Ubuntu Mono-14" nil t)

;; set font for japanese characters
(dolist (range '((#x3000 . #x303f) (#x3040 . #x309f) (#x30a0 . #x30ff)
		 (#xff00 . #xffef) (#x4e00 . #x9faf) (#x3400 . #x4dbf)))
  (set-fontset-font "fontset-default" range "Meiryo-12"))

;; hooks
(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

;; hotkeys
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c M-x") 'execute-extended-command)
(global-set-key [f7] 'global-whitespace-mode)

;; other stuff
(if (not (eq system-type 'windows-nt))
    (progn
      (set-auto-saves)
      (display-battery-mode 1)))
(add-hook 'after-init-hook
	  (lambda ()
	    (window-numbering-mode 1)
	    (setq flycheck-jshintrc "~/.emacs.d/jshintrc")
	    (setq flycheck-display-errors-delay 0.5)))
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; two line at a time
(setq mouse-progressive-speed nil) ;; no acceleration
(setq scroll-step 1) ;; keyboard scroll one line at a time
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(ido-mode t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-message t)
(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode 1)
(setq default-major-mode 'text-mode)
(setq-default cursor-type 'bar)
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8-unix)

;; web
(add-hook 'js-mode-hook
	  (lambda ()
	    (setq js-indent-level 2)
	    (setq indent-tabs-mode nil)))
(add-hook 'js-mode-hook 'flycheck-mode)
(add-to-list 'auto-mode-alist '("\\.jst.dust" . html-mode))
(add-to-list 'auto-mode-alist '("jshintrc" . json-mode))
(add-hook 'json-mode-hook 'flycheck-mode)

;; twitter
(with-eval-after-load 'twittering-mode
  (setq twittering-use-master-password t))

;; haskell
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'haskell-mode-hook
	  (lambda ()
	    (ghc-init)))
(with-eval-after-load 'haskell-mode
  (custom-set-variables
   '(haskell-process-suggest-remove-import-lines t)
   '(haskell-process-auto-import-loaded-modules t)
   '(haskell-process-log t)
   '(haskell-process-type 'cabal-repl)
   ))

(add-hook 'haskell-mode-hook
	  (lambda ()
	    (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
	    (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
	    (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
	    (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
	    (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
	    (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
	    (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
	    (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
	    (define-key haskell-mode-map (kbd "M-SPC") 'company-complete)
	    (company-mode)))
(add-hook 'company-mode-hook
	  (lambda ()
	    (add-to-list 'company-backends 'company-ghc)))

(add-hook 'makefile-mode-hook 'flycheck-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(haskell-ask-also-kill-buffers nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
