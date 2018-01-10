;;; go-am.el --- go-related settings
;;
;;; Commentary:
;;
;;; Settings related to Go
;;
;;; Code:

(use-package go-dlv
  :ensure t)
(use-package go-impl
  :ensure t)
(use-package go-errcheck
  :ensure t)
(use-package ob-go
  :ensure t)
(use-package go-rename
  :ensure t
  :init
    )
(use-package go-mode
 :ensure t
 :config
    (require 'evil-leader)
    (evil-leader/set-key-for-mode 'go-mode
        "or" 'go-guru-referrers
        "od" 'go-guru-definition
        "op" 'go-guru-peers
        "ok" 'go-guru-describe
        "oR" 'go-rename
        "ot" 'go-test
        )
    (progn
      (add-hook 'before-save-hook 'gofmt-before-save)
      )
    )

(use-package company-go
  :ensure t
  :defer t
  :init
  (progn
      (setq company-go-show-annotation t)
      ))

(use-package go-guru
  :ensure t)
;; (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode))






(provide 'go-am)
