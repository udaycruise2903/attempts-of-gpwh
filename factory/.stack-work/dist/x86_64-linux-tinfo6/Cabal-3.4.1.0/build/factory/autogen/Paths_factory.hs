{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_factory (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/neo/Documents/github/attempts-of-gpwh/factory/.stack-work/install/x86_64-linux-tinfo6/09cee165cba2ecdd3ed9a89b6a5bed91b3deb163897c7c797c01bb3f0f4c2c3b/9.0.2/bin"
libdir     = "/home/neo/Documents/github/attempts-of-gpwh/factory/.stack-work/install/x86_64-linux-tinfo6/09cee165cba2ecdd3ed9a89b6a5bed91b3deb163897c7c797c01bb3f0f4c2c3b/9.0.2/lib/x86_64-linux-ghc-9.0.2/factory-0.1.0.0-GPiqpM2zoZhDIiwRe4qD2d-factory"
dynlibdir  = "/home/neo/Documents/github/attempts-of-gpwh/factory/.stack-work/install/x86_64-linux-tinfo6/09cee165cba2ecdd3ed9a89b6a5bed91b3deb163897c7c797c01bb3f0f4c2c3b/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/neo/Documents/github/attempts-of-gpwh/factory/.stack-work/install/x86_64-linux-tinfo6/09cee165cba2ecdd3ed9a89b6a5bed91b3deb163897c7c797c01bb3f0f4c2c3b/9.0.2/share/x86_64-linux-ghc-9.0.2/factory-0.1.0.0"
libexecdir = "/home/neo/Documents/github/attempts-of-gpwh/factory/.stack-work/install/x86_64-linux-tinfo6/09cee165cba2ecdd3ed9a89b6a5bed91b3deb163897c7c797c01bb3f0f4c2c3b/9.0.2/libexec/x86_64-linux-ghc-9.0.2/factory-0.1.0.0"
sysconfdir = "/home/neo/Documents/github/attempts-of-gpwh/factory/.stack-work/install/x86_64-linux-tinfo6/09cee165cba2ecdd3ed9a89b6a5bed91b3deb163897c7c797c01bb3f0f4c2c3b/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "factory_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "factory_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "factory_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "factory_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "factory_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "factory_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
