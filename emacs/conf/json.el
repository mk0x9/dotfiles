(add-to-list 'auto-mode-alist '("\\.json" . json-mode))

(defun mk9/json-hook ()
  (setq indent-tabs-mode nil)
  (setq js-indent-level 2)
  (setq json-reformat:indent-width 2)
  (prettier-js-mode))

(add-hook 'json-mode-hook 'mk9/json-hook)
