echo "
this script will change your layout.

to restore config (to us keyboard for example), type 'setxkbmap us' 

hint: to avoid being stuck afterwards because you don't know the layout, run : 
'setxkbmap us'. If you're using a us layout, this will do nothing.
However, you can just type the up-arrow key to get this line again.

Do you want to continue ?"
read -p "$* [y/n]: " answer
[[ "$answer" == [Yy]* ]] && xkbcomp beprog_conf $DISPLAY && echo "new keyboard is set !" 

