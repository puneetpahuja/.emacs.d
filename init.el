;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)
;; (add-to-list 'package-pinned-packages '(helm-projectile . "melpa-stable") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)
(setq package-enable-at-startup nil)
(require 'use-package)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-context-switch-command nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/better-defaults.el line 47 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; On OS X, an Emacs instance started from the graphical user
    ;; interface will have a different environment than a shell in a
    ;; terminal window, because OS X does not run a shell during the
    ;; login. Obviously this will lead to unexpected results when
    ;; calling external utilities like make from Emacs.
    ;; This library works around this problem by copying important
    ;; environment variables from the user's shell.
    ;; https://github.com/purcell/exec-path-from-shell
    exec-path-from-shell

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;yaml-mode
    ;coffee-mode
    ;scss-mode
    ;haskell-mode
    company

    ;; autocomplete
    ;ac-cider

    ;ack-and-a-half
    ag
    ;enh-ruby-mode
    ))

 (dolist (p my-packages)
   (when (not (package-installed-p p))
     (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#FFFFFF" :foreground "#333333" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "MS  " :family "Consolas")))))
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

(load "indent-file.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; helm
(load "setup-helm.el")

;; Langauage-specific
(load "setup-clojure.el")
;(load "setup-js.el")
;(load "setup-css.el")
;(load "setup-yaml.el")
;(load "setup-org.el")
;(load "setup-prolog.el")
;(load "setup-ruby.el")

;; my stuff

; (load "ac-cider-compliment")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#373b41"))
 '(coffee-tab-width 2)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("3b189c29215a842875c90d59da5dae09c8a3a82a6026da9f35b1130e35d4875e" default)))
 ; '(package-selected-packages
 ;   (quote
 ;    (clojure-mode scss-mode yaml-mode web-mode use-package thesaurus tagedit smex rainbow-delimiters php-mode noflet markdown-mode magit ido-ubiquitous helm-projectile helm-ls-git helm-git-grep helm-descbinds helm-ag haskell-mode haml-mode git-gutter exec-path-from-shell enh-ruby-mode dockerfile-mode csharp-mode crux company color-theme-sanityinc-tomorrow coffee-mode clj-refactor aggressive-indent ag adoc-mode adjust-parens ack-and-a-half))))
  '(package-selected-packages
   (quote
    (clojure-mode use-package thesaurus tagedit smex rainbow-delimiters noflet markdown-mode ido-ubiquitous helm-projectile helm-ls-git helm-git-grep helm-descbinds helm-ag haml-mode git-gutter dockerfile-mode crux company clj-refactor aggressive-indent ag adoc-mode adjust-parens exec-path-from-shell))))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; ac-cider autocomplete
; (global-auto-complete-mode t)
; (require 'ac-cider)
; (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
; (add-hook 'cider-mode-hook 'ac-cider-setup)
; (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
; (eval-after-load "auto-complete"
;   '(progn
;      (add-to-list 'ac-modes 'cider-mode)
;      (add-to-list 'ac-modes 'cider-repl-mode)))

;; By default, entries in the popup menu will also display the namespace that
;; the symbol belongs to. To disable this behavior, add to your init file:

; (setq ac-cider-show-ns nil)

;; If you want to trigger auto-complete using TAB in CIDER buffers, add this to
;; your configuration file, but note that it is incompatible with
;;(setq tab-always-indent 'complete):


; (defun set-auto-complete-as-completion-at-point-function ()
;   (setq completion-at-point-functions '(auto-complete)))
; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
; (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)


; (require 'ac-cider-compliment)
; (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
; (add-hook 'cider-mode-hook 'ac-cider-compliment-setup)
; (eval-after-load "auto-complete"
;   '(add-to-list 'ac-modes 'cider-mode))

;; company mode auto-completion
; (global-company-mode)

; (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
; (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
; (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

;; Sometimes, the completion fails to recognize new classes that came with dependencies that were loaded dynamically after the REPL has started (e.g. via Boot). Executing M-x cider-completion-flush-caches (or going through the menu CIDER Interaction->Misc->Flush completion cache) forces the completion backend to re-read all classes it can find on the classpath.

;; Use C-n/C-p to select candidates
;; --------------------------------
;(define-key ac-complete-mode-map (kbd "C-.") 'ac-next)
;(define-key ac-complete-mode-map (kbd "C-,") 'ac-previous)

;; eldoc

; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
; (add-hook 'cider-mode-hook #'eldoc-mode)
; (setq eldoc-echo-area-use-multiline-p t)
; (setq cider-eldoc-display-context-dependent-info t)
; (setq cider-overlays-use-font-lock t)

(defun term-send-ctrl-x ()
  "Quote the next character in term-mode.
Similar to how `quoted-insert' works in a regular buffer."
  (interactive)
  (term-send-raw-string "\C-x"))

(add-hook 'after-init-hook 'global-company-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-.") #'company-select-next)
  (define-key company-active-map (kbd "C-,") #'company-select-previous))

(set-face-background 'hl-line "#ffff66")

(set-face-foreground 'highlight nil)

(set-face-attribute 'helm-selection nil
                    :background "#b8d9f2"
                    ;:foreground "black"
                    )

(set-face-attribute 'region nil :background "#b8d9f2")
; (setq tab-width 3)

(eval-after-load 'helm
    (lambda ()
      (set-face-attribute 'helm-source-header nil
                          :background "gray30"
                          :height 130
                          ; :weight 'ultra-bold
                          :family "Architect's Daughter")))

;; (defun my-buffer-face-mode-variable ()
;;   "Set font to a variable width (proportional) fonts in current buffer"
;;   (interactive)
;;   (setq buffer-face-mode-face '(:family "calibri" :height 100))
;;   (buffer-face-mode))

;(add-hook 'helm-major-mode-hook 'my-buffer-face-mode-variable)

;(find-file "/home/puneet/code/geekskool/best_plan/src/best_plan/core.clj")

(global-set-key (kbd "C-c M-r") 'cider-repl-clear-buffer)
(setq powerline-arrow-shape 'arrow)
;(setq warning-minimum-level :emergency)
(setq tab-always-indent 'complete)
(defvar completion-at-point-functions-saved nil)

(defun company-indent-for-tab-command (&optional arg)
  (interactive "P")
  (let ((completion-at-point-functions-saved completion-at-point-functions)
        (completion-at-point-functions '(company-complete-common-wrapper)))
    (indent-for-tab-command arg)))

(defun company-complete-common-wrapper ()
  (let ((completion-at-point-functions completion-at-point-functions-saved))
    (company-complete-common)))

(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0.3)


(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta shift f3)] 'highlight-symbol-query-replace)



;; (define-key company-mode-map [remap indent-for-tab-command]
;;   'company-indent-for-tab-command)
(defun after-packages-loaded-hook ()
  (require 'magit)
  (setq magit-auto-revert-mode nil))
(add-hook 'after-init-hook
          #'(lambda ()
              (after-packages-loaded-hook)))


;; make git commit message 72 columns wide
(use-package git-commit
  :ensure nil
  :preface
  (defun me/git-commit-set-fill-column ()
    (setq-local comment-auto-fill-only-comments nil)
    (setq fill-column 72))
  :config
  (advice-add 'git-commit-turn-on-auto-fill :before #'me/git-commit-set-fill-column))

(add-hook 'before-save-hook 'whitespace-cleanup)
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/desktop"))
(setq desktop-dirname "~/.emacs.d/desktop")
(setq desktop-base-file-name "emacs-desktop")
; (cider-jack-in)
