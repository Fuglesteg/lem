(in-package :lem)

(export '(define-command
          make-command-table
          add-command
          remove-command
          find-command
          exist-command-p))

(eval-when (:compile-toplevel :load-toplevel)
  (defun gen-defcommand-arg-parser (universal-argument arg-descripters)
    (cond
      ((string= "p" (car arg-descripters))
       `(list (or ,universal-argument 1)))
      ((string= "P" (car arg-descripters))
       `(list ,universal-argument))
      ((string= "r" (car arg-descripters))
       `(progn
          (check-marked)
          (list (region-beginning) (region-end))))
      (t
       (cons 'list
             (mapcar #'(lambda (arg-descripter)
                         (cond
                           ((char= #\s (aref arg-descripter 0))
                            `(prompt-for-string ,(subseq arg-descripter 1)))
                           ((char= #\n (aref arg-descripter 0))
                            `(prompt-for-integer ,(subseq arg-descripter 1)))
                           ((char= #\b (aref arg-descripter 0))
                            `(prompt-for-buffer ,(subseq arg-descripter 1)
                                                :default (buffer-name (current-buffer))
                                                :existing t))
                           ((char= #\B (aref arg-descripter 0))
                            `(prompt-for-buffer ,(subseq arg-descripter 1)
                                                :default (buffer-name (other-buffer))
                                                :existing nil))
                           ((char= #\f (aref arg-descripter 0))
                            `(prompt-for-file
                              ,(subseq arg-descripter 1)
                              :directory (buffer-directory)
                              :default nil
                              :existing t))
                           ((char= #\F (aref arg-descripter 0))
                            `(prompt-for-file
                              ,(subseq arg-descripter 1)
                              :directory (buffer-directory)
                              :default nil
                              :existing nil))
                           (t
                            (error "Illegal arg-descripter: ~a" arg-descripter))))
                     arg-descripters)))))

  (alexandria:with-unique-names (arguments)
    (defun gen-defcommand-body (fn-name
                                parms
                                universal-argument
                                arg-descripters)
      `(block ,fn-name
         ,(if (null arg-descripters)
              (progn
                (assert (null parms))
                `(,fn-name))
              `(destructuring-bind (&rest ,arguments)
                   ,(if (stringp (car arg-descripters))
                        (gen-defcommand-arg-parser universal-argument arg-descripters)
                        (car arg-descripters))
                 (apply #',fn-name ,arguments)))))))

(defun primary-class (options)
  (let ((value (alexandria:assoc-value options :primary-class)))
    (cond ((null value)
           +primary-command-class-name+)
          (t
           (alexandria:length= (assert value) 1)
           (first value)))))

(defmacro define-command (name-and-options params (&rest arg-descripters) &body body)
  (destructuring-bind (name . options) (uiop:ensure-list name-and-options)
    (let ((primary-class (primary-class options))
          (advice-classes (alexandria:assoc-value options :advice-classes))
          (command-name (string-downcase name)))
      (alexandria:with-unique-names (command universal-argument)
        `(progn
           (add-command ,command-name (make-cmd :name ',name))
           (defun ,name ,params
             ,@body)
           (defclass ,name (,primary-class ,@advice-classes) ())
           (defmethod execute ((,command ,name) ,universal-argument)
             (declare (ignorable ,universal-argument))
             ,(gen-defcommand-body name
                                   params
                                   universal-argument
                                   arg-descripters)))))))
