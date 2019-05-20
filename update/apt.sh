sudo apt install $(cat ./packages/apt-packages.txt |grep -v -f ./packages/apt-exclude.txt | tr "\n" ' ')
