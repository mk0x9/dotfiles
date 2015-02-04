(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json" . json-mode))

(defun mk9/js2-hook ()
  (setq indent-tabs-mode nil)
  (setq js2-basic-offset 2)
  (tern-mode t))

(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(defun mk9/json-hook ()
  (setq indent-tabs-mode nil)
  (setq js-indent-level 2)
  (setq json-reformat:indent-width 2))

(defmacro mk9/js2-set-additional-externs (regexp list &rest expressions)
  `(let ((fname buffer-file-name))
     (when (string-match-p ,regexp fname)
       (setq js2-additional-externs ,list)
       ,@expressions)))

(defun mk9/js2-rirsrv-hook ()
  (make-local-variable 'mk9/js2-is-test-file)
  (setq mk9/js2-is-test-file nil)
  (mk9/js2-set-additional-externs "^.*/rirsrv/*.\\.js$" '("define" "setTimeout" "clearTimeout"))
  (mk9/js2-set-additional-externs "^.*gulpfile\\.js$" '("require"))
  (mk9/js2-set-additional-externs "^.*-unit\\.js$" '("describe" "it" "sinon" "beforeEach" "afterEach") (setq mk9/js2-is-test-file t)))

(defadvice js2-node-has-side-effects (around js2-node-has-side-effects-around)
  "Disable check for code side effects if 'mk9/js2-is-test-file is set."
  (if mk9/js2-is-test-file
      (setq ad-return-value t)
    ad-do-it))
(ad-activate 'js2-node-has-side-effects)

(add-hook 'js2-init-hook 'mk9/js2-rirsrv-hook)
(add-hook 'js2-mode-hook 'mk9/js2-hook)
(add-hook 'json-mode-hook 'mk9/json-hook)
