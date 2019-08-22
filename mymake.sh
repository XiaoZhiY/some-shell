#! /bin/sh
# mymake

opt=1

# parse input

if [ $# -eq 0 ];then
   opt=1
elif [ $1 = "clean" ];then
   opt=2
else
   echo -e "\033[31musage:'basename $0' [clean]\033[0m"
   exit 1
fi


# mymake
if [ $opt = 1 ];then
    echo "execute 'mymake'"
    if [ ! -d "./build" ]; then
        echo -e "\033[31mMakefile doesn't exist.Please use 'mycmake' to generate makefile first!\033[0m"
        exit 1
    fi
    cd build
    make
    if [ $? -ne 0 ]; then
        echo -e "\033[31mmake failed!\033[0m"
        cd ..
        exit 1
    else
        echo "make succeed"
    fi

    cd ..
    if [ ! -d "./bin" ]; then
        mkdir bin
    fi
    mv build/*.exe bin/
    echo -e "\033[36mmymake done!\033[0m"
    exit 0
fi

# mymake clean
if [ $opt = 2 ];then
    echo "ececute 'mymake clean'"
    
    if [ -d "./build" ]; then
        cd build
	make clean
	if [ $? -ne 0 ]; then
            echo -e "\033[31mmake clean failed! Please check what happened\033[0m"
	    echo -e "\033[31mI guess you may change someting in ./build by yourself. \\(^&^)/ \033[0m"
        else
	    echo "make clean success!"
	fi
	cd ..
    fi

    if [ -d "./bin" ]; then
        rm -rf bin
	if [ $? -ne 0 ]; then
            echo -e "\033[31mremove executable file failed!\033[0m"
        else
	    echo "remove executable success!"
	fi
    fi
    echo -e "\033[36mmymake clean down!\033[0m"
fi



