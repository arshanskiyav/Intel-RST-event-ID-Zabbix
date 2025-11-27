# Intel RST event ID Zabbix
Intel Rapid havn't cli. The mail function is very outdated and doesn't work with modern services.

So this zabbix template just check event ID of IAStorDataMgrSvc in Windows Logs and state IAStorDataMgrSvc:
- 7209   - Check and repair in progress, middle  trigger level
- 7223   - Check and repair finished, low  trigger level
- 7303   - Statrt service IAStorDataMgrSvc (ignore)
- 0      - Start journal services (ignore)
- other  - Other state, high trigger level

This solution checks without dividing into arrays.
