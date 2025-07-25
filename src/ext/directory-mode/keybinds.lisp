(uiop:define-package :lem/directory-mode/keybinds
  (:use :cl
        :lem
        :lem/directory-mode/commands)
  (:import-from :lem/directory-mode/mode
                :*directory-mode-keymap*))
(in-package :lem/directory-mode/keybinds)

#+sbcl
(eval-when (:compile-toplevel :load-toplevel :execute)
  (sb-ext:lock-package :lem/directory-mode/keybinds))

(define-key *global-keymap* "C-x C-j" 'find-file-directory)

(define-key *directory-mode-keymap* "q" 'quit-active-window)
(define-key *directory-mode-keymap* "M-q" 'quit-active-window)
(define-key *directory-mode-keymap* "g" 'directory-mode-update-buffer)
(define-key *directory-mode-keymap* "^" 'directory-mode-up-directory)
(define-key *directory-mode-keymap* "Return" 'directory-mode-find-file)
(define-key *directory-mode-keymap* "Space" 'directory-mode-read-file)
(define-key *directory-mode-keymap* "o" 'directory-mode-find-file-next-window)
(define-key *directory-mode-keymap* "n" 'directory-mode-next-line)
(define-key *directory-mode-keymap* "p" 'directory-mode-previous-line)
(define-key *directory-mode-keymap* "M-}" 'directory-mode-next-mark)
(define-key *directory-mode-keymap* "M-{" 'directory-mode-previous-mark)
(define-key *directory-mode-keymap* "m" 'directory-mode-mark-and-next-line)
(define-key *directory-mode-keymap* "u" 'directory-mode-unmark-and-next-line)
(define-key *directory-mode-keymap* "U" 'directory-mode-unmark-and-previous-line)
(define-key *directory-mode-keymap* "t" 'directory-mode-toggle-marks)
(define-key *directory-mode-keymap* "* !" 'directory-mode-unmark-all)
(define-key *directory-mode-keymap* "* %" 'directory-mode-mark-regexp)
(define-key *directory-mode-keymap* "* /" 'directory-mode-mark-directories)
(define-key *directory-mode-keymap* "* @" 'directory-mode-mark-links)
(define-key *directory-mode-keymap* "* C-n" 'directory-mode-next-mark)
(define-key *directory-mode-keymap* "* C-p" 'directory-mode-previous-mark)
(define-key *directory-mode-keymap* "Q" 'directory-mode-query-replace)
(define-key *directory-mode-keymap* "D" 'directory-mode-delete-files)
(define-key *directory-mode-keymap* "C" 'directory-mode-copy-files)
(define-key *directory-mode-keymap* "R" 'directory-mode-rename-files)
(define-key *directory-mode-keymap* "r" 'directory-mode-rename-file)
(define-key *directory-mode-keymap* "s" 'directory-mode-sort-files)
(define-key *directory-mode-keymap* "+" 'make-directory)
(define-key *directory-mode-keymap* "C-k" 'directory-mode-kill-lines)
