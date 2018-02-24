;;; go-fillstruct.el --- Integration of the Go 'fillstruct' tool into Emacs.

;; Version: 0.1
;; Package-Requires: ((go-mode "1.3.1"))
;; Keywords: tools

;;; Commentary:

;; To install:

;; % go get github.com/davidrjenni/reftools/cmd/fillstruct
;; % go build github.com/davidrjenni/reftools/cmd/fillstruct
;; % mv fillstruct $HOME/bin/         # or elsewhere on $PATH

;; The go-fillstruct-command variable can be customized to specify an
;; alternative location for the installed command.

;;; Code:

(require 'cl-lib)
(require 'compile)
(require 'go-mode)
;(require 'thingatpt)

(defgroup go-fillstruct nil
  "Options specific to the Go fillstruct."
  :group 'go)

(defcustom go-fillstruct-command "fillstruct"
  "The `fillstruct' command; by the default, $PATH is searched."
  :type 'string
  :group 'go-fillstruct)

;;;###autoload
(defun go-fillstruct (&optional force)
  "Fill fields for the entity denoted by the identifier at point, using
the `fillstruct' tool. With FORCE, call `fillstruct' with the
`-force' flag."
  (if (not buffer-file-name)
      (error "Cannot use go-fillstruct on a buffer without a file name"))
  ;; It's not sufficient to save the current buffer if modified,
  ;; since if gofmt-before-save is on the before-save-hook,
  ;; saving will disturb the selected region.
  (if (buffer-modified-p)
      (error "Please save the current buffer before invoking go-fillstruct"))
  ;; Prompt-save all other modified Go buffers, since they might get written.
  (save-some-buffers nil #'(lambda ()
              (and (buffer-file-name)
                   (string= (file-name-extension (buffer-file-name)) ".go"))))
  (let* ((posflag (format "-offset=%s:#%d"
                          buffer-file-name
                          (1- (position-bytes (point)))))
         (env-vars (go-root-and-paths))
         (goroot-env (concat "GOROOT=" (car env-vars)))
         (gopath-env (concat "GOPATH=" (mapconcat #'identity (cdr env-vars) ":")))
         success)
    (with-current-buffer (get-buffer-create "*go-fillstruct*")
      (setq buffer-read-only nil)
      (erase-buffer)
      (let ((args (append (list go-fillstruct-command nil t nil posflag) (if force '("-force")))))
        ;; Log the command to *Messages*, for debugging.
        (message "Command: %s:" args)
        (message "Running fillstruct...")
        ;; Use dynamic binding to modify/restore the environment
        (setq success (zerop (let ((process-environment (cl-list* goroot-env gopath-env process-environment)))
          (apply #'call-process args))))
      (insert "\n")
      (compilation-mode)
      (setq compilation-error-screen-columns nil)

      ;; On success, print the one-line result in the message bar,
      ;; and hide the *go-fillstruct* buffer.
      (if success
          (progn
            (message "%s" (go-fillstruct--buffer-string-no-trailing-space))
            (gofmt--kill-error-buffer (current-buffer)))
        ;; failure
        (let ((w (display-buffer (current-buffer))))
          (message "fillstruct exited")
          (set-window-point w (point-min)))))))

  ;; Reload the modified files, saving line/col.
  ;; (Don't restore the point since the text has changed.)
  ;;
  ;; TODO(adonovan): should we also do this for all other files
  ;; that were updated (the tool can print them)?
  (let ((line (line-number-at-pos))
        (col (current-column)))
    (revert-buffer t t t) ; safe, because we just saved it
    (goto-char (point-min))
    (forward-line (1- line))
    (forward-char col)))


(defun go-fillstruct--buffer-string-no-trailing-space ()
  (replace-regexp-in-string "[\t\n ]*\\'"
                            ""
                            (buffer-substring (point-min) (point-max))))

(provide 'go-fillstruct)

;;; go-fillstruct.el ends here
