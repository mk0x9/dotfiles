(add-hook 'tuareg-mode-hook
	  (lambda ()
	    (setq show-trailing-whitespace t)
	    (setq tuareg-prettify-symbols-full t)
	    ;; (when (functionp 'prettify-symbols-mode)
	    ;;   (prettify-symbols-mode))
					; (electric-indent-mode 0)
	    ;; (when (functionp 'flyspell-prog-mode)
	    ;;   (flyspell-prog-mode))))
	    ; (when (functionp 'prettify-symbols-mode)
	    ;   (prettify-symbols-mode))
	    ; (electric-indent-mode 0)
	    ; (when (functionp 'flyspell-prog-mode)
	    ;   (flyspell-prog-mode))
	    ))

;(define-key tuareg-mode-map [(f12)] 'next-error)
;(define-key tuareg-mode-map [(shift f12)] 'previous-error)

;; Use Merlin if available
(when (require 'merlin nil t)
  (setq merlin-command 'opam)
  (add-to-list 'auto-mode-alist '("/\\.merlin\\'" . conf-mode))

  (when (functionp 'merlin-document)
    (define-key tuareg-mode-map (kbd "\C-c\C-h") 'merlin-document))

  ;; Run Merlin if a .merlin file in the parent dirs is detected
  (add-hook 'tuareg-mode-hook
            (lambda()
              (let ((fn (buffer-file-name)))
                (if (and fn (locate-dominating-file fn ".merlin"))
                    (merlin-mode))))))
