(use-package paradox
  :ensure t
  :defer t
  :config
  (require 'paradox)
  (paradox-enable)
  (setq paradox-github-token ""))


(use-package auto-package-update
  :ensure t
  :defer t
  :config
  (evil-vimish-fold-mode 1))

(require 'auto-package-update)
