CMD="bin/rails s -e production -b 'ssl://0.0.0.0:3000?key=private/cert/www_chocorp_net.key&cert=private/cert/www_chocorp_net.full.crt'"
SESSION="chocorp"

tmux new-session -s $SESSION "$CMD"
