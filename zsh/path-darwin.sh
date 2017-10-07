# Form the $PATH for Darwin

# The usual suspects
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

# Git
export PATH=/usr/local/git/bin:$PATH

# Composer global vendors (homestead, phpunit, etc)
export PATH=$HOME/.composer/vendor/bin:$PATH

# PHP 5.6 (from http://php-osx.liip.ch/)
export PATH=/usr/local/php5/bin:$PATH

# Go
export PATH=/usr/local/go/bin:$PATH

# Maven (mvn)
export PATH=/usr/local/apache-maven-3.3.3/bin:$PATH

# Leiningen (lein)
export PATH=/Applications/clojure:$PATH

# LaTeX
export PATH=/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH

# Supercollider (scsnyth)
export PATH=/Applications/SuperCollider/SuperCollider.app/Contents/Resources:$PATH

# VS Code (code)
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH