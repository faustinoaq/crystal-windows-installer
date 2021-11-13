@echo off
set v_params=%*
set v_params=%v_params:"=\"%
bash.exe -c "CRYSTAL_PATH=\"%CRYSTAL_PATH%\" shards %v_params%"
