;;; scala-am.el --- php settings
;;
;;; Commentary:
;;
;; Settings related to php in here.
;;
;;; Code:

(use-package ensime
    :ensure t
    :defer t)

(use-package scala-mode
    :ensure t
    :defer t
    :config
    (require 'ensime)
    (evil-define-key 'normal ensime-mode-map (kbd "<f7>") #'ensime-typecheck-all)
    (evil-define-key 'normal ensime-mode-map (kbd "C-]") #'ensime-edit-definition)
   (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
    )


(provide 'scala-am)
