{-# LANGUAGE CPP, ForeignFunctionInterface #-}

module System.Hdfs.Interop.Wrapper where

import Foreign
import Foreign.C.Types
import Foreign.C.String

#include <hdfs.h>

data HDFSFs = HDFSFs
type HDFSFsPtr = Ptr HDFSFs

data HDFSFile = HDFSFile
type HDFSFilePtr = Ptr HDFSFile

type HDFSHost = CString
type HDFSPort = CUShort

foreign import ccall unsafe "hdfs.h hdfsConnect"
  c_hdfs_connect :: HDFSHost -> HDFSPort -> IO HDFSFsPtr