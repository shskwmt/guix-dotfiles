;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(define-module (home-configuration)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services xdg)
  #:use-module (gnu home services symlink-manager)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (hikizan packages base)
  #:use-module (hikizan packages font)
  #:use-module (hikizan services shell)
  #:use-module (hikizan services emacs))

(define my-packages
  `(,@base-packages
    ,@font-packages))

(home-environment
 (packages my-packages)
 (essential-services
  (list
   (service home-run-on-first-login-service-type)
   (service home-activation-service-type)
   (service home-environment-variables-service-type)
   (service home-symlink-manager-service-type)
   (service home-xdg-base-directories-service-type)
   (service home-service-type)
   (service home-profile-service-type my-packages)))
 (services
  `(,@hikizan-shell-services
    ,@hikizan-emacs-services)))
