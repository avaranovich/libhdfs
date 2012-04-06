module Paths_libhdfs (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,1], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/andrei/.cabal/bin"
libdir     = "/home/andrei/.cabal/lib/libhdfs-0.1/ghc-7.0.3"
datadir    = "/home/andrei/.cabal/share/libhdfs-0.1"
libexecdir = "/home/andrei/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "libhdfs_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "libhdfs_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "libhdfs_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "libhdfs_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
