ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [DBF_IMPORT_Data], FILENAME = '$(Path2)$(DatabaseName)_Data.mdf', FILEGROWTH = 10 %) TO FILEGROUP [PRIMARY];

