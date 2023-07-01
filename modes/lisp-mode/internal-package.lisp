(defpackage :lem-lisp-mode/internal
  (:use :cl
        :lem
        :lem/completion-mode
        :lem/language-mode
        :lem/button
        :lem/loading-spinner
        :lem-lisp-mode/errors
        :lem-lisp-mode/swank-protocol
        :lem-lisp-mode/connections
        :lem-lisp-mode/message-dispatcher
        :lem-lisp-mode/ui-mode
        :lem-lisp-mode/grammer)
  (:export
   ;; reexport swank-protocol.lisp
   :connection-value)
  (:export
   ;; lisp-ui-mode.lisp
   :*lisp-ui-keymap*
   :lisp-ui-default-action
   :lisp-ui-forward-button
   ;; file-conversion.lisp
   :*file-conversion-map*
   ;; lisp-mode.lisp
   :lisp-mode
   :load-file-functions
   :before-compile-functions
   :before-eval-functions
   :*default-port*
   :*localhost*
   :*lisp-mode-keymap*
   :*lisp-mode-hook*
   :self-connected-p
   :self-connected-port
   :self-connect
   :check-connection
   :*current-package*
   :buffer-package
   :current-package
   :buffer-thread-id
   :with-remote-eval
   :lisp-eval-from-string
   :lisp-eval
   :lisp-eval-async
   :eval-with-transcript
   :re-eval-defvar
   :interactive-eval
   :eval-print
   :lisp-beginning-of-defun
   :lisp-end-of-defun
   :insert-\(\)
   :move-over-\)
   :lisp-indent-sexp
   :lisp-set-package
   :prompt-for-sexp
   :lisp-eval-string
   :lisp-eval-last-expression
   :lisp-eval-defun
   :lisp-eval-region
   :lisp-load-file
   :lisp-echo-arglist
   :lisp-remove-notes
   :lisp-compile-and-load-file
   :lisp-compile-region
   :lisp-compile-defun
   :lisp-macroexpand
   :lisp-macroexpand-all
   :prompt-for-symbol-name
   :show-description
   :lisp-eval-describe
   :lisp-describe-symbol
   :connect-to-swank
   :slime-connect
   :show-source-location
   :source-location-to-xref-location
   :get-lisp-command
   :run-slime
   :slime
   :slime-quit
   :slime-restart
   :slime-self-connect
   ;; repl.lisp
   :*lisp-repl-mode-keymap*
   :lisp-repl-interrupt
   :repl-buffer
   :clear-repl
   :*repl-compiler-check*
   :listener-eval
   :start-lisp-repl
   :lisp-switch-to-repl-buffer
   :write-string-to-repl
   :copy-down-to-repl
   ;; inspector.lisp
   :inspector-label-attribute
   :inspector-value-attribute
   :inspector-action-attribute
   :*inspector-limit*
   :*lisp-inspector-keymap*
   :open-inspector
   :lisp-inspect
   :lisp-inspector-pop
   :lisp-inspector-next
   :lisp-inspector-quit
   :lisp-inspector-describe
   :lisp-inspector-pprint
   :lisp-inspector-eval
   :lisp-inspector-history
   :lisp-inspector-show-source
   :lisp-inspector-reinspect
   :lisp-inspector-toggle-verbose
   :inspector-insert-more-button
   :lisp-inspector-fetch-all
   ;; apropos-mode.lisp
   :apropos-headline-attribute
   :*lisp-apropos-mode-keymap*
   :lisp-apropos
   :lisp-apropos-all
   :lisp-apropos-package
   ;; message.lisp
   :display-message
   ;;
   :self-connection
   :self-connection-p
   :*find-definitions*
   :switch-connection
   :connection
   :current-connection))
