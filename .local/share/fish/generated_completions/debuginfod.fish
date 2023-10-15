# debuginfod
# Autogenerated from man page /usr/share/man/man8/debuginfod.8.gz
complete -c debuginfod -s F -d 'Activate ELF/DWARF file scanning.   The default is off'
complete -c debuginfod -s Z -s Z -d 'Activate an additional pattern in archive scanning'
complete -c debuginfod -s R -d 'Activate RPM patterns in archive scanning.   The default is off'
complete -c debuginfod -s U -d 'Activate DEB/DDEB patterns in archive scanning.   The default is off'
complete -c debuginfod -s d -l database -d 'Set the path of the sqlite database used to store the index'
complete -c debuginfod -l passive -d 'Set the server to passive mode, where it only services webapi requests, inclu…'
complete -c debuginfod -s D -l ddl -d 'Execute given sqlite statement after the database is opened and initialized a…'
complete -c debuginfod -s p -l port -d 'Set the TCP port number (0 < NUM < 65536) on which debuginfod should listen, …'
complete -c debuginfod -s I -l include -s X -l exclude -d 'Govern the inclusion and exclusion of file names under the search paths'
complete -c debuginfod -s t -l rescan-time -d 'Set the rescan time for the file and archive directories'
complete -c debuginfod -s r -d 'Apply the -I and -X during groom cycles, so that files excluded by the regexe…'
complete -c debuginfod -s g -l groom-time -d 'Set the groom time for the index database'
complete -c debuginfod -s G -d 'Run an extraordinary maximal-grooming pass at debuginfod startup'
complete -c debuginfod -s c -l concurrency -d 'Set the concurrency limit for the scanning queue threads, which work together…'
complete -c debuginfod -s C -s C -l connection-pool -l connection-pool -d 'Set the size of the pool of threads serving webapi queries'
complete -c debuginfod -s L -d 'Traverse symbolic links encountered during traversal of the PATHs, including …'
complete -c debuginfod -l fdcache-fds -l fdcache-mbs -d 'Configure limits on a cache that keeps recently extracted files from archives'
complete -c debuginfod -l fdcache-prefetch-fds -l fdcache-prefetch-mbs -d '"--fdcache-prefetch=NUM2"  In addition to the main fdcache, up to NUM2 other …'
complete -c debuginfod -l fdcache-mintmp -d 'Configure a disk space threshold for emergency flushing of the caches'
complete -c debuginfod -l forwarded-ttl-limit -d 'Configure limits of X-Forwarded-For hops'
complete -c debuginfod -l disable-source-scan -d 'Disable scan of the dwarf source info of debuginfo sections'
complete -c debuginfod -l fdcache-prefetch
complete -c debuginfod -s v -d 'Increase verbosity of logging to the standard error file descriptor'

