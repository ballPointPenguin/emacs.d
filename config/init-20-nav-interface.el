;;; init-20-nav-inte3rface.el --- Customize emacs interface (mostly Helm)

;;; Commentary:
;; Mostly configures helm-mode, which is great for getting around
;; inspired by https://github.com/gjstein/emacs.d/blob/master/config/init-20-nav-interface.el

;;; Code:
(require 'use-package)

;; == General keybindings ==
(use-package general :ensure t)

;; support for ls --dired on macOS
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; == Helm Mode ==
(use-package helm
       :ensure t
       :defer 2
       :diminish helm-mode
       :config
       (require 'helm)
       (require 'helm-files)
       (require 'helm-config) ; Necessary for helm-mode

       (setq helm-split-window-inside-p t
             helm-move-to-line-cycle-in-source t
             helm-autoresize-max-height 0
             helm-autoresize-min-height 20)

       (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind TAB to run persistent action
       (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
       (define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z

       ;; (helm-autoresize-mode 1)
       (helm-mode 1)

       :bind (("M-x" . helm-M-x)
              ("C-x C-f" . helm-find-files)
              ("M-y" . helm-show-kill-ring)
              ("C-x b" . helm-mini)
              )
       )

;; == Swiper (Ivy) ==
(use-package swiper :ensure t)
(use-package swiper-helm
  :ensure t
  :after helm
  :init
  )

(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  (setq which-key-idle-delay 0.2)
  :diminish which-key-mode
  )

;;; init-20-nav-interface.el ends here
