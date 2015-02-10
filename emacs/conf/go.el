(require 'go-autocomplete)

(defun mk9/go-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (flycheck-mode 1))

(add-hook 'go-mode-hook 'mk9/go-hook)
