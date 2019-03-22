(defun find-alternate-file-with-sudo ()
  "Re-open with sudo."
  (interactive)
  (let ((point (point)))
    (find-alternate-file (concat "/sudo::" (buffer-file-name)))
    (goto-char point)))

(setq inhibit-default-init t)
(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b"))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key (kbd "C-l") 'goto-line)
(global-set-key [f7] 'whitespace-mode)

(if (not (equal system-type 'windows-nt))
    (display-battery-mode))

(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; two line at a time
(setq mouse-progressive-speed nil) ;; no acceleration
(setq scroll-step 1) ;; keyboard scroll one line at a time
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-message t)
(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode 1)
(setq default-major-mode 'text-mode)
(setq-default cursor-type 'bar)
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8-unix)
;(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'editorconfig)
(editorconfig-mode 1)
(require 'feature-mode)
