;;; git-am.el --- Git-related settings
;;
;;; Commentary:
;;
;; Settings related to git, magit, etc go in here.
;;
;;; Code:

(use-package github-browse-file
  :ensure t)

(use-package gitconfig-mode
  :ensure t)

(use-package gitignore-mode
  :ensure t)

;; TODO: Deferreds/autoloads
(use-package magit
  :ensure t)

;; TODO: Deferreds/autoloads
(use-package evil-magit
  :ensure t)

(use-package gh
  :ensure t)

(use-package diff-hl
  :ensure t)



(provide 'git-am)
