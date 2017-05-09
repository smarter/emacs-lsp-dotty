# lsp-dotty

Emacs integration for Dotty, the experimental Scala compiler, using [lsp-mode](https://github.com/emacs-lsp/lsp-mode).

This is very experimental.

## Installation

### Install the Dotty Language Server
Until the language server is merged into dotty, the following steps are required:

#### Build the `ide-support` branch of Dotty

```shell
git clone --recursive http://github.com/lampepfl/dotty
git remote add staging http://github.com/dotty-staging/dotty
git fetch staging
git checkout ide-support
sbt ";sbt-dotty/publishLocal;dotty-bootstrapped/publishLocal"
```

#### Use Dotty in your own project

Follow https://github.com/lampepfl/dotty-example-project, but use the version of Dotty you built:
```scala
scalaVersion := "0.1.1-bin-SNAPSHOT"
```
and the version of sbt-dotty you built:

```scala
addSbtPlugin("ch.epfl.lamp" % "sbt-dotty" % "0.1.0-RC4-SNAPSHOT")
```

### Run this in your project everytime before starting lsp-mode
```shell
sbt ;configureIDE;~compileForIDE
```

### Install and configure the Emacs support


- Install and configure [lsp-mode](https://github.com/emacs-lsp/lsp-mode)
- Install scala-mode from MELPA
- Clone this repo and add the following to your config:

```emacs-lisp
(add-to-list 'load-path "<path to emacs-lsp-dotty>")
(require 'lsp-dotty)

(add-hook 'scala-mode-hook '(lambda ()
  (setq-local flycheck-disabled-checkers '(scala))
  (lsp-mode)
  (flycheck-mode)
))

```
