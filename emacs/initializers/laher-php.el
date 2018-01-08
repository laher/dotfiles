;;; laher-php.el --- php settings
;;
;;; Commentary:
;;
;; Settings related to php in here.
;;
;;; Code:

(use-package php-auto-yasnippets
    :ensure t
    :defer t)

;;(use-package php-extras
;;    :ensure t
;;    :defer t)

(use-package php-mode
    :ensure t
    :defer t
    :config
    (add-hook 'php-mode-hook 
	      (lambda () 
		(setq indent-tabs-mode t))))

(use-package phpcbf
    :ensure t
    :defer t)

(use-package phpunit
  :ensure t
  :defer t)

(provide 'laher-php)
