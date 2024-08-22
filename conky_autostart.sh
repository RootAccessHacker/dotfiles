cat <<EOF > ~/.xsession
#!/bin/ksh

# Merge Xresources
xrdb -merge ~/.Xresources

# Start conky
conky &

# Start cwm
exec cwm
EOF
