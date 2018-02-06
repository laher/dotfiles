;;; js-am.el --- js settings
;;
;;; Commentary:
;;
;;; Settings related to js
;;
;;; Code:
(defun my-setup-indent (n)
  ;; web development
  (setq-local coffee-tab-width n) ; coffeescript
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local css-indent-offset n) ; css-mode
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  )

(defun my-style ()
  (interactive)
  (message "My personal code style!")
  ;; use space instead of tab
  (setq indent-tabs-mode nil)
  ;; indent 2 spaces width
  (my-setup-indent 2))

(use-package rjsx-mode
  :ensure t
  :config
  (add-hook 'rjsx-mode-hook 'my-style)
  )

(use-package flow-minor-mode
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'flow-minor-enable-automatically)
  )

  ;; :load-path "~/code/js/prettier/editors/emacs"
(use-package prettier-js
  :ensure t
  :commands (prettier-mode prettier)
  :init
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  :bind (:map js2-mode-map ("M-q" . prettier))
  :config (setq prettier-target-mode "js2-mode"))


(provide 'js-am)
