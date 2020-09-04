;;; init.el --- Initialization file for Emacs

;;; Commentary:
;; Emacs Startup File --- initialization for Emacs
;;
;; Inspired in part by https://github.com/gjstein/emacs.d/blob/master/init.el

;;; Code:

;; User Info
(setq user-full-name "Benjamin Rosas"
      user-mail-address "ben@aliencyb.org")

;; Garbage collection
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

;; UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; use-package setup
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives (append package-archives
                               '(("melpa" . "http://melpa.org/packages/")
                                 ("marmalade" . "http://marmalade-repo.org/packages/")
                                 ("gnu" . "http://elpa.gnu.org/packages/")
                                 ("org" . "http://orgmode.org/elpa/"))))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package diminish :ensure t)

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Set the path variable

(use-package exec-path-from-shell
  :ensure t
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  :config (exec-path-from-shell-initialize))

(global-auto-revert-mode t)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "M-o") 'other-window)

;; === Face Customization ===
(load-file "~/.emacs.d/config/init-10-face.el")

;; === Interface ===
(load-file "~/.emacs.d/config/init-20-nav-interface.el")

;; === Document Editing ===
(load-file "~/.emacs.d/config/init-30-doc-gen.el")
(load-file "~/.emacs.d/config/init-31-doc-org.el")

;; === Programming & Coding Functions
(load-file "~/.emacs.d/config/init-40-coding-gen.el")
(load-file "~/.emacs.d/config/init-42-coding-web.el")

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "f7216d3573e1bd2a2b47a2331f368b45e7b5182ddbe396d02b964b1ea5c5dc27" "fe00bb593cb7b8c015bb2eafac5bfc82a9b63223fbc2c66eddc75c77ead7c7c1" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "a3b6a3708c6692674196266aad1cb19188a6da7b4f961e1369a68f06577afa16" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "cf3d5d77679f7daed6a2c863e4f2e30427d5e375b254252127be9359957502ec" "711efe8b1233f2cf52f338fd7f15ce11c836d0b6240a18fffffc2cbd5bfe61b0" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" default))
 '(package-selected-packages
   '(company-tern tern rjxs-mode vue-mode typescript-mode emmet-mode web-mode rainbow-delimiters prolog-mode haskell-mode helm-ag ag ws-butler company-irony markdown-mode exec-path-from-shell indium which-key use-package smartparens smart-mode-line-powerline-theme slime paredit helm-projectile flycheck expand-region doom-themes diminish crux company avy))
 '(sml/mode-width (if (eq (powerline-current-separator) 'arrow) 'right 'full))
 '(sml/pos-id-separator
   '(""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " " 'display
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (car powerline-default-separator-dir)))
                   'powerline-active1 'powerline-active2)))
     (:propertize " " face powerline-active2)))
 '(sml/pos-minor-modes-separator
   '(""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " " 'display
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (cdr powerline-default-separator-dir)))
                   'powerline-active1 'sml/global)))
     (:propertize " " face sml/global)))
 '(sml/pre-id-separator
   '(""
     (:propertize " " face sml/global)
     (:eval
      (propertize " " 'display
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (car powerline-default-separator-dir)))
                   'sml/global 'powerline-active1)))
     (:propertize " " face powerline-active1)))
 '(sml/pre-minor-modes-separator
   '(""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " " 'display
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (cdr powerline-default-separator-dir)))
                   'powerline-active2 'powerline-active1)))
     (:propertize " " face powerline-active1)))
 '(sml/pre-modes-separator (propertize " " 'face 'sml/modes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
