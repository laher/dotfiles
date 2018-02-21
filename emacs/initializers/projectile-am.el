;;; projectile-am.el --- projectile settings
;;
;;; Commentary:
;;
;; Settings related to projectile go in here.
;;
;;; Code:


(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-global-mode))


(use-package counsel-projectile
  :ensure t
  :defer t
  :config
  (counsel-projectile-mode)
  (setq counsel-projectile-ag-initial-input '(thing-at-point 'symbol t))
  )

(provide 'projectile-am)
