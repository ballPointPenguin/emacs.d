;;; init-30-doc-gen.el --- Code for general document editing

;;; Commentary:
;; Installs auctex (for latex super-editing) and markdown mode.

;;; Code:

;; == Markdown ==
(use-package markdown-mode
  :ensure t
  :defer t
  :mode (("\\.text\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode))
  )

(use-package flyspell
  :defer t
  :diminish (flyspell-mode))

;;; init-30-doc-gen.el ends here
