build:
	cabal --extra-include-dirs=$(HADOOP_HOME)/src/c++/libhdfs --extra-lib-dirs=$(HADOOP_HOME)/src/c++/install/lib install

build-local:
	cabal --extra-include-dirs=$(LIBHDFS)/native/include --extra-lib-dirs=$(LIBHDFS)/native/lib install

hsc2hs:
	hsc2hs src/System/Hdfs/Interop/Wrapper.hsc -I $(HADOOP_HOME)/src/c++/libhdfs
