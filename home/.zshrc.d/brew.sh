
if [ -x /usr/local/bin/brew ]; then
#   HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
   if [ -f "$HB_CNF_HANDLER" ]; then
#   source "$HB_CNF_HANDLER";
   fi
fi
