module Paths_schemeinterpreter (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/seb/.cabal/bin"
libdir     = "/home/seb/.cabal/lib/x86_64-linux-ghc-7.10.2/schemeinterpreter-1.0-JwbuktLk9MQ9HLV1DyZTEq"
datadir    = "/home/seb/.cabal/share/x86_64-linux-ghc-7.10.2/schemeinterpreter-1.0"
libexecdir = "/home/seb/.cabal/libexec"
sysconfdir = "/home/seb/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "schemeinterpreter_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "schemeinterpreter_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "schemeinterpreter_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "schemeinterpreter_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "schemeinterpreter_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
