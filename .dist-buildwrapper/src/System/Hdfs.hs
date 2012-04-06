-- the original desing of this module inspired by https://gist.github.com/2119955
-- TODO: further refactoring needed

module System.Hdfs where

import Data.ByteString (ByteString)
--import qualified Data.ByteString as B
import Data.Int
import Data.Vector (Vector)
import Data.Word
import Foreign.Ptr

type Size = Int32
type Time = () -- TODO
-- TODO: tOffset is sometimes used a size/length. Do we want a
-- separate type alias for that?
type Offset = Int64
type Port = Word16
data ObjectKind = File | Directory

-- Type aliases not present in C header file.
type Host = ByteString
type Path = ByteString

data FS = FS-- To prevent mixup of pointer in the implementation
newtype HdfsFileSystem = HdfsFileSystem (Ptr FS)

data HdfsFile = HdfsFile -- To prevent mixup of pointer in the implementation
newtype File = F (Ptr HdfsFile)

connectAsUser :: Maybe Host -> Port -> Maybe ByteString -> IO HdfsFileSystem
connectAsUser = undefined

connect :: Maybe Host -> Port -> IO HdfsFileSystem
connect = undefined
        
disconnect :: HdfsFileSystem -> IO ()
disconnect = undefined

-- TODO: What to do with short?
type Flags = () -- TODO
openFile :: HdfsFileSystem -> Path -> Flags -> Int -> Int -> Size -> IO File
openFile = undefined

closeFile :: HdfsFileSystem -> File -> IO ()
closeFile = undefined

exists :: HdfsFileSystem -> Path -> IO Bool
exists = undefined

seek :: HdfsFileSystem -> File -> Offset -> IO ()
seek = undefined

tell :: HdfsFileSystem -> File -> IO Offset
tell = undefined

read :: HdfsFileSystem -> File -> Size -> IO ByteString
read = undefined

-- Uses user supplied buffer.
readInto :: HdfsFileSystem -> File -> Ptr Word8 -> Size -> IO Size
readInto = undefined

pread :: HdfsFileSystem -> File -> Offset -> Size -> IO ByteString
pread = undefined

preadInto :: HdfsFileSystem -> File -> Offset -> Ptr Word8 -> Size -> IO Size
preadInto = undefined

write :: HdfsFileSystem -> File -> ByteString -> IO Size
write = undefined

flush :: HdfsFileSystem -> File -> IO ()
flush = undefined

hflush :: HdfsFileSystem -> File -> IO ()
hflush = undefined

available :: HdfsFileSystem -> File -> IO Int
available = undefined

copy :: HdfsFileSystem -> Path -> HdfsFileSystem -> Path -> IO ()
copy = undefined

move :: HdfsFileSystem -> Path -> HdfsFileSystem -> Path -> IO ()
move = undefined

delete :: HdfsFileSystem -> Path -> Bool -> IO ()
delete = undefined

rename :: HdfsFileSystem -> Path -> Path -> IO ()
rename = undefined

getWorkingDirectory :: HdfsFileSystem -> IO Path
getWorkingDirectory = undefined

setWorkingDirectory :: HdfsFileSystem -> Path -> IO ()
setWorkingDirectory = undefined

createDirectory :: HdfsFileSystem -> Path -> IO ()
createDirectory = undefined

setReplication :: HdfsFileSystem -> Path -> Int16 -> IO ()
setReplication = undefined

data FileInfo = FileInfo
    { kind :: ObjectKind
    , name :: Path
    , lastMod :: Time
    , size :: Offset
    , replication :: Int -- TODO: What to do with short?
    , blockSize :: Offset
    , owner :: ByteString
    , group :: ByteString
    , permissions :: Int -- TODO: What to do with short?
    , lastAccess :: Time
    }

listDirectory :: HdfsFileSystem -> Path -> IO (Vector FileInfo)
listDirectory = undefined

getPathInfo :: HdfsFileSystem -> Path -> IO FileInfo
getPathInfo = undefined

-- TODO: What's the correct return type here?
getHosts :: HdfsFileSystem -> Path -> Offset -> Offset -> IO (Vector ByteString)
getHosts = undefined

getDefaultBlockSize :: HdfsFileSystem -> IO Offset
getDefaultBlockSize = undefined

getCapacity :: HdfsFileSystem -> IO Offset
getCapacity = undefined

getUsed :: HdfsFileSystem -> IO Offset
getUsed = undefined

chown :: HdfsFileSystem -> Path -> ByteString -> ByteString -> IO ()
chown = undefined

type Mode = () -- TODO
chmod :: HdfsFileSystem -> Path -> Mode -> IO ()
chmod = undefined

utime :: HdfsFileSystem -> Path -> Time -> Time -> IO ()
utime = undefined