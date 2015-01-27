(defun mk9/conditionally-enable-paredit-mode ()
  "Enable paredit-mode during eval-expression"
  (if (eq this-command 'eval-expression)
      (paredit-mode 1)))

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'minibuffer-setup-hook 'mk9/conditionally-enable-paredit-mode)
