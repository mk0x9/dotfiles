(eval-when-compile
  (require 'cl-lib))

(defvar my-packages
  '(window-numbering leuven-theme flycheck paredit smex twittering-mode haskell-mode json-mode company-ghc php-mode magit js2-mode js2-refactor scss-mode indent-guide)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
	   when (not (package-installed-p p)) do (cl-return nil)
	   finally (return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "package.el is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))
