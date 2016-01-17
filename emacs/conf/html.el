(add-to-list 'auto-mode-alist '("\\.tpl" . web-mode))
(add-to-list 'auto-mode-alist '("\\.dust" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig" . web-mode))

(setq web-mode-engines-alist
      '(("django" . "\\.html\\'")))

;; (setq web-mode-content-types-alist
;;       '(("django" . "/Users/mk9/code/avito/*.html"))) ; for twig

(defun mk9/web-mode-hook ()
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-comment-style 2) ; server comment instead of html
  (setq web-mode-enable-css-colorization t)
  (setq indent-tabs-mode nil)
  (emmet-mode))

(add-hook 'web-mode-hook 'mk9/web-mode-hook)

;; (defun mk9/html-hook ()
;;   (auto-fill-mode -1)
;;   (setq indent-tabs-mode nil))

;; (add-hook 'html-mode-hook 'mk9/html-hook)
