ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [SME], FILENAME = 'D:\Data\SME.mdf', SIZE = 250112 KB, FILEGROWTH = 1024 KB) TO FILEGROUP [PRIMARY];

