sudo apt install $(cat ./packages/apt-packages.txt |grep -v -x -F -f ./packages/apt-exclude.txt | tr "\n" ' ')
