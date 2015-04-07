(require 'go-autocomplete)

(defun mk9/go-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (flycheck-mode 1)
  (setq ac-sources '(ac-source-go))
  (define-key go-mode-map (kbd "C-x f") 'go-test-current-file)
  (define-key go-mode-map (kbd "C-x t") 'go-test-current-test)
  (define-key go-mode-map (kbd "C-x p") 'go-test-current-project)
  (define-key go-mode-map (kbd "C-x x") 'go-run)
  (setq go-test-verbose t)
  (yas-minor-mode))

(add-hook 'go-mode-hook 'mk9/go-hook)
