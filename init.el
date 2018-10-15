;;; package --- Main init file


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


(add-to-list 'load-path (concat user-emacs-directory "settings"))

(require 'package-settings)

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-to-list 'load-path "~/.emacs.d/customizations")
(require 'lockstep)

(require 'undo-tree)
;; (global-undo-tree-mode)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

(define-key special-event-map [config-changed-event] #'ignore)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 140 :family "pfdin")))))


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

;; (load "pragmatapro-prettify-symbols-v0.824.el")
;; (load "pragmatapro-font-lock-symbols-v2.el")
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
 '(ansi-term-color-vector
   (vector "#1B2B34" "#EC5f67" "#99C794" "#FAC863" "#6699CC" "#C594C5" "#6699CC" "#C0C5CE"))
 '(coffee-tab-width 2)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("31ee77ad4f9e462192812cf0a829a5ac77f9c3f638f9748923d98e2e40184d42" "a4340c197a450c77c729cad236b5f3ca88aaf974e91a7af2d2e7ae7bb5f96720" "6b20d669fcbcd79c6d0f3db36a71af1b88763246d3550a0c361866adecb38a9e" "3a08a6a704a490481c0145ec5cd67beb95a2596f611e09ad6c85be6353d2a7dc" "4486ade2acbf630e78658cd6235a5c6801090c2694469a2a2b4b0e12227a64b9" "3b189c29215a842875c90d59da5dae09c8a3a82a6026da9f35b1130e35d4875e" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote ghci))
 '(haskell-tags-on-save t)
 '(package-selected-packages
   (quote
    (linum-relative py-autopep8 ein elpy clojure-mode use-package thesaurus tagedit smex rainbow-delimiters noflet markdown-mode ido-ubiquitous helm-projectile helm-ls-git helm-git-grep helm-descbinds helm-ag haml-mode git-gutter dockerfile-mode crux company clj-refactor aggressive-indent ag adoc-mode adjust-parens exec-path-from-shell))))

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
(add-to-list 'auto-mode-alist '("\\.mat\\'" . octave-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

(defun term-send-ctrl-x ()
  "Quote the next character in term-mode.
Similar to how `quoted-insert' works in a regular buffer."
  (interactive)
  (term-send-raw-string "\C-x"))

(add-hook 'after-init-hook 'global-company-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

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
                          :family "architects daughter")))

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

;; solve emacsclient issue - window size too small to split
(defun split-window-right-ignore (&optional size)
  (if (car size) size (list (/ (window-total-width) 2))))

(advice-add 'split-window-right :filter-args
            'split-window-right-ignore)


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

;; ruler fci

(setq-default fill-column 80)

(require 'fill-column-indicator)

(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda ()
    (if (and
         (not (string-match "^\*.*\*$" (buffer-name)))
         (not (eq major-mode 'dired-mode)))
        (fci-mode 1))))
(global-fci-mode 1)


(defvar-local company-fci-mode-on-p nil)

(defun company-turn-off-fci (&rest ignore)
  (when (boundp 'fci-mode)
    (setq company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1))))

(defun company-maybe-turn-on-fci (&rest ignore)
  (when company-fci-mode-on-p (fci-mode 1)))

(add-hook 'company-completion-started-hook 'company-turn-off-fci)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)


;; (savehist-mode 1)
;; (add-to-list 'savehist-additional-variables 'kill-ring)

;; hideshow - code folding

(defun toggle-selective-display (column)
      (interactive "P")
      (set-selective-display
       (or column
           (unless selective-display
             (1+ (current-column))))))

(defun toggle-hiding (column)
      (interactive "P")
      (if hs-minor-mode
          (if (condition-case nil
                  (hs-toggle-hiding)
                (error t))
              (hs-show-all))
        (toggle-selective-display column)))

(load-library "hideshow")
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)


(add-hook 'clojure-mode-hook 'hs-minor-mode)

;;(set-default-font "iosevka 11 light")
;; (setq line-move-visual nil)
;; (setq-default auto-fill-function 'do-auto-fill)

;; haskell config
(add-hook 'haskell-mode-hook #'hindent-mode)
;; (add-hook 'haskell-mode-hook #'enable-paredit-mode)

(eval-after-load 'haskell-mode
          '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))

;; (define-key global-map (kbd "RET") 'newline-and-indent)
;; (add-hook 'haskell-mode-hook 'intero-mode)
;; (intero-global-mode 1)
(global-flycheck-mode)


(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))



(global-auto-revert-mode t)

(defun cider-namespace-refresh ()
  (interactive)
  (cider-interactive-eval
   "(require 'clojure.tools.namespace.repl)
  (clojure.tools.namespace.repl/refresh)"))

(add-hook 'cider-mode-hook
   '(lambda () (add-hook 'after-save-hook
    '(lambda ()
       (if (and (boundp 'cider-mode) cider-mode)
    (cider-namespace-refresh))))))

(define-key clojure-mode-map (kbd "C-c C-r") 'cider-namespace-refresh)

(setq-default line-spacing 0.2)


;; python settings

(elpy-enable)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; relative line number
(require 'linum-relative)
(linum-relative-mode)
(setq linum-relative-current-symbol "")
