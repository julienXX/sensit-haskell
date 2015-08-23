module Paths_sensit_haskell (
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
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/julien/Code/sensit-haskell/.stack-work/install/x86_64-osx/lts-3.1/7.10.2/bin"
libdir     = "/Users/julien/Code/sensit-haskell/.stack-work/install/x86_64-osx/lts-3.1/7.10.2/lib/x86_64-osx-ghc-7.10.2/sensit-haskell-0.1.0.0-CXFJe1OHlh51DcmAAC7dCk"
datadir    = "/Users/julien/Code/sensit-haskell/.stack-work/install/x86_64-osx/lts-3.1/7.10.2/share/x86_64-osx-ghc-7.10.2/sensit-haskell-0.1.0.0"
libexecdir = "/Users/julien/.cabal/libexec"
sysconfdir = "/Users/julien/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "sensit_haskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "sensit_haskell_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "sensit_haskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "sensit_haskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "sensit_haskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
