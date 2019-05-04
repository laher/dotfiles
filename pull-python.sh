pip3 install $(cat ./packages/python3-packages.txt| tr "\n" " ")
pip2 install $(cat ./packages/python2-packages.txt| tr "\n" " ")
