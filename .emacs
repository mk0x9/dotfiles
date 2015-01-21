(load "~/.emacs.d/cedet/cedet-devel-load")

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
	    (load-theme 'leuven t)))

(let ((font-name "Ubuntu Mono-13"))
  (with-old-panasonic-laptop
   (setq font-name "Consolas-10"))
  (with-work-desktop
   (setq font-name "Consolas-11"))
  (set-default-font font-name nil t))

;; set font for japanese characters 私はマイクです。
(let ((japanese-font-name "Meiryo-12"))
  (with-old-panasonic-laptop
   (setq japanese-font-name "Meiryo-8"))
  (dolist (range '((#x3000 . #x303f) (#x3040 . #x309f) (#x30a0 . #x30ff)
		   (#xff00 . #xffef) (#x4e00 . #x9faf) (#x3400 . #x4dbf)))
    (set-fontset-font "fontset-default" range japanese-font-name)))

;; hooks
(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (indent-guide-mode)))

;; hotkeys
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-M-SPC") 'company-complete)
(global-set-key [f7] 'global-whitespace-mode)

;; other stuff
(with-system 'gnu/linux
	     (set-auto-saves)
	     (display-battery-mode))
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
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
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

;; indent-guide
(indent-guide-mode 1)
(indent-guide-mode -1)
(set-face-attribute 'indent-guide-face nil
		    :foreground "#ccc")

;; web
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-hook 'js2-mode-hook 'flycheck-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (setq js2-basic-offset 2)
	    (indent-guide-mode)))
(add-to-list 'auto-mode-alist '("\\.dust" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tpl" . html-mode))
(add-to-list 'auto-mode-alist '("jshintrc" . json-mode))
(add-hook 'json-mode-hook 'flycheck-mode)
(add-hook 'html-mode-hook 'flycheck-mode)
(add-hook 'html-mode-hook
	  (lambda ()
	    (auto-fill-mode -1)
	    (indent-guide-mode)))
(add-hook 'scss-mode-hook
	  (lambda ()
	    (indent-guide-mode)))

(add-to-list 'auto-mode-alist '("\\.inc" . php-mode))
(add-hook 'php-mode-hook 'flycheck-mode)

;; twitter
(with-eval-after-load 'twittering-mode
  (setq twittering-use-master-password t)
  (setq twittering-convert-fix-size 24)
  (setq twittering-use-icon-storage t)
  (setq twittering-convert-program (executable-find "gm")))

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
   '(haskell-interactive-popup-errors nil)
   '(haskell-ask-also-kill-buffers nil)
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
	    (company-mode)))

(add-hook 'company-mode-hook
	  (lambda ()
	    (add-to-list 'company-backends 'company-ghc)))

(add-hook 'makefile-mode-hook 'flycheck-mode)

;; select which submodes we want to activate
;(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(require 'semantic/ia)
(require 'semantic/bovine/gcc)
(semantic-mode 1)

(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

(global-ede-mode t)

(add-hook 'c-mode-common-hook 'company-mode)

(load "~/.emacs.d/project-definitions")

(custom-set-variables
 '(fringe-mode (quote (6 . 0)) nil (fringe))
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t))
