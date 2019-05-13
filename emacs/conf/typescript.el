(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint)
  (prettier-js-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
  (setq tide-completion-detailed t)
  (define-key tide-mode-map (kbd "C-c r") 'tide-rename-symbol)
  (define-key tide-mode-map (kbd "C-c l") 'tide-references)
  (setenv "TS_NODE_COMPILER_OPTIONS" "{\"module\":\"commonjs\"}")
  ;(define-key tide-mode-map (kbd "<mouse-2>") 'mk9/on-click-tide-jump-to-definition)
  )

;; annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;(require 'web-mode)
;(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;               (setup-tide-mode))))
;; enable typescript-tslint checker
(eval-after-load 'flycheck
  '(flycheck-add-mode 'javascript-eslint 'typescript-mode))
;(require 'flycheck)

					;(flycheck-add-mode 'typescript-tslint 'web-mode)
					;(flycheck-add-mode 'javascript-eslint 'typescript-mode)

(defun mk9/on-click-tide-jump-to-definition (@click)
    "Mouse click to `tide-jump-to-definition'
URL `http://ergoemacs.org/emacs/emacs_mouse_wheel_config.html'"
  (interactive "e")
  (let ((p1 (posn-point (event-start @click))))
    (goto-char p1)
    (tide-jump-to-definition p1)))
