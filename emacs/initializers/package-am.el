(use-package paradox
  :ensure t
  :defer t
  :config
  (require 'paradox)
  (paradox-enable)
  (setq paradox-github-token "26f97972bcdd39208d8081df195773e8384d88ef"))


(use-package auto-package-update
  :ensure t
  :defer t
  :config
  (evil-vimish-fold-mode 1))

(require 'auto-package-update)
