(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

(use-package diff-hl
  :ensure t)
(use-package password-store
  :ensure t)
(use-package fzf
  :ensure t)
(use-package golden-ratio
  :ensure t
  :config
  (golden-ratio-mode 1)
  (setq golden-ratio-auto-scale t))


(provide 'general-am)
;;; general-am.el ends here
