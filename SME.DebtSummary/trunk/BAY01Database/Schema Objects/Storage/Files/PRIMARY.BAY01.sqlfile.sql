ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [BAY01], FILENAME = '$(Path2)$(DatabaseName).mdf', FILEGROWTH = 1024 KB) TO FILEGROUP [PRIMARY];

