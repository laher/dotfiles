
;; https://github.com/alexmurray/evil-vimish-fold
(use-package evil-vimish-fold
  :ensure t
  :defer t
  :config
  (evil-vimish-fold-mode 1))

;; https://github.com/cofi/evil-leader
(use-package evil-leader
  :ensure t
  :defer t
  :config
  (global-evil-leader-mode))

;; https://github.com/linktohack/evil-commentary
(use-package evil-commentary
  :ensure t
  :defer t
  :config
  (evil-commentary-mode))

;; https://github.com/roman/evil-paredit
(use-package evil-paredit
  :ensure t
  :defer t)

;; https://github.com/timcharper/evil-surround
(use-package evil-surround
  :ensure t
  :defer t
  :config
  (global-evil-surround-mode 1))

;; https://github.com/emacsmirror/evil
(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (require 'evil-commentary)
  (require 'evil-leader)
  (require 'evil-paredit)
  (require 'evil-surround)
  (require 'evil-vimish-fold)
  (require 'evil-org)

  (setq evil-default-cursor t)

  (evil-leader/set-leader ",")

  ;; Ensure ESC quits in all modes: http://stackoverflow.com/a/10166400/61435
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)

  ;; Skip wrapped lines visually, not by line number
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  ;; Shortcut for wrapping paragraphs at line limit
  (define-key evil-normal-state-map (kbd "Q") (kbd "gqap"))

  (evil-leader/set-key
    "s"       'sort-lines
    "e" 'find-file

    ;; Folding
    "zf"      'hs-hide-block
    "zo"      'hs-show-block

    ;; Comments
    "c <SPC>" 'evilnc-comment-or-uncomment-lines

    ;; Buffer management
    "b" 'switch-to-buffer
    "k" 'kill-buffer
    "u"      'buffer-menu
    "d"      'kill-buffer-and-window

    ;; Window/pane management
    "v"      'split-window-right
    "h"      'split-window-below
    "_"      'balance-windows
    "w"       'next-multiframe-window)

  (evil-ex-define-cmd  "Restart" 'restart-emacs)
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "b" 'byte-compile-file)
  (evil-leader/set-key-for-mode 'go-mode
    "or" 'go-guru-referrers
    "od" 'go-guru-definition
    "op" 'go-guru-peers
    "ok" 'go-guru-describe
    "oR" 'go-rename
    )

 (setq evil-cross-lines t)

  )



; see laher-org.el
;; (add-to-list 'load-path "~/.emacs.d/elpa/evil-org-0.1.1")
;; (use-package evil-org
;;:init
;; (add-hook 'org-mode-hook 'evil-org-mode)
;;	     )

;; (evil-org-set-key-theme '(navigation insert textobjects additional calendar))

;; (use-package evil-org-agenda)
;;(evil-org-agenda-set-keys)


(provide 'laher-evil)
