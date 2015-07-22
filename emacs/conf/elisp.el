(defun mk9/conditionally-enable-paredit-mode ()
  "Enable paredit-mode during eval-expression"
  (if (eq this-command 'eval-expression)
      (paredit-mode 1)))

(defun mk9/emacs-lisp-expand-clever ()
  "Cleverly expand symbols with normal dabbrev-expand, but also
if the symbol is -foo, then expand to module-name-foo."
  (interactive)
  (if (save-excursion
        (backward-sexp)
        (when (looking-at "#?'") (search-forward "'"))
        (looking-at "-"))
      (if (eq last-command this-command)
          (call-interactively 'dabbrev-expand)
        (let ((module-name (mk9/emacs-lisp-module-name)))
          (progn
            (save-excursion
              (backward-sexp)
              (when (looking-at "#?'") (search-forward "'"))
              (unless (string= (buffer-substring-no-properties
                                (point)
                                (min (point-max) (+ (point) (length module-name))))
                               module-name)
                (insert module-name)))
            (call-interactively 'dabbrev-expand))))
    (call-interactively 'dabbrev-expand)))

(defun mk9/emacs-lisp-module-name ()
  "Search the buffer for `provide' declaration."
  (save-excursion
    (goto-char (point-min))
    (when (search-forward-regexp "^(provide '" nil t 1)
      (symbol-name (symbol-at-point)))))

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'minibuffer-setup-hook 'mk9/conditionally-enable-paredit-mode)
(define-key emacs-lisp-mode-map (kbd "M-/") 'mk9/emacs-lisp-expand-clever)
