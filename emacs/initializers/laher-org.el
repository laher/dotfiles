;;; laher-org.el --- org-mode settings
;;
;;; Commentary:
;;
;;; Settings related to org-mode
;;
;;; Code:

(use-package org
  :ensure t
  :mode ("\\.org$" . org-mode)
  :config
  (progn
    ;; auto-wrap
    (add-hook 'org-mode-hook 'bw-turn-on-auto-fill)

    (require 'evil-org)

    ;; edit inline code blocks natively
    (setq
     org-src-fontify-natively t
     org-src-tab-acts-natively t
     org-completion-use-ido t)

    ;; Show other programming languages semi-natively when embedded
    (org-babel-do-load-languages
     'org-babel-load-languages
     ;; load emacs-lisp natively
     '((emacs-lisp . t)
       (go . t)
       (ruby . t)))

    (setq org-agenda-files (list "~/o/" "~/o/w/"))
 (setq org-refile-targets '((org-agenda-files :maxlevel . 9)))
  (setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
  (setq org-refile-use-outline-path t)                  ; Show full paths for refiling

    ;; default directory
    (setq org-directory (expand-file-name "~/o"))))

(use-package evil-org
  :ensure t
  :init (add-hook 'org-mode-hook 'evil-org-mode))

(provide 'laher-org)
