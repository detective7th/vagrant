USER_NAME=vagrant
HOME_PATH=/home/${USER_NAME}
GITLAB_USER=detective7th
GITLAB_PWD=14121412
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get install -y vim \
                        gdb \
                        scons \
                        cmake \
                        git \
                        htop \
                        libevent-dev \
                        libnanomsg-dev \
                        libtbb-dev \
                        libdouble-conversion-dev \
                        libgoogle-glog-dev \
                        libgflags-dev \
                        libboost-all-dev \
                        libwebsocketpp-dev \
                        liblz4-dev \
                        libsnappy-dev \
                        automake \
                        autoconf \
                        autoconf-archive \
                        libtool \
                        liblzma-dev \
                        make \
                        zlib1g-dev \
                        binutils-dev \
                        libjemalloc-dev \
                        libssl-dev \
                        pkg-config \
                        libunwind8-dev \
                        libelf-dev \
                        libdwarf-dev \
                        libiberty-dev \
                        curl \
                        libcurl4-openssl-dev \
                        lua5.2 \
                        global \
                        liblua5.2 \
                        python-pip \
                        python3-pip \
                        libzookeeper-mt-dev \
                        gperf
sudo pip install pathlib toml
sudo pip3 install pathlib
sudo ln -s /usr/include/lua5.2 /usr/include/lua
cd ${HOME_PATH}/workspace && rm -rf ./* && rm -rf ./.gtags
mkdir -p ${HOME_PATH}/workspace/.gtags \
    && cd ${HOME_PATH}/workspace/.gtags \
    && ln -s /usr/local/include usr-local-include \
    && ln -s /usr/include/ usr-include && gtags -c
#cd ${HOME_PATH}/workspace && git clone http://${GITLAB_USER}:${GITLAB_PWD}@10.199.101.162/hq/market_data.git
#cd ${HOME_PATH}/workspace/market_data && git checkout -b submodule-b origin/level2-submodule-gitlab
#cd ${HOME_PATH}/workspace/market_data && git submodule update --init --recursive
#cd ${HOME_PATH}/workspace && git clone http://${GITLAB_USER}:${GITLAB_PWD}@10.199.101.162/hq/cord.git
#cd ${HOME_PATH}/workspace/cord && git submodule update --init --recursive
cd ${HOME_PATH}/workspace && git clone https://github.com/detective7th/gitconfig
cd ${HOME_PATH}/workspace/gitconfig && sed -i "s/\/home\/kid/\/home\/${USERNAME}/g" .gitconfig \
    && cp .gitconfig ${HOME_PATH} \
    && cp .gitignore ${HOME_PATH}
cd ${HOME_PATH}/workspace && git clone https://github.com/detective7th/3rd.git
cd ${HOME_PATH}/workspace/3rd && git submodule update --init --recursive
cd ${HOME_PATH}/workspace/3rd/mFast && git submodule update --init --recursive
cd ${HOME_PATH}/workspace/3rd/mFast && mkdir build && cd build \
    && cmake .. -DBUILD_SHARED_LIBS=ON -DBUILD_TESTS=OFF \
    && make -j4 && sudo make install && sudo ldconfig
cd ${HOME_PATH}/workspace/3rd/googletest/ && mkdir build && cd build && cmake .. -DBUILD_SHARED_LIBS=ON \
    && make -j4 && sudo make install && sudo ldconfig
cd ${HOME_PATH}/workspace/3rd/g3log && mkdir build && cd build \
    && cmake .. -DUSE_DYNAMIC_LOGGING_LEVELS=ON \
	     -DCHANGE_G3LOG_DEBUG_TO_DBUG=ON \
	     -DADD_FATAL_EXAMPLE=OFF \
	     -DBUILD_SHARED_LIBS=ON \
    && make -j4 && sudo make install && sudo ldconfig
cd ${HOME_PATH}/workspace/3rd/folly/folly \
    && autoreconf -ivf && ./configure && make -j4 && sudo make install
sudo ln -s /usr/local/include/folly/synchronization/RWSpinLock.h /usr/local/include/folly/RWSpinLock.h
sudo ln -s /usr/local/include/folly/system/MemoryMapping.h /usr/local/include/folly/MemoryMapping.h
cd ${HOME_PATH}/workspace/3rd/wangle/wangle && mkdir build && cd build && cmake .. -DBUILD_SHARED_LIBS=ON \
    && make -j4 && sudo make install && sudo ldconfig
cd ${HOME_PATH}/workspace/3rd/proxygen/proxygen \
    && autoreconf -ivf && ./configure && make -j4 && sudo make install && sudo ldconfig
cd ${HOME_PATH}/workspace/3rd/protobuf/ \
    && ./autogen.sh && ./configure && make && make -j4 && sudo make install && sudo ldconfig
cd ${HOME_PATH}/workspace/3rd/LuaBridge/Source && sudo cp -r LuaBridge /usr/local/include
cd ${HOME_PATH}/workspace/3rd/cpptoml && mkdir build && cd build && cmake .. \
    && make -j4 && sudo make install && sudo ldconfig
cd ${HOME_PATH}/workspace/3rd/jsoncpp && mkdir build && cd build && cmake .. \
    && make -j4 && sudo make install && sudo ldconfig
#cd ${HOME_PATH}/workspace/cord && scons -j4 config_file_force_update=1
