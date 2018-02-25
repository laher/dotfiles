;;; go-am.el --- go-related settings
;;
;;; Commentary:
;;
;;; Settings related to Go
;;
;;; Code:

(use-package go-dlv
  :ensure t
  :defer t)
(use-package go-impl
  :ensure t
  :defer t)
(use-package go-errcheck
  :ensure t
  :defer t)
(use-package ob-go
  :ensure t
  :defer t)
(use-package go-rename
  :ensure t
  :defer t)
(use-package go-eldoc
  :ensure t
  :defer t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))
(use-package go-projectile
  :ensure t
  :defer t)

(use-package go-mode
 :ensure t
 :config
    (require 'evil-leader)
    (evil-leader/set-key-for-mode 'go-mode
        "oo" 'ff-find-other-file
        "or" 'go-guru-referrers
        "od" 'go-guru-definition
        "op" 'go-guru-peers
        "ok" 'go-guru-describe
        "oR" 'go-rename
        "oT" 'go-run-test-current-function
        "ot" 'am/go-run-package-tests
        )
    (defun am/go-run-tests (args)
        (interactive)
        (save-selected-window
          (async-shell-command (concat "go test " args))))

    (defun am/go-install ()
        (interactive)
          (async-shell-command "go install -v ."))

    (defun am/go-run-package-tests ()
        (interactive)
        (am/go-run-tests ""))

    (defun am/go-run-package-tests-nested ()
        (interactive)
        (am/go-run-tests "./..."))

    (defun am/go-run-test-current-function ()
        (interactive)
        (if (string-match "_test\\.go" buffer-file-name)
            (let ((test-method (if go-use-gocheck-for-testing
                                   "-check.f"
                                 "-run")))
              (save-excursion
                  (re-search-backward "^func[ ]+\\(([[:alnum:]]*?[ ]?[*]?[[:alnum:]]+)[ ]+\\)?\\(Test[[:alnum:]_]+\\)(.*)")
                  (am/go-run-tests (concat test-method "='" (match-string-no-properties 2) "'"))))
          (message "Must be in a _test.go file to run go-run-test-current-function")))

    (defun am/go-run-test-current-suite ()
        (interactive)
        (if (string-match "_test\.go" buffer-file-name)
            (if go-use-gocheck-for-testing
                (save-excursion
                    (re-search-backward "^func[ ]+\\(([[:alnum:]]*?[ ]?[*]?\\([[:alnum:]]+\\))[ ]+\\)?Test[[:alnum:]_]+(.*)")
                    (am/go-run-tests (concat "-check.f='" (match-string-no-properties 2) "'")))
              (message "Gocheck is needed to test the current suite"))
          (message "Must be in a _test.go file to run go-test-current-suite")))

    (defun am/go-run-main ()
        (interactive)
        (shell-command
          (format "go run %s"
                  (shell-quote-argument (buffer-file-name)))))

    (defun am/go-get (args)
        (interactive)
        (async-shell-command (concat "go get -v " args)))

    (defun am/go-get-update (args)
        (interactive)
        (save-selected-window
          (async-shell-command (concat "go get -u -v " args))))

;; this is more than what we need at this point ...
;; we probably just need guru, gocode
    (setq gobinaries [ "github.com/zmb3/gogetdoc"
                        "golang.org/x/tools/cmd/guru"
                        "github.com/klauspost/asmfmt/cmd/asmfmt"
                        "github.com/kisielk/errcheck"
                        "github.com/davidrjenni/reftools/cmd/fillstruct"
                        "github.com/nsf/gocode"
                        "github.com/rogpeppe/godef"
                        "github.com/zmb3/gogetdoc"
                        "golang.org/x/tools/cmd/goimports"
                        "github.com/golang/lint/golint"
                        "github.com/alecthomas/gometalinter"
                        "github.com/fatih/gomodifytags"
                        "golang.org/x/tools/cmd/gorename"
                        "github.com/jstemmer/gotags"
                        "golang.org/x/tools/cmd/guru"
                        "github.com/josharian/impl"
                        "github.com/dominikh/go-tools/cmd/keyify"
                        "github.com/fatih/motion" ])

    ;; TODO: check go/git exist
    (defun am/go-install-binaries ()
        (interactive)
        (async-shell-command (concat "go get -v " (string-join gobinaries " "))))

    (defun am/go-update-binaries ()
        (interactive)
        (async-shell-command (concat "go get -u -v " (string-join gobinaries " "))))


    ;; TODO (for feature-parity with vim-go)
    ;;
    ;; * binaries
    ;; GoInstallBinaries
    (evil-ex-define-cmd  "GoInstallBinaries" 'am/go-install-binaries)
    ;; GoUpdateBinaries
    (evil-ex-define-cmd  "GoUpdateBinaries" 'am/go-update-binaries)
    ;;
    ;; * gorename
    ;; GoRename
    ;;
    ;; * guru
    ;; GoImplements
    (evil-ex-define-cmd  "GoImplements" 'go-guru-implements)
    ;; GoWhicherrs
    (evil-ex-define-cmd  "GoWhicherrs" 'go-guru-whicherrs)
    ;; GoCallees
    (evil-ex-define-cmd  "GoCallees" 'go-guru-callees)
    ;; GoDescribe
    (evil-ex-define-cmd  "GoDescribe" 'go-guru-describe)
    ;; GoCallers
    (evil-ex-define-cmd  "GoCallers" 'go-guru-callers)
    ;; GoCallstack
    (evil-ex-define-cmd  "GoCallstack" 'go-guru-callstack)
    ;; GoFreevars
    (evil-ex-define-cmd  "GoFreevars" 'go-guru-freevars)
    ;; GoChannelPeers
    (evil-ex-define-cmd  "GoChannelPeers" 'go-guru-peers)
    ;; GoReferrers
    (evil-ex-define-cmd  "GoReferrers" 'go-guru-referrers)
    ;; GoSameIds
    ;; GoSameIdsClear
    ;; GoSameIdsToggle
    ;; GoSameIdsAutoToggle
    ;;
    ;; * tags
    ;; GoAddTags
    ;; GoRemoveTags
    ;;
    ;; * tool
    ;; GoFiles
    ;; GoDeps
    ;; GoInfo
    (evil-ex-define-cmd  "GoInfo" 'go-guru-describe)
    ;; GoAutoTypeInfoToggle
    ;; GoBuild
    ;; GoBuildTags
    ;; GoGenerate
    ;; GoRun
    (evil-ex-define-cmd  "GoRun" 'am/go-run-main)
    ;; GoInstall
    (evil-ex-define-cmd  "GoInstall" 'am/go-install)
    ;;
    ;; * test
    ;; GoTest
    (evil-ex-define-cmd  "GoTest" 'am/go-run-package-tests)
    ;; GoTestFunc
    (evil-ex-define-cmd  "GoTestFunc" 'am/go-run-test-current-function)
    ;; GoTestCompile
    ;;
    ;; * cover
    ;; GoCoverage
    ;; GoCoverageClear
    ;; GoCoverageToggle
    ;; GoCoverageBrowser
    ;;
    ;; * play
    ;; GoPlay
    ;;
    ;; * def
    ;; GoDef
    (evil-ex-define-cmd  "GoDef" 'go-guru-definition)
    ;; GoDefPop
    ;; GoDefStack
    ;; GoDefStackClear
    ;;
    ;; * doc
    ;; GoDoc
    (evil-ex-define-cmd  "GoDoc" 'godoc-at-point)
    ;; GoDocBrowser
    ;;
    ;; * fmt
    ;; GoFmt
    ;; GoFmtAutoSaveToggle
    ;; GoImports
    ;;
    ;; * import
    ;; GoDrop
    ;; GoImport
    ;; GoImportAs
    ;;
    ;; * linters
    ;; GoMetaLinter
    ;; GoMetaLinterAutoSaveToggle
    ;; GoLint
    ;; GoVet
    ;; GoErrCheck
    ;;
    ;; * alternate
    ;; GoAlternate
    (evil-ex-define-cmd  "GoAlternate" 'ff-find-other-file)
    ;;
    ;; * decls
    ;; GoDecls
    ;; GoDeclsDir
    ;;
    ;; * impl
    ;; GoImpl
    ;;
    ;; * template
    ;; GoTemplateAutoCreateToggle
    ;;
    ;; * keyify
    ;; GoKeyify
    ;;
    ;; * fillstruct
    ;; GoFillStruct

    (setq gofmt-command "goimports")
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
  :ensure t
  :defer t
  :config
  (go-guru-hl-identifier-mode)                    ; highlight identifiers
  )

(use-package go-fill-struct
  :ensure t
  :defer t
  )

;; (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode))






(provide 'go-am)
