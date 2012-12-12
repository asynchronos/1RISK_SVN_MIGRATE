ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [BAY01_log], FILENAME = '$(Path1)$(DatabaseName)_1.ldf', FILEGROWTH = 10 %);

