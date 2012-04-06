
{-# LANGUAGE CPP, ForeignFunctionInterface #-}

module System.Hdfs.Interop.Wrapper where

import Foreign
import Foreign.C.Types
import Foreign.C.String

--TODO: import all foreign functions
#-- include <hdfs.h>