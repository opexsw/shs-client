@ECHO OFF
START /B C:\serf\serf.exe agent -config-file=C:\\serf\\serf_config.json >> C:\serf\serf_log.log
EXIT /B
