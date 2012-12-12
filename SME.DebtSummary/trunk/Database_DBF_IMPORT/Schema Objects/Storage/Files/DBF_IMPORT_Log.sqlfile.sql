ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [DBF_IMPORT_Log], FILENAME = '$(Path1)$(DatabaseName)_log.LDF', FILEGROWTH = 10 %);

