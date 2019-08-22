#! /bin/sh
# mycmake


OPT_DEFAULT="build" 

# parse input
if [ -n "$1" ]; then
    opt=$1
    if [ $opt != "clean" ] && [ $opt != "build" ];then
	echo -e "\033[31musage:'basename $0' [build/clean]\033[0m"
        exit 1    
    fi
else
    opt=$OPT_DEFAULT
fi

echo "execute 'mycmake $opt'"

# mycmake build
if [ $opt == "build" ];then
    
    if [ ! -d "./build" ]; then
        mkdir build
    fi
    cd build
    cmake -G "Unix Makefiles" ../
    if [ $? -ne 0 ]; then
        echo -e "\033[31mmycmake build failed\033[0m"
        cd .. && rm -rf build
        exit 1
    else
        echo -e "\033[36mmycmake build succeed\033[0m"
    fi
    cd ..
    exit 0
fi


# mycmake clean
if [ $opt == "clean" ];then
    if [ ! -d "./build" ]; then
        echo "Folder:build has already been deleted"
    else
        rm -rf build
        echo -e "\033[36mmycmake clean done!\033[0m"
    fi
    exit 0
fi


