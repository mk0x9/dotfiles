(add-to-list 'auto-mode-alist '("\\.tpl" . html-mode))
(add-to-list 'auto-mode-alist '("\\.dust" . html-mode))

(defun mk9/html-hook ()
  (auto-fill-mode -1)
  (setq indent-tabs-mode nil))

(add-hook 'html-mode-hook 'mk9/html-hook)
