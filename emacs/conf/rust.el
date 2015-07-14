(setq racer-rust-src-path "/home/mk9/code/rust/src")
(setq racer-cmd "/home/mk9/code/racer/target/release/racer")
(add-to-list 'load-path "/home/mk9/code/racer/editors/emacs")

(add-hook 'rust-init-hook 'company-mode)

(defun mk9/rust-hook ()
  (message "mk9/rust-hook")
  (require 'racer)
  (define-key rust-mode-map (kbd "C-c C-l") 'compile))

(defun lcl:rust-compile-hook ()
  (require 'compile)
  (set (make-local-variable 'compile-command)
       (if (locate-dominating-file (buffer-file-name) "Cargo.toml")
           "cargo run"
         (format "rustc %s && %s" (buffer-file-name)
                 (file-name-sans-extension (buffer-file-name))))))

(setq-default compilation-read-command nil)
(add-hook 'rust-mode-hook 'lcl:rust-compile-hook)
(add-hook 'rust-mode-hook 'mk9/rust-hook)
