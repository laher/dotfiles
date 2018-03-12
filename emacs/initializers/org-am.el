;;; org-am.el --- org-mode settings
;;
;;; Commentary:
;;
;;; Settings related to org-mode
;;
;;; Code:

(use-package evil-org
  :ensure t
  :defer t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  ;;(add-hook 'evil-org-mode-hook #'evil-org-set-key-theme)
  )

(use-package org-tree-slide
  :ensure t
  :defer t)
  :ensure t)

(use-package ob-restclient
  :ensure t
  :defer t)

(use-package org
  :ensure t
  :defer t
  :mode ("\\.org$" . org-mode)
  :config
  (progn
    ;; auto-wrap
    ;; (add-hook 'org-mode-hook 'bw-turn-on-auto-fill)

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
       (restclient . t)
       (dot . t)
       (ruby . t)))

    (setq org-agenda-files (list "~/o/" "~/o/w/"))
    (setq org-refile-targets '((org-agenda-files :maxlevel . 9)))
    (setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
    (setq org-refile-use-outline-path t)                  ; Show full paths for refiling


    (defun my-org-confirm-babel-evaluate (lang body)
      (not (string= lang "restclient")))  ; don't ask for restclient
    (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)


    (defun org-mode-export-hook ()
      (add-hook 'after-save-hook 'org-html-export-to-html t t))

  (add-hook 'org-mode-hook #'org-mode-export-hook)
  (add-hook 'org-mode-hook 'evil-org-mode)

  (defun my-org-confirm-babel-evaluate (lang body)
    (not (string= lang "dot")))  ; don't ask for dot diagrams
  (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

  (setq  org-return-follows-link t)
    ;; default directory
    (setq org-directory (expand-file-name "~/o"))))



(provide 'org-am)
