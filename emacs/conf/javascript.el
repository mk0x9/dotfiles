(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json" . json-mode))

(defun mk9/js2-hook ()
  (setq indent-tabs-mode nil)
  (setq js2-basic-offset 2))

(add-hook 'js2-mode-hook 'mk9/js2-hook)
