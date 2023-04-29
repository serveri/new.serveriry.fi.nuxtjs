@echo off
REM Set env var
set PLAYBOOK=%1
REM Run playbook
vagrant provision
REM Unset env var
set PLAYBOOK=
