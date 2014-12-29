(defun set-auto-saves ()
  "Put autosave files (ie #foo#) in one place, *not*
 scattered all over the file system!"
  (defvar autosave-dir
    (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

  (make-directory autosave-dir t)

  (defun auto-save-file-name-p (filename)
    (string-match "^#.*#$" (file-name-nondirectory filename)))

  (defun make-auto-save-file-name ()
    (concat autosave-dir
	    (if buffer-file-name
		(concat "#" (file-name-nondirectory buffer-file-name) "#")
	      (expand-file-name
	       (concat "#%" (buffer-name) "#"))))))

(defun find-altername-file-with-sudo ()
  "Re-open with sudo."
  (interactive)
  (let ((point (point)))
    (find-alternate-file (concat "/sudo::" (buffer-file-name)))
    (goto-char point)))

(defun conditionally-enable-paredit-mode ()
  "enable paredit-mode during eval-expression"
  (if (eq this-command 'eval-expression)
      (paredit-mode 1)))

(defun compile-configuration ()
  (interactive)
  (byte-compile-file "~/.emacs.d/functions.el" t)
  (byte-compile-file "~/.emacs.d/packages.el"))
