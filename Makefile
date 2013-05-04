build:
	cabal install --extra-include-dirs=$HADOOP_HOME/build/c++/Mac_OS_X-x86_64-64/include --extra-lib-dirs=$HADOOP_HOME/build/c++/Mac_OS_X-x86_64-64/lib

hsc2hs:
	hsc2hs src/System/Hdfs/Interop/Wrapper.hsc -I $(HADOOP_HOME)/src/c++/libhdfs