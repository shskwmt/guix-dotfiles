(define-module (hikizan services emacs)
  #:use-module (gnu services)
  #:use-module (gnu home services)
  #:use-module (gnu packages emacs)
  #:use-module (guix gexp)
  #:export (hikizan-emacs-services))

(define hikizan-emacs-services
  (list
   (simple-service 'home-emacs-package
		   home-profile-service-type
		   (list emacs))
   (simple-service 'home-emacs-files
		   home-xdg-configuration-files-service-type
		   `(("emacs/init.el" ,(local-file "../files/emacs/init.el"))
		     ("emacs/early-init.el" ,(local-file "../files/emacs/early-init.el"))
		     ("emacs/lisp" ,(local-file "../files/emacs/lisp" #:recursive? #t))))))
