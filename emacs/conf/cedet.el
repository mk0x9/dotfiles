(load (mk9/concat-extensions-directory "cedet/cedet-devel-load.el"))
(load (mk9/concat-extensions-directory "cedet/contrib/cedet-contrib-load.el"))

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)

(semantic-mode 1)

(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)
;(require 'cedet-files)
;(require 'eassist)

(defun mk9/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))

(add-hook 'c-mode-common-hook 'mk9/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'mk9/cedet-hook)

(defun mk9/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref))

(add-hook 'c-mode-common-hook 'mk9/c-mode-cedet-hook)

(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode t)
  (semanticdb-enable-gnu-global-databases 'c++-mode t))

(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-ectags-support))

;(global-srecode-minor-mode 1)

(global-ede-mode 1)
(ede-enable-generic-projects)

(add-to-list 'auto-mode-alist '("/usr/include" . c++-mode))
;; (ede-cpp-root-project "qt-cedet"
;; 		      :file "~/code/qt-cedet/main.cc"
;; 		      :spp-files '("/usr/include/Qt/qconfig.h"
;; 				   "/usr/include/Qt/qconfig-dist.h"
;; 				   "/usr/include/Qt/qglobal.h"))
