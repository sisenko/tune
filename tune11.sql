-- Compound script for regular DB monitoring
-- Development and improvement since Oracle version 7
-- SIS aka DES
define HEAD='Tune 11 version from 11.10.2012';

-- 11.10.2012 - Altered sessions aggregated report
-- 10.10.2012 - Bug 14078947 "SELECT FROM V$RMAN_STATUS VERY SLOW" correction
-- 17.09.2012 - Proxy users summary
-- 12.09.2012 - Enabled tracing
-- 28.08.2012 - DBA_AUTOTASK_JOB_HISTORY last calls
-- 06.06.2012 - Audit section improvement
-- 05.06.2012 - Network Access Control List
-- 05.06.2012 - Suppress non-english session NLS settings
-- 29.05.2012 - Format mask correction
-- 08.02.2012 - Invisible indexes
-- 19.01.2012 - OS credentials for scheduler
-- 30.11.2011 - Wrong ownerships select corrections, based on SR 3-4681320721: Ownership is not equal to user
-- 16.11.2011 - Correct AUD$ columns (DB upgrade side-effect)
-- 31.08.2011 - Detailed report about TEMP TBS usage
-- 03.05.2011 - Format mask corrections
-- 26.04.2011 - CPU count history
-- 05.04.2011 - Format mask corrections
-- 21.01.2011 - Patch history
-- 23.12.2010 - Redo log switches per instance (RAC mode)
-- 14.12.2010 - Flashback DB improvement
-- 06.12.2010 - Format corrections
-- 03.12.2010 - UNDOSTAT independent of restarts (AWR, EE)
-- 07.07.2010 - Scheduler logs
-- 14.05.2010 - UNDOSTAT for RAC configuration
-- 09.04.2010 - Flash recovery area usage and limits
-- 09.04.2010 - Oldest available flashback SCN/time
-- 17.12.2009 - Hostname correction
-- 08.12.2009 - System level triggers correction
-- 23.09.2009 - Bigfiles indication
-- 02.09.2009 - Ver 11 Rel 2 production support
-- 20.08.2009 - DBA_AUTOTASK_WINDOW_CLIENTS status correction
-- 15.07.2009 - PGA usage distribution
-- 25.06.2009 - Session cached cursor usage corr. against NULL value (Ver 11)
-- 23.06.2009 - Session cached cursor usage corr. SR #7529530.993, #21807140.6
-- 23.06.2009 - Max Query Length correction, SR #7458023.994
-- 15.06.2009 - OS statistics
-- 04.06.2009 - AWR policy
-- 20.05.2009 - Hostname correction
-- 28.04.2009 - Audit section (almost default since 11g by DBCA)
-- 14.04.2009 - Unused columns correction, SR #7511715.992
-- 09.04.2009 - Fixed tables statistics
-- 07.04.2009 - init.ora parameters improvement
-- 03.04.2009 - open cursors correction, SR #20995098.6
-- 19.03.2009 - Backup pieces encrypted or not
-- 19.03.2009 - Securefiles
-- 19.03.2009 - Wallet with PKI 
-- 19.03.2009 - Compressed tablespaces
-- 19.03.2009 - Compressed tables
-- 18.03.2009 - Tables with encrypted columns
-- 16.03.2009 - Hostname in spool filename
-- 12.03.2009 - Script version header
-- 12.03.2009 - EDITIONS section
-- 05.03.2009 - Hidden columns improvement
-- 25.02.2009 - RMAN encryption algorithm improvement
-- 16.02.2009 - Connection pooling
-- 12.02.2009 - RMAN compression correction
-- 12.02.2009 - == Begin 11g Rel 2 support ==
-- 05.02.2009 - Default tablespaces
-- 28.01.2009 - SQL management base (SMB) section improvement
-- 23.01.2009 - Possible tablespace reclaiming
-- 20.01.2009 - Restore points (DB flashback)
-- 15.01.2009 - Extension statistics
-- 15.01.2009 - DB failures
-- 15.01.2009 - ADDM findings
-- 13.01.2009 - Baselines condition
-- 05.01.2009 - Filesystem I/O statistics
-- 05.01.2009 - Automatic maintenance tasks improvement
-- 24.12.2008 - LIST OF OBJECTS HAVING > 40(!) EXTENTS changes
-- 24.12.2008 - Statistics accuracy improvement
-- 15.12.2008 - System level triggers
-- 16.10.2008 - Datafiles need media recovery
-- 20.08.2008 - SQL management base parameters
-- 19.08.2008 - Automatic maintenance tasks
-- 19.08.2008 - Resource manager consumer groups improvement
-- 03.06.2008 - Pending collected statistics
-- 03.06.2008 - Publishing collected statistics
-- 28.05.2008 - Archivelog Destination improvements
-- 28.05.2008 - Flashback Data Archives
-- 27.05.2008 - RMAN encryption algorithm
-- 27.05.2008 - RMAN compression algorithm
-- 02.05.2008 - RMAN_STATUS correction
-- 28.04.2008 - Remove SGA target advice, last 10 SGA pool changes (duplicates)
-- 28.04.2008 - Last 10 memory changes
-- 28.04.2008 - Dynamic memory components
-- 28.04.2008 - Memory target advice
-- 14.04.2008 - MTTR correction (RAC)
-- 11.04.2008 - SGA TARGET ADVICE
-- 11.04.2008 - Last 10 changes in SGA pool sizes
-- 09.04.2008 - Free memory in SGA pools
-- 09.04.2008 - SGA_DYNAMIC_COMPONENTS improvement
-- 01.04.2008 - Standby redo logs
-- 05.03.2008 - Last 10 outstanding alerts
-- 18.02.2008 - Disabled or not validated user constraints
-- 13.11.2007 - Online Redo Logs improvement (RAC mode)
-- 12.11.2007 - Statistics history availability
-- 07.11.2007 - ASM section improvements
-- 25.10.2007 - Commits/Rollbacks ratio (RAC)
-- 19.10.2007 - ASM section
-- 04.09.2007 - Health Check Monitor section
-- 03.09.2007 - Automatic Diagnostic Repository (ADR) condition
-- 31.08.2007 - Types of used passwords (10g, 11g)
-- 31.08.2007 - Direct NFS Client
-- 14.08.2007 - Archivelog Compress Mode
-- 14.08.2007 - DBA users with default password
-- 14.08.2007 - == Begin 11g support ==
-- 10.05.2007 - Flashback DB improvement
-- 05.04.2007 - Defined SQL Profiles section
-- 26.03.2007 - Archivelog dest improvement
-- 07.03.2007 - Last 10 PL/SQL errors section
-- 02.03.2007 - FREELIST section removed - obsolete
-- 02.03.2007 - Hidden/unused columns section
-- 01.03.2007 - LOCK_HIT_RATIO section removed - obsolete
-- 01.03.2007 - RMAN Configuration section
-- 01.03.2007 - Report file japanize format mask
-- 13.02.2007 - Large pool size usage section
-- 02.02.2007 - Last 10 RMAN problems section
-- 25.01.2007 - Unusable partitioned indexes
-- 12.01.2007 - Resource Manager sections
-- 30.10.2006 - Block corruption improvement
-- 16.08.2006 - RECYCLE BUFFER CACHE statistic
-- 02.08.2006 - Shared server configuration improvement
-- 31.07.2006 - Block corruption improvement
-- 27.07.2006 - Native compilation improvement
-- 12.07.2006 - Events for shared server
-- 11.07.2006 - DB CPU usage improvement
-- 23.06.2006 - UNDO TBS Protection Mode
-- 22.06.2006 - Shared server configuration improvement
-- 13.06.2006 - Shared server configuration
-- 12.06.2006 - Flashback database
-- 12.06.2006 - KEEP BUFFER CACHE statistic
-- 07.06.2006 - SORT_AREA_SIZE addition
-- 07.06.2006 - Java pool size advisor
-- 06.06.2006 - List of directories
-- 06.06.2006 - Redo Log file size advizor
-- 30.05.2006 - Shared server section correction
-- 28.03.2006 - MTTR estimation
-- 13.03.2006 - Locked statistisc objects
-- 09.03.2006 - Last 10 changed objects
-- 06.03.2006 - Recycle Bin content and size
-- 28.02.2006 - Mode of PL/SQL compilation of proc. objects
-- 27.02.2006 - DB CPU usage added
-- 24.02.2006 - Archive log activity
-- 21.02.2006 - Archived Redo Log section
-- 21.02.2006 - Undo Tablespace Retention Mode
-- 21.02.2006 - Block Change Tracking efficiency
-- 21.02.2006 - Block Change Tracking mode, filename and size
-- 21.02.2006 - Time Model statistic table
-- 21.02.2006 - Histogram section
-- 21.02.2006 - Scheduler Jobs list
-- 20.02.2006 - == End of ver 9 support ==
-- 20.02.2006 - Hard/Soft parses ratio calculation correction
-- 20.02.2006 - Expand I/O format mask
-- 14.02.2006 - Max Tran Length calculation correction
-- 02.02.2006 - Temporary Tablespace usage summary
-- 01.02.2006 - HINT correction long select from DBA_EXTENTS
-- 17.01.2006 - DB GLOBAL NAME added
-- 04.01.2006 - OBJECT name clashes with SCHEMA name, Bug:2894111
-- 02.01.2006 - Change format mask for UNRECOVERABLE_CHANGE
-- 02.01.2006 - Change format mask for NEXT EXTENT errors
-- 23.12.2005 - Add online redo logs section
-- 20.12.2005 - Remove TABLESPACE FRAGMENTATION section - obsolete, senselessly
-- 20.12.2005 - LIST OF OBJECTS HAVING > 20(!) EXTENTS changes - DBs are more bigger now
-- 19.12.2005 - HINT correction very long select from DBA_JOBS_RUNNING, DBA_RESUMABLE
--              (Bug #3402490, Note 240058.1)
-- 
-- At last after 6 years development I began to support a change history ;-)

set echo off
set heading on
set verify on
set term on
set serveroutput on size 1000000
set wrap off
set linesize 250
set pagesize 1000
set trims on
/**********************************************************************/
/**************** CREATE PACKAGE PROCEDURE ****************************/
/**********************************************************************/
create or replace package TUNE as
        procedure lib;
        procedure rrow;
        procedure buffer;
        procedure sort_area;
        procedure redo;
        procedure free_list;
        procedure parameter(p_in in char,result out char);
	procedure opq;
end;
/
/***********************************************************************/
/************** CREATE PACKAGE BODY ************************************/
/***********************************************************************/
create or replace package body  TUNE as

h_char          varchar2(100);
h_num1  number;
h_num2  number;
h_num3  number;
h_num4  number;
h_num5  number;
h_num6  number;
result1     varchar2(50);
result2     varchar2(50);

------------------------------------------------------------------------
procedure lib is
h_char2 varchar2(50);
cursor c1 is
        select lpad(namespace,17)||': gets(pins)='||rpad(to_char(pins),12)||
                                     ' misses(reloads)='||rpad(to_char(reloads),7)||
               ' Ratio='||decode(reloads,0,0,to_char((reloads/pins)*100,999.999))||'%'
        from sys.v_$librarycache;
begin
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.                      SHARED POOL: LIBRARY CACHE (V$LIBRARYCACHE)');
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.');
        dbms_output.put_line('.         Goal: The library cache ratio < 1%' );
          dbms_output.put_line('.');
          PARAMETER('SHARED_POOL_SIZE', result1);
        PARAMETER('OPEN_CURSORS',result2);
        dbms_output.put_line('Recommendation: Increase SHARED_POOL_SIZE '||rtrim(result1));
        dbms_output.put_line('.                        OPEN_CURSORS '    ||rtrim(result2));
        dbms_output.put_line('.               Also write identical sql statements.');
          dbms_output.put_line('.');

          open c1;
        loop
            fetch c1 into h_char;
            exit when c1%notfound;

            dbms_output.put_line('.'||h_char);
        end loop;
          close c1;

          dbms_output.put_line('.');

        select lpad('Total',17)||': gets(pins)='||rpad(to_char(sum(pins)),15)||
                                 ' misses(reloads)='||rpad(sum(reloads),15),
               ' Your library cache ratio is '||
                decode(sum(reloads),0,0,to_char((sum(reloads)/sum(pins))*100,999.999))||'%'
        into h_char,h_char2
        from sys.v_$librarycache;

        dbms_output.put_line('.'||h_char);
        dbms_output.put_line('.           ..............................................');
        dbms_output.put_line('.           '||h_char2);

end;

------------------------------------------------------------------
procedure rrow is

begin
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.                      SHARED POOL: DATA DICTIONARY (V$ROWCACHE)');
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.');
        dbms_output.put_line('.         Goal: The row cache ratio should be < 10% or 15%' );
          dbms_output.put_line('.');
          PARAMETER('SHARED_POOL_SIZE',result1);
        dbms_output.put_line('Recommendation: Increase SHARED_POOL_SIZE '||result1);
        dbms_output.put_line('.');

          select sum(gets) "gets", sum(getmisses) "misses", round((sum(getmisses)/sum(gets))*100 ,3)
        into h_num1,h_num2,h_num3
        from sys.v_$rowcache;

        dbms_output.put_line('.');
        dbms_output.put_line('.             Gets sum: '||h_num1);
        dbms_output.put_line('.        Getmisses sum: '||h_num2);

        dbms_output.put_line('.......................................');
        dbms_output.put_line('Your row cache ratio is '||h_num3||'%');

end;
--------------------------------------------------------------------------

procedure buffer is
begin

        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.                      BUFFER CACHE (V$SYSSTAT)');
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.');
        dbms_output.put_line('.         Goal: The buffer cache ratio should be > 70% ');
        dbms_output.put_line('.');
          PARAMETER('DB_BLOCK_BUFFERS',result1);
          dbms_output.put_line('Recommendation: Increase DB_BLOCK_BUFFERS '||result1);
          PARAMETER('DB_CACHE_SIZE',result1);
          dbms_output.put_line('Recommendation: Increase DB_CACHE_SIZE    '||result1);
        dbms_output.put_line('.');

          select lpad(name,27)  ,value
        into h_char,h_num1
          from sys.v_$sysstat
          where name ='physical reads';
          dbms_output.put_line('.         '||h_char||': '||h_num1);

          select lpad(name,27)  ,value
          into h_char,h_num2
          from sys.v_$sysstat
          where name ='physical reads direct';
          dbms_output.put_line('.         '||h_char||': '||h_num2);

          select lpad(name,27)  ,value
          into h_char,h_num3
          from sys.v_$sysstat
          where name ='physical reads direct (lob)';
          dbms_output.put_line('.         '||h_char||': '||h_num3);

          select lpad(name,27)  ,value
          into h_char,h_num4
          from sys.v_$sysstat
          where name ='session logical reads';
          dbms_output.put_line('.         '||h_char||': '||h_num4);

          h_num4:=round(((1-(h_num1-h_num2-h_num3)/(h_num4)))*100,3);

        dbms_output.put_line('.......................................');
          dbms_output.put_line('Your buffer cache ratio is '||h_num4||'%');
end;

-------------------------------------------------------------------------
procedure sort_area is
cursor c2 is
        select name,value
        from sys.v_$sysstat
        where name in ('sorts (memory)','sorts (disk)')
        order by 1 desc;
begin
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.                      SORT STATUS (V$SYSSTAT)');
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.');
        dbms_output.put_line('.         Goal: Very low sort (disk)' );
          dbms_output.put_line('.');
          PARAMETER('SORT_AREA_SIZE',result1);
        dbms_output.put_line('Recommendation: Increase SORT_AREA_SIZE '||result1);
        dbms_output.put_line('. SORT_AREA_SIZE applicable for Shared Server ONLY');
        dbms_output.put_line('. PGA_AGGREGATE_TARGET works With Dedicated connections');
        dbms_output.put_line('. See Note:223730.1 for details');
        dbms_output.put_line('.');
          dbms_output.put_line(rpad('Name',30)||'Count');
          dbms_output.put_line(rpad('-',25,'-')||'     -----------');

          open c2;
        loop
          fetch c2 into h_char,h_num1;
          exit when c2%notfound;

                dbms_output.put_line(rpad(h_char,30)||h_num1);

          end loop;
          close c2;

end;
------------------------------------------------------------------------
procedure redo is

cursor c3 is
        select a.name,gets,misses,immediate_gets,immediate_misses
        from v$latch a, v$latchname b
        where b.name in ('redo allocation','redo copy')
        and a.latch#=b.latch#;
begin
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.                      REDO LOG BUFFER LATCHES (V$LATCH, V$SYSSTAT)');
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.');
        dbms_output.put_line('.         Goal: Redo log space request should be near 0' );
          PARAMETER('LOG_BUFFER',result1);
        dbms_output.put_line('Recommendation: Increase LOG_BUFFER (5% increments) '||result1);
          dbms_output.put_line('.');

        select value
        into h_num1
        from sys.v_$sysstat
        where name ='redo log space requests';

      dbms_output.put_line('.');
      dbms_output.put_line('.            Redo log space request: '||h_num1);
      dbms_output.put_line('.');

        open c3;
        loop
                fetch c3 into h_char,h_num1,h_num2,h_num3,h_num4;
                exit when c3%notfound;

                dbms_output.put_line('------------------------------------------------------');
                dbms_output.put_line('.           '||upper(h_char));
                dbms_output.put_line('.');
                dbms_output.put_line('.         Goal: Ratio < 1%' );
                dbms_output.put_line('Recommendation: Check Oracle tuning book for more detail ');
                dbms_output.put_line('.');
                dbms_output.put_line('.');
                dbms_output.put_line('.                              gets: '||h_num1);
                dbms_output.put_line('.                            misses: '||h_num2);
                dbms_output.put_line('.                    immediate_gets: '||h_num3);
                dbms_output.put_line('.                  immediate_misses: '||h_num4);
                dbms_output.put_line('.');

                if h_num1 =0 or h_num2 =0 then
                        h_num5:=0;
                else
                        h_num5:=round((h_num2/h_num1)*100,4);
                end if;

                if h_num4=0 or (h_num3+h_num4)=0 then
                        h_num6:=0;
                else
                        h_num6:=round((h_num4/(h_num3+h_num4))*100,4);
                end if;

                dbms_output.put_line('Ratio                   (miss/gets): '||h_num5||'%');
                dbms_output.put_line('Ratio (imm_miss)/(imm_get+imm_miss): '||h_num6||'%');
                dbms_output.put_line('.');
        end loop;
        close c3;
end;

---------------------------------------------------------------------------
procedure free_list is

begin
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.                      FREE LIST (V$WAITSTAT, V$SYSSTAT)');
        dbms_output.put_line(lpad('=',70,'='));
        dbms_output.put_line('.');
        dbms_output.put_line('.         Goal: Wait ratio < 1% ');
        dbms_output.put_line('.');
          dbms_output.put_line('Recommendation: Add more free lists');
        dbms_output.put_line('.               Re-create the table with a larger value for the FREELISTS');
        dbms_output.put_line('.');

        select count (*) 
        into h_num1
        from sys.v_$waitstat
        where class ='free list';

        select sum(value)
        into h_num2
        from sys.v_$sysstat
        where name in ('db block gets','consistent gets');

        h_num3:=round((h_num1/h_num2)*100,5);

        dbms_output.put_line('.                                Free list: '||h_num1);
        dbms_output.put_line('. sum of db_block_gets and consistent gets: '||h_num2);
        dbms_output.put_line('......................................................');
          dbms_output.put_line('.                         Your Hit Ratio is '||h_num3||'%');
end;
-------------------------------------------------------------------------
procedure parameter(p_in in char, result out char)  is
h_char2 varchar2(30);
h_char3 varchar2(10);

begin
       select substr(upper(name),1,40),substr(value,1,30),isdefault
       into h_char,h_char2, h_char3
       from sys.v_$parameter
       where upper(name)=upper(p_in);

                if h_char3='TRUE' then
                        result:='(Current setting: '||h_char2||' DEFAULT)';
                else
                        result:='(Current setting: '||h_char2||')';
                end if;

       exception when others then
        dbms_output.put_line('Unknown parameter ID:'||p_in);

end;
----------------------------------------------------------------------------
procedure opq is
result1     varchar2(50);
result2     varchar2(50);
   begin
	PARAMETER('PARALLEL_MIN_SERVERS', result1);
	PARAMETER('PARALLEL_MAX_SERVERS', result2);
        dbms_output.put_line('.                PARALLEL_MIN_SERVERS: '||rtrim(result1));
        dbms_output.put_line('.                PARALLEL_MAX_SERVERS: '||rtrim(result2));
end;

end;
/


/*************************************************************************/
/****************** CREATE TEMP VIEWS ************************************/
/*************************************************************************/
create or replace view temprpt_objects as
        select 0 col1,'Oracle Users' obj_name,to_char(count(*) ,'999,999') obj_count
        from   sys.dba_users
        where  username not in ('SYS','SYSTEM')
        group by 'Oracle Users'
UNION
        select decode(object_type,'TABLE',1,'INDEX',2,'TRIGGER',3 ,'VIEW',5,'SYNONYM',6,
                      'PACKAGE',7,'PACKAGE BODY',8,'PROCEDURE',9,'FUNCTION',10, 
'JAVA CLASS', 11, 'JAVA RESOURCE', 12, 'NEXT OBJECT', 13, 'RESOURCE PLAN', 14, 100) ,
               decode(object_type,'INDEX','     INDEX','TRIGGER','     TRIGGER',object_type),
               to_char(count(*) ,'999,999')
        from sys.dba_objects
        where owner not in ('SYS','SYSTEM')
          and object_name != 'TUNE'
          and object_name not like 'TEMPRPT_%'
        group by object_type
UNION
        select 4 , '     CONSTRAINT('||decode(constraint_type,
                              'C','Check)',
                              'P','Primary)',
                              'U','Unique)',
                              'R','Referential)',
                              'V','Check View)',
                              'O','Read-Only View)',
                              constraint_type||'('),to_char(count(*) ,'999,999')
        from sys.dba_constraints
        where owner not in ('SYS','SYSTEM')
        group by constraint_type;

create or replace view temprpt_total_Free as
select sum(bytes) free
from sys.dba_Free_space;

create or replace view temprpt_free as select tablespace_name,sum(bytes) free
from sys.dba_Free_space
group by tablespace_name;

create or replace view temprpt_bytes as
select tablespace_name,sum(bytes) bytes
from sys.dba_data_files
group by tablespace_name;

create or replace view temprpt_status as
select a.tablespace_name, b.free, a.bytes, c.status, t.extent_management, t.segment_space_management, t.status ts_status, t.bigfile bigfile
from temprpt_bytes a, temprpt_free b,  sys.v_$backup c, 
     dba_data_files d, dba_tablespaces t
where  a.tablespace_name = d.tablespace_name
and c.file# = d.file_id 
and t.tablespace_name = a.tablespace_name
and a.tablespace_name = b.tablespace_name(+);

create or replace view temprpt_frag1 as
select tablespace_name,count(*) frag,sum(bytes) frag_sum
from sys.dba_Free_space
group by tablespace_name;

create or replace view temprpt_frag2 as
select tablespace_name,max(bytes) max,min(bytes) min,avg(bytes) avg_size
from sys.dba_Free_space
group by tablespace_name;

create or replace view temprpt_next_vw as
select b.tablespace_name,max(bytes) next_ext
from sys.dba_free_space b
group by tablespace_name;

create or replace view temprpt_total_obj as
select count(*) total
from sys.dba_objects;

/**********************************************************************/
/************* START REPORT *******************************************/
/**********************************************************************/
-- To suppress non-english session NLS settings
alter session set nls_numeric_characters='.,';

/* Run dynamic spool output name */
/* Get Database Name, hostname if possible and create log file */

col hostname for a20 noprint new_value xhostname
-- select substr(value,instr(value,'=', 1, 4)+1,instr(value,'.')-1-instr(value,'=', 1, 4))||'_' "hostname" 
-- from v$listener_network
-- where TYPE='LOCAL LISTENER';

select substr(host_name, 1, instr(host_name, '.')-1)||'_' "hostname" from v$instance;

column name noprint new_value xdbname
select name||'_'||to_char(sysdate,'yymmdd') name
from v$database;

spool &&xhostname&&xdbname..rpt

set feed off head off verify off
select '&&HEAD' from dual;
select ' Report Date: '||to_char(sysdate,'DD-Mon-YYYY HH24:MI:SS')
from dual
union
select 'Startup Time: '||TO_CHAR(D.startup_time,'DD-Mon-YYYY HH24:Mi:SS')
from V$INSTANCE D;

set heading on
prompt ======================================================================
prompt .  DATABASE (V$DATABASE, V$VERSION, V$BGPROCESS, GLOBAL_NAME)
prompt ======================================================================

col GLOBAL_NAME format a13
col "Database" format a9
col "Created" format a11
col "Log Mode" format a12
col "Log Compr" for a9
col "Open Mode" format a10
col "DB Role" for a8
col DBID format 9999999999
col protection_mode for a20 heading "Protection Mode"
col flashback_on for a17 heading "DB Flashback"
select "Database Name", "Created", "Log Mode", "Log Compr", "Open Mode", "DB Role",DBID, GLOBAL_NAME, protection_mode, flashback_on 
from (select NAME "Database Name",CREATED "Created",LOG_MODE "Log Mode", ARCHIVELOG_COMPRESSION "Log Compr", open_mode "Open Mode", DATABASE_ROLE "DB Role", DBID, protection_mode, flashback_on
from sys.v_$database), (select global_name from global_name);

column "Current Versions" format a70
select dbms_utility.port_string  "Current Versions" from dual
union all
select ' ' from dual
union all
select banner "Current Versions" from sys.v_$version;

prompt .
prompt ======================================================================
prompt .     OS statistics average load over the past minute (V$OSSTAT)
prompt ======================================================================
set feedb on
col LOAD for 99.99 heading "Processes, avg"
col IDLE_TIME for 99.99 heading "Idle time, %"
col USER_TIME for 99.99 heading "User time, %"
col SYS_TIME for 99.99 heading "Sys time, %"
col IOWAIT_TIME for 99.99 heading "I/O wait time, %"
col PHYSICAL_MEMORY_BYTES for 999,999 heading "Phys memory, Mb"

select NUM_CPUS, LOAD, 
IDLE_TIME/(IDLE_TIME + BUSY_TIME)*100 IDLE_TIME, 
USER_TIME/(IDLE_TIME + BUSY_TIME)*100 USER_TIME, 
SYS_TIME/(IDLE_TIME + BUSY_TIME)*100 SYS_TIME, 
IOWAIT_TIME/(IDLE_TIME + BUSY_TIME)*100 IOWAIT_TIME,
PHYSICAL_MEMORY_BYTES/1024/1024 PHYSICAL_MEMORY_BYTES
from 
(select value NUM_CPUS from V$OSSTAT where OSSTAT_ID=0), 
(select value LOAD from V$OSSTAT where OSSTAT_ID=15), 
(select value IDLE_TIME from V$OSSTAT where OSSTAT_ID=1), 
(select value BUSY_TIME from V$OSSTAT where OSSTAT_ID=2), 
(select value USER_TIME from V$OSSTAT where OSSTAT_ID=3), 
(select value SYS_TIME from V$OSSTAT where OSSTAT_ID=4), 
(select value IOWAIT_TIME from V$OSSTAT where OSSTAT_ID=5),
(select value PHYSICAL_MEMORY_BYTES from V$OSSTAT where OSSTAT_ID=1008);

prompt .
prompt ======================================================================
prompt .        HISTORY OF CPU USAGE IF ANY (WRI$_DBU_CPU_USAGE)
prompt ======================================================================
col version for a17
col time_change for a16
col cpu_count for 99
col cpu_core_count for 99
col cpu_socket_count for 99

select version, to_char(timestamp, 'YYYY-MM-DD HH24:MI') time_change, 
cpu_count, cpu_core_count, cpu_socket_count
from WRI$_DBU_CPU_USAGE
order by 2;

prompt .
prompt ======================================================================
prompt .          INSTALLED DATABASE COMPONENTS (DBA_REGISTRY)
prompt ======================================================================
column comp_id format a15
column comp_name format a45
column version format a11
column status format a8
column modified format a21

select comp_id, comp_name, version, status, modified
from dba_registry order by 1;

prompt .
prompt ======================================================================
prompt .          INSTALLED DATABASE PATCHES (REGISTRY$HISTORY)
prompt ======================================================================
col action_time for a16
col action for a15
col version for a11
col comments for a60

SELECT to_char(action_time, 'yyyy-mm-dd hh24:mi') action_time, action, version, comments 
FROM registry$history
order by action_time desc;

prompt .
prompt ======================================================================
prompt .      SUPPORTED BUT NOT INSTALLED DATABASE OPTIONS (V$OPTION)
prompt ======================================================================
column parameter format a35
column value format a10
select parameter, value from sys.v_$option
where value != 'TRUE' order by 1;

column bgprocesses format a50
select name bgname, substr(description,1, 30) bgprocesses 
from v$bgprocess where paddr<>'00';

prompt .
prompt ======================================================================
prompt . Redo operations and LogMiner support (V$DATABASE, DBA_REGISTRY)
prompt ======================================================================
prompt . Note: Database Parameters are depend of SLA
prompt . Note: It's important section if you use STANDBY DATABASE
prompt .  Use: ALTER DATABASE ADD SUPPLEMENTAL LOG DATA; -- or
prompt .       ALTER DATABASE FORCE LOGGING; -- if you REALLY need it
prompt .

column "Minimal Log" format a7 heading "Minimal|Logging"
column "PK Log" format a7 heading "PK|Logging"
column "Unique Ind Log" format a12 heading "Unique Index|Logging"
column "Force Log" format a7 heading "Force|Logging"
column "Version" format a10
column "Compatible" format a10

SELECT version "Version",
compat.value "Compatible",
SUPPLEMENTAL_LOG_DATA_MIN "Minimal Log",
SUPPLEMENTAL_LOG_DATA_PK "PK Log", 
SUPPLEMENTAL_LOG_DATA_UI "Unique Ind Log", 
FORCE_LOGGING "Force Log" FROM V$DATABASE,
(SELECT value FROM v$parameter WHERE name = 'compatible') compat,
sys.dba_registry reg
where reg.comp_id = 'CATALOG'; 

prompt .
prompt ======================================================================
prompt .  INSTANCE RECOVERY PARAMETERS (V$PARAMETER) (V$INSTANCE_RECOVERY)
prompt ======================================================================

column "Recovery Parameters" format a40
column "Value, sec" format a10
col SID for a10
select '          ' SID, upper(substr(name,1,40)) "Recovery Parameters",
substr(value,1,10)       "Value, sec"
from sys.v_$parameter
where substr(name,1,40) = 'fast_start_mttr_target'
union
select SID, 'SP FILE '||upper(substr(name,1,40)) "Recovery Parameters",
substr(value,1,10)       "Value, sec"
from sys.v_$spparameter
where substr(name,1,40) = 'fast_start_mttr_target'
union
select '          ', 'TARGET_MTTR' "Recovery Parameters", to_char(target_mttr) "Value, sec"
from sys.v_$instance_recovery
union
select '          ', 'ESTIMATE_MTTR' "Recovery Parameters", to_char(target_mttr) "Value, sec"
from sys.v_$instance_recovery;

prompt .
prompt ======================================================================
prompt .            MTTR Estimations (V_$MTTR_TARGET_ADVICE)
prompt ======================================================================

column mttr_target_for_estimate for 99999 heading "MTTR Estimations, Sec"
column estd_total_io_factor for 999.99 heading "I/O factor"
column advice_status format a6 heading "Status"
select mttr_target_for_estimate, estd_total_io_factor, advice_status
from v_$MTTR_TARGET_ADVICE
order by 1;

prompt .
prompt ======================================================================
prompt .           Log File Size Advisor  (V$INSTANCE_RECOVERY)
prompt ======================================================================
prompt . Based on FAST_START_MTTR_TARGET value and recent DB load
prompt . Reduse time if you need: alter system set FAST_START_MTTR_TARGET=##;
prompt . FAST_START_MTTR_TARGET can not be less than 46 seconds
prompt . You should start with 100 MB redo log files for any production database
prompt . See Note:1038851.6 for details

select TARGET_MTTR, ESTIMATED_MTTR, OPTIMAL_LOGFILE_SIZE "Optimal Log File Size, Mb"
from v$instance_recovery;

prompt .
prompt ======================================================================
prompt .           ONLINE REDO LOGS (GV$LOG, GV$STANDBY_LOG, GV$LOGFILE)
prompt ======================================================================

col member format a50
col archived format a8
col size_ format 9999.9 head "Size, Mb"
col status format a10
col group# format 9999 heading "Group"
col thread# for 999999 heading "Thread"

SELECT distinct l.group#, l.thread#, type, member, bytes/1024/1024 size_, archived, l.status
FROM gv$logfile f, gv$log l
where l.group# = f.group# and f.inst_id = l.inst_id
order by 1, 2;

SELECT distinct l.group#, l.thread#, type, member, bytes/1024/1024 size_, archived, l.status
FROM gv$logfile f, gv$standby_log l
where l.group# = f.group# and f.inst_id = l.inst_id
order by 1, 2;

prompt .
prompt ======================================================================
prompt .       Active ARCHIVE_DEST destinations (V$ARCHIVE_DEST)
prompt ======================================================================

column dest_name format a19
column destination format a26
col status for a6
col valid_now for a10 heading "Valid"
col archiver for a8
col affirm for a6
col transmit_mode for a11 heading "Trans mode"
col reopen_secs for 99999 heading "Reopen"
col net_timeout for 99999 heading "Net timeout"
col compression for a8 heading "Compress"
select dest_name, status, valid_now, SCHEDULE, ARCHIVER, destination, affirm, transmit_mode, reopen_secs, net_timeout, compression
from v$archive_dest where status != 'INACTIVE';

prompt .
prompt ======================================================================
prompt .       Archive Log activity last 7 days (GV$LOG_HISTORY)
prompt ======================================================================
prompt . Generally speaking, DB shoud make a switch every 20 - 30 minutes
prompt . I.e 48 - 72 times per day. See Note 274264.1 for details.

SELECT thread#,
sum(decode( trunc(first_time), trunc(sysdate)-6,1)) "DAY-6",
sum(decode( trunc(first_time), trunc(sysdate)-5,1)) "DAY-5",
sum(decode( trunc(first_time), trunc(sysdate)-4,1)) "DAY-4",
sum(decode( trunc(first_time), trunc(sysdate)-3,1)) "DAY-3",
sum(decode( trunc(first_time), trunc(sysdate)-2,1)) "DAY-2",
sum(decode( trunc(first_time), trunc(sysdate)-1,1)) "YESTERDAY",
sum(decode( trunc(first_time), trunc(sysdate)-0,1)) "TODAY"
from SYS.gv_$log_history
where inst_id = 1
GROUP BY thread#
ORDER BY 1;

prompt .
prompt ======================================================================
prompt . STATISTIC FOR TUNING MEMORY_TARGET_ADVICE SIZE (V$MEMORY_TARGET_ADVICE)
prompt ======================================================================
prompt . Size in Mb of course

col version for 999999999999
select memory_size, memory_size_factor size_factor, 
estd_db_time, estd_db_time_factor time_factor, version
from v$memory_target_advice order by memory_size_factor;

prompt .
prompt ======================================================================
prompt .      DYNAMIC MEMORY COMPONENTS (V$MEMORY_DYNAMIC_COMPONENTS)
prompt ======================================================================

col component format a24
col current_size format 999999 heading "Curr size, Mb"
col min_size format 999999
col max_size format 999999
col user_specified_size for 999999 heading "User size"
col granule_size for 9999
col last_oper_type for a9
select component, 
current_size/1024/1024 current_size, 
min_size/1024/1024 min_size, 
max_size/1024/1024 max_size, 
user_specified_size/1024/1024 user_specified_size,
granule_size/1024/1024 granule_size,
last_oper_type
from sys.V$MEMORY_DYNAMIC_COMPONENTS;

prompt .
prompt ======================================================================
prompt .      LAST 10 CHANGES OF MEMORY POOLS SIZES (V$MEMORY_RESIZE_OPS)
prompt ======================================================================

col component for a22
col parameter for a20
col oper_type for a9

select * from (select component, oper_type, oper_mode, parameter,
initial_size/1024/1024 initial_size,
target_size/1024/1024 target_size,
final_size/1024/1024 final_size,
to_char(start_time, 'dd-mm hh24:mi') start_time,
to_char(end_time, 'dd-mm hh24:mi') end_time
from V$MEMORY_RESIZE_OPS
where oper_type not in ('STATIC', 'INITIALIZING')
order by start_time desc)
where rownum < 11;

prompt .
prompt ======================================================================
prompt .                      SGA SIZE (V$SGA) (V$SGASTAT)
prompt ======================================================================
column "Memory" format a54
column "   Size" format a13

        select decode(name,
                           'Database Buffers',
                           'Database Buffers (DB_BLOCK_SIZE*DB_BLOCK_BUFFERS)',
                                 'Redo Buffers',
                           'Redo Buffers     (LOG_BUFFER)',name)
               "Memory",to_char(value/1024/1024,'999,999') "   Size, Mb"
        from sys.v_$sga
UNION ALL
        select '------------------------------------------------------','---------------'
        from dual
UNION ALL
        select 'Total Memory' "Type",to_char(sum(value)/1024/1024,'999,999')
        from sys.v_$sga;

prompt .
prompt ======================================================================
prompt .      SGA TARGET ADVICE (V$SGA_TARGET_ADVICE)
prompt ======================================================================
prompt . If you use Automatic Shared Memory Management (ASMM) mode of course
prompt . i.e. SGA_TARGET <> 0

set head off
select '               Current value SGA_MAX_SIZE = '||to_number(trim(value))/1024/1024||' Mb' 
from v$parameter2
where name = 'sga_max_size';
select '                 Current value SGA_TARGET = '||to_number(trim(value))/1024/1024||' Mb'
from v$parameter2
where name = 'sga_target';
set head on
col estd_physical_reads for 9999999999999999999999
select sga_size, sga_size_factor, estd_db_time, 
estd_db_time_factor, estd_physical_reads
from v$sga_target_advice
order by sga_size_factor;

prompt .
prompt ======================================================================
prompt .      FREE MEMORY IN SGA POOLS (V$SGASTAT)
prompt ======================================================================

col poolsize for 999,999 heading "Size, Mb"
col name for a15 heading "Memory type"
SELECT pool, name, bytes/1024/1024 poolsize
FROM V$SGASTAT WHERE name = 'free memory'; 

prompt .
prompt ======================================================================
prompt .      DATABASE STATISTIC (DBA_DATA_FILES, DBA_TEMP_FILES)
prompt . "Total Used, Free" and "PCT Used" doesn't consider temporary tablespace
prompt ======================================================================
column "Tablespaces" format 999
column "Datafiles added" format 999
column "Total Size, Mb" format a15
column "Total Used, Mb" format a15
column "Total Free, Mb" format a15
column "PCT Used" format a8

select distinct count1 "Tablespaces", count2 "Datafiles added", totals "Total Size, Mb",
totalu "Total Used, Mb", totalf "Total Free, Mb", pctu "PCT Used" from
(select (select count(distinct df.tablespace_name) from sys.dba_data_files df)+(select nvl(count(distinct tf.tablespace_name), 0) from sys.dba_temp_files tf) count1 from dual),
(select count(df.tablespace_name)-count(distinct df.tablespace_name) count2 from sys.dba_data_files df),
(select to_char((select sum(bytes/1048576) from sys.dba_data_files)+
nvl((select sum(bytes/1048576) from sys.dba_temp_files), 0),'99,999,999,999') totals from dual),
(select to_char((select sum(df.bytes/1048576) from sys.dba_data_files df)-
free/1048576,'99,999,999,999') totalu from temprpt_total_Free),
(select to_char(free/1048576,'99,999,999,999') totalf from temprpt_total_Free),
(select to_char(((sum(df.bytes)-free)/sum(df.bytes))*100,'999.99')||'%' pctu 
from sys.dba_data_files df, temprpt_total_Free group by free);

set feedback ON
prompt .
prompt ======================================================================
prompt .                      PROFILES (DBA_PROFILES)
prompt ======================================================================
column "Profile" format a25
column "Resource" format a30
column "Limit" format a15
select profile "Profile",resource_name "Resource",limit "Limit"
from   sys.dba_profiles
order by 1, 2;

prompt ======================================================================
prompt .     RESOURCE MANAGER SYSTEM PLAN (V_$RSRC_PLAN)
prompt ======================================================================

col is_top_plan for a11 heading "Is Top Plan"
SELECT ID, name "System Plan", is_top_plan FROM v$rsrc_plan;

prompt ======================================================================
prompt . RESOURCE MANAGER CONSUMER GROUPS OF PLANS (DBA_RSRC_PLAN_DIRECTIVES)
prompt ======================================================================

col plan for a26
col group_or_subplan for a25
col CPU_METHOD for a17
col comments for a110
col MGMT_P1 for 999
col MGMT_P2 for 999
col MGMT_P3 for 999

select plan, group_or_subplan, CPU_METHOD, MGMT_P1, MGMT_P2, MGMT_P3, G.comments
from DBA_RSRC_PLAN_DIRECTIVES, DBA_RSRC_CONSUMER_GROUPS G
where plan not in ('SYSTEM_PLAN', 'INTERNAL_QUIESCE', 'INTERNAL_PLAN') and
consumer_group = group_or_subplan
order by 4 desc, 5 desc, 6 desc;

prompt ======================================================================
prompt .  RESOURCE MANAGER CONSUMER GROUPS STATISTIC (V_$RSRC_CONSUMER_GROUP)
prompt ======================================================================

select name "Group Name", requests from V_$RSRC_CONSUMER_GROUP order by 1;

prompt ======================================================================
prompt .      RESOURCE MANAGER CONSUMER GROUPS ON-LINE (V$SESSION)
prompt ======================================================================

COL username                 FORMAT A15  HEADING 'User Name'
COL resource_consumer_group  FORMAT A25  HEADING 'Resource Consumer Group'

SELECT count(*), username, resource_consumer_group
  FROM v$session
  WHERE resource_consumer_group IS NOT NULL
  group by username, resource_consumer_group
  ORDER BY username, resource_consumer_group;

prompt ======================================================================
prompt .     RESOURCES HAVE BEEN CONSUMED (V_$RSRC_CONSUMER_GROUP)
prompt ======================================================================

COL name                      FORMAT A27         HEADING 'Resource|Consumer|Group' print
COL active_sessions           FORMAT 99999       HEADING 'Act|Sess'
COL execution_waiters         FORMAT 99999       HEADING 'Exec|Wtrs'
COL requests                  FORMAT 99999999    HEADING 'Reqs'
COL cpu_wait_time             FORMAT 9999999999  HEADING 'CPU|Wait|Time'
COL cpu_waits                 FORMAT 9999999999  HEADING 'CPU|Waits'
COL consumed_cpu_time         FORMAT 9999999999  HEADING 'CPU|Time|Used'
COL yields                    FORMAT 9999        HEADING 'Ylds'
COL queue_length              FORMAT 99999       HEADING 'Queue|Len'
COL current_undo_consumption  FORMAT 99999999    HEADING 'Curr|UNDO|Used, kb'

SELECT
     name
    ,active_sessions
    ,execution_waiters
    ,requests
    ,cpu_wait_time
    ,cpu_waits
    ,consumed_cpu_time
    ,yields
    ,queue_length
    ,current_undo_consumption
  FROM v$rsrc_consumer_group;

prompt ======================================================================
prompt .                      ROLES (DBA_ROLES)
prompt ======================================================================
select role "Role",password_required "Password"
from  sys.dba_roles
order by 1;

prompt ======================================================================
prompt .        SUMMARY OF OBJECTS (excluding SYS and SYSTEM) (DBA_OBJECTS)
prompt ======================================================================

set feedback off
column "Objects" format a35

select rpad(obj_name,35,'.') "Objects",obj_count "Count"
from temprpt_objects
order by col1;

prompt .
prompt ======================================================================
prompt .             LOCKED AND EXPIRED USERS (DBA_USERS)
prompt ======================================================================
column username format a25
column account_status format a19
column "LOCK DATE" format a15
column "EXPIRY DATE" format a15
select username,account_status, 
to_char(lock_date, 'DD-MON-YY HH24:MI') "LOCK DATE", 
to_char(expiry_date, 'DD-MON-YY HH24:MI') "EXPIRY DATE" 
from dba_users
where account_status != 'OPEN'
order by 1;

prompt .
prompt ======================================================================
prompt . DBA USERS WITH DEFAULT PASSWORD (DBA_USERS_WITH_DEFPWD)
prompt ======================================================================

select username from dba_users_with_defpwd
order by 1;

prompt .
prompt ======================================================================
prompt .              PROXY USERS (DBA_PROXIES)
prompt ======================================================================

select proxy, count(*) client_connections
from dba_proxies
group by proxy
order by proxy;

prompt .
prompt ======================================================================
prompt . TYPES OF USED PASSWORDS (DBA_USERS)
prompt ======================================================================

select count(*), PASSWORD, PASSWORD_VERSIONS 
FROM DBA_USERS group by PASSWORD, PASSWORD_VERSIONS
order by 2;

prompt .
prompt ======================================================================
prompt .             DEFINED DB JOBS (DBA_JOBS)
prompt ======================================================================
set lines 400
column "Job Num" format 9999999
column log_user format a12
column schema_user format a17
column broken format a6
column "NEXT DATE" format a19
column "INTERVAL" format a20
column "WHAT" format a60

select job "Job Num", log_user, schema_user, broken,
to_char(next_date, 'DD-MM-YYYY hh24:mi:ss') "NEXT DATE", 
interval "INTERVAL", what "WHAT"
from dba_jobs;

prompt .
prompt ======================================================================
prompt .             RUNNING DB JOBS (DBA_JOBS_RUNNING)
prompt ======================================================================
set lines 140
column sid format 999999
column "Job Num" format 9999999
column failures format 999999
column "Last DATE" format a19
column "Last Succ Exec" format a9 heading "Last Succ|Exec"
column "This DATE" format a19
column "This Succ Exec" format a9 heading "This Succ|Exec"

select /*+ rule */ sid, job "Job Num", failures, 
to_char(last_date, 'DD-MM-YYYY hh24:mi:ss') "Last DATE", 
last_sec "Last Succ Exec", 
to_char(this_date, 'DD-MM-YYYY hh24:mi:ss') "This DATE", 
this_sec "This Succ Exec" 
from dba_jobs_running;

prompt .
prompt ======================================================================
prompt .          SCHEDULED JOBS (DBA_SCHEDULER_JOBS)
prompt ======================================================================
prompt . Use "EXEC DBMS_SCHEDULER.DISABLE/STOP_JOB/DROP_JOB ('MY_JOB');"
prompt .

column owner format a15
column program_name for a25
column state for a10
column job_name for a30
column job_class for a21
col enabled for a7
col system for a7

SELECT owner, job_name, job_class, program_name, enabled, state, system FROM dba_scheduler_jobs;

prompt .
prompt ======================================================================
prompt .        SCHEDULER - LAST 20 LOGS (DBA_SCHEDULER_JOB_LOG)
prompt ======================================================================
prompt . Excluding EXFSYS and ORACLE_OCM jobs
prompt .

col owner for a12
col job_name for a30
col log_date_HH24_MI for a17

select * from( select owner, job_name, to_char(log_date, 'dd-mm-yy hh24:mi') log_date_HH24_MI
from dba_scheduler_job_log
where owner not in ('EXFSYS', 'ORACLE_OCM')
order by log_date desc)
where rownum < 21;

prompt .
prompt ======================================================================
prompt .  DEFINED OS CREDENTIALS FOR SCHEDULER (DBA_SCHEDULER_CREDENTIALS)
prompt ======================================================================
prompt . Uses to start bash scripts by scheduler

col owner for a20
col credential_name for a20
col username for a15
col comments for a60
select owner, credential_name, username, comments
from sys.dba_scheduler_credentials
order by 1, 2;

prompt .
prompt ======================================================================
prompt .       AUTOMATIC MAINTENANCE TASKS (DBA_AUTOTASK_OPERATION)
prompt ======================================================================
prompt . Use "EXEC DBMS_AUTO_TASK_ADMIN.disable;" -- if you don't need them all
prompt . or accurate with "client_name => 'auto space advisor'" for example
prompt . Check DBA_AUTOTASK_TASK for running jobs
prompt .

col client_name for a32
col operation_name for a30
col window_active for a14 heading "Window Active?"
col status for a8

select client_name, operation_name, status from dba_autotask_operation;
select window_name, window_active, autotask_status from DBA_AUTOTASK_WINDOW_CLIENTS;

prompt .
prompt ======================================================================
prompt .      LIST OF LAST JOB CALLS (DBA_AUTOTASK_JOB_HISTORY)
prompt ======================================================================

col window_name for a20
col job_start_date for a15
col job_name for a22
col job_duration for a14

prompt === auto optimizer stats collection
select * from (SELECT window_name, to_char(job_start_time, 'dd-mm hh24:mi') job_start_time, job_name, job_status, job_duration, job_error
FROM DBA_AUTOTASK_JOB_HISTORY 
WHERE CLIENT_NAME = 'auto optimizer stats collection'
order by window_start_time desc)
where rownum < 6;

prompt === auto space advisor
select * from (SELECT window_name, to_char(job_start_time, 'dd-mm hh24:mi') job_start_time, job_name, job_status, job_duration, job_error
FROM DBA_AUTOTASK_JOB_HISTORY 
WHERE CLIENT_NAME = 'auto space advisor'
order by window_start_time desc)
where rownum < 6;

prompt === sql tuning advisor
select * from (SELECT window_name, to_char(job_start_time, 'dd-mm hh24:mi') job_start_time, job_name, job_status, job_duration, job_error
FROM DBA_AUTOTASK_JOB_HISTORY 
WHERE CLIENT_NAME = 'sql tuning advisor'
order by window_start_time desc)
where rownum < 6;

prompt .
prompt ======================================================================
prompt . LIST OF SUSPENDED SESSIONS (DBA_RESUMABLE) - resumable space management
prompt ======================================================================

column name format a40
column error_msg format a50
select /*+ rule */ user_id, name, status, timeout, error_msg 
from dba_resumable
where error_msg is not null;

set feedback ON
set heading ON

prompt .
prompt ======================================================================
prompt .     LIST OF OWNERS WITH > 5% OF TOTAL OBJECTS (DBA_OBJECTS)
prompt ======================================================================
column "Owner" format a25
column "Count" format 999,999,999
column "Total Objects" format 999,999,999
column "Owned" format a8

select owner                                        "Owner",
       count(*)                                     "Count",
       total   			                    "Total Objects",
       to_char((count(*)/total) *100,'999.99')||'%' "Owned"
from   sys.dba_objects a, temprpt_total_obj b
group by owner,total
having ((count(*)/total) *100 ) > 5
order by 4 desc;

execute tune.lib;
execute tune.rrow;

prompt .
prompt ======================================================================
prompt .  STATISTIC FOR TUNING SHARED POOL SIZE  (V$SHARED_POOL_ADVICE)
prompt ======================================================================
prompt . This list shows you how efficiency of Shared Pool will change
prompt . when you'll change the Shared Pool Size
prompt . Allow the workload to stabilize for collect statistic before.
prompt .

column shared_pool_size_for_estimate    format 999,999,999 heading 'Shared pool|Size (Mb)'
column shared_pool_size_factor      	format 99.9999 heading 'Shared Pool|Size Factor'
column estd_lc_size 			format 999,999 heading 'Estd Memory in use|by Lib Cache (Mb)'
column estd_lc_memory_objects       	format 999,999,999 heading 'Estd Number of Lib|Cache Memory Objects'

SELECT shared_pool_size_for_estimate, 
shared_pool_size_factor, 
estd_lc_size, 
estd_lc_memory_objects
  FROM V$SHARED_POOL_ADVICE;

execute tune.buffer;

prompt .
prompt ======================================================================
prompt .  STATISTIC FOR TUNING DEFAULT BUFFER CACHE SIZE (V$DB_CACHE_ADVICE)
prompt ======================================================================
prompt . Parameter DB_CACHE_ADVICE should be set to ON, 
prompt . and a representative workload should be running on the instance. 
prompt . Allow the workload to stabilize before.
prompt . It would be better to use DB_CACHE_SIZE instead of DB_BLOCK_BUFFER
prompt .
prompt . Recommendation: Increasing the cache size beyond its current size 
prompt .                 would not provide a significant benefit.
prompt . 
prompt . This list shows you how amount of physical reads will change
prompt . when you'll change the cache size
prompt .
prompt . If there are no physical reads in the real cache, 
prompt . the value of 'Estd Phys Read Factor' column is null

column size_for_estimate         format 999,999,999,999 heading 'Cache Size (Mb)'
column buffers_for_estimate      format 999,999,999 heading 'Buffers'
column estd_physical_read_factor format 999,999.90 heading 'Estd Phys|Read Factor'
column estd_physical_reads       format 999,999,999,999 heading 'Estd Phys| Reads'

SELECT size_for_estimate, buffers_for_estimate
     , estd_physical_read_factor, estd_physical_reads
  FROM V$DB_CACHE_ADVICE
 WHERE name          = 'DEFAULT'
   AND block_size    = (SELECT value FROM V$PARAMETER 
                         WHERE name = 'db_block_size');

prompt .
prompt ======================================================================
prompt .          PGA WORKAREAS DISTRIBUTION (V$SYSSTAT)
prompt ======================================================================
Prompt . Responds for dedicated connections only
prompt . Recommendations: Multipass percentage should be less then 1% 
prompt . Increase PGA_AGGREGATE_TARGET if you need. Check Note:223730.1 for details

column profile format a35
column "Count" format a10
column "Percentage" format a10
SELECT substr(name,1,35) profile, 
to_char(count, '999999999') "Count", 
to_char(decode(total, 0, 0, round(count*100/total)), '999.99') "Percentage"
    FROM (SELECT name, value count, (sum(value) over ()) total
    FROM SYS.V$SYSSTAT 
    WHERE name like 'workarea exec%');

prompt . ONEPASS_EXECUTIONS and the MULTIPASSES_EXECUTIONS columns 
prompt . indicative of a movement to TEMP TBS

col PGA_SIZE for a34
SELECT CASE WHEN low_optimal_size < 1024*1024
       THEN to_char(low_optimal_size/1024,'99999999') ||
       'kb <= PGA < ' ||
       (high_optimal_size+1)/1024|| 'kb'
       ELSE to_char(low_optimal_size/1024/1024,'99999999') ||
       'mb <= PGA < ' ||
       (high_optimal_size+1)/1024/1024|| 'mb'
       END pga_size,
       optimal_executions,
       onepass_executions,
       multipasses_executions
  FROM v$sql_workarea_histogram
 WHERE total_executions <> 0
 ORDER BY low_optimal_size;

prompt .
prompt ======================================================================
prompt . STATISTIC FOR TUNING PGA_AGGREGATE_TARGET SIZE (V$PGA_TARGET_ADVICE)
prompt ======================================================================
prompt . Set the initial value of PGA_AGGREGATE_TARGET
prompt . Set STATISTICS_LEVEL to TYPICAL (the default) or ALL;
prompt .
prompt . Recommendations: See Oracle9i Database Performance Tuning Guide and Reference
prompt . Release 2 (9.2), Part Number A96533-01 for details
prompt . 
prompt . where PGA Taget Factor = 1.00 is your current PGA_AGGREGATE_TARGET size

column ADVICE_STATUS format a10 heading "Adv Status"
column ESTD_OVERALLOC_COUNT format 999,999,999 heading "Estd N of|PGA memory over-all"
SELECT round(PGA_TARGET_FOR_ESTIMATE/1024/1024) "Target (Mb)",
       PGA_TARGET_FACTOR "PGA Target Factor",
       ADVICE_STATUS ,
       ESTD_PGA_CACHE_HIT_PERCENTAGE "Cache Hit %",
       ESTD_OVERALLOC_COUNT
FROM v$pga_target_advice;

execute tune.sort_area;

prompt .
prompt ======================================================================
prompt .  STATISTIC FOR TUNING KEEP BUFFER POOL SIZE (V$DB_CACHE_ADVICE)
prompt ======================================================================
prompt . Parameter DB_CACHE_ADVICE should be set to ON, 
prompt . and a representative workload should be running on the instance. 
prompt . KEEP BUFFER CACHE should be preconfigured like:
prompt . alter system set DB_KEEP_CACHE_SIZE =  100M;;

set head off feedb off
SELECT 'There are defined objects for Keep Buffer Cache: '||to_char(count(*))
from dba_segments
where 
buffer_pool = 'KEEP' and
segment_type in ('TABLE','INDEX');
set head on feedb on

SELECT size_for_estimate "Keep Buffer, Mb", size_factor,
estd_physical_reads, estd_physical_read_factor
FROM v$db_cache_advice
WHERE name = 'KEEP'; 

prompt .
prompt ======================================================================
prompt .  STATISTIC FOR TUNING RECYCLE BUFFER POOL SIZE (V$DB_CACHE_ADVICE)
prompt ======================================================================
prompt . Parameter DB_CACHE_ADVICE should be set to ON, 
prompt . and a representative workload should be running on the instance. 
prompt . RECYCLE BUFFER CACHE should be preconfigured like:
prompt . alter system set db_recycle_cache_size=16M;;

set head off feedb off
SELECT 'There are defined objects for Recycle Buffer Cache: '||to_char(count(*))
from dba_segments
where 
buffer_pool = 'RECYCLE' and
segment_type in ('TABLE','INDEX');
set head on feedb on

SELECT size_for_estimate "Recycle Buffer, Mb", size_factor,
estd_physical_reads, estd_physical_read_factor
FROM v$db_cache_advice
WHERE name = 'RECYCLE'; 

prompt .
prompt ======================================================================
prompt . STATISTIC FOR TUNING JAVA POOL SIZE (V$JAVA_POOL_ADVICE)
prompt ======================================================================
prompt .

column "Objects" format 9999999999
select java_pool_size_for_estimate "Size, Mb", 
java_pool_size_factor "Factor", 
estd_lc_size "In use, Mb",
estd_lc_memory_objects "Objects",
estd_lc_time_saved "Saved time, sec"
from V$JAVA_POOL_ADVICE
order by 2;

prompt ======================================================================
prompt .   LARGE POOL SIZE USAGE (V$SGASTAT, V_$SGA_DYNAMIC_COMPONENTS)
prompt ======================================================================
prompt . The Large pool is an optional memory area that can be configured to provide 
prompt . large memory allocations for one of the following operations : 
prompt . * session memory for the multi-threaded server and the Oracle XA interface.
prompt . * The memory ( Buffers ) for Oracle backup and restore operations and for I/O server processes.
prompt . * Parallel Execution messaging buffers.
prompt . The Large pool does not have a LRU list. 
prompt . It is different from reserved space in the shared pool, which uses the same LRU list 
prompt . as other memory allocated from the shared pool. 
prompt . If you got: "ORA-04031: unable to allocate XXXX bytes of shared memory
prompt . ("large pool","unknown object","session heap","frame")" investigate it deeper.
prompt . Based on Note: 146599.1
prompt .

select 
init "Initial, Mb", cur "Current, Mb", free "Free, Mb" from 
(select round(to_number(value)/1024/1024, 2) init from sys.v_$parameter2 where substr(name, 1, 15) = 'large_pool_size'),
(select round(current_size/1024/1024, 2) cur from sys.v_$sga_dynamic_components where component = 'large pool'),
(select round(bytes/1024/1024, 2) free FROM v$sgastat where pool = 'large pool' and name = 'free memory');

prompt .
prompt ======================================================================
prompt .              CONNECTION POOLING (DBA_CPOOL_INFO)
prompt ======================================================================
prompt . execute dbms_connection_pool.start_pool;;
prompt . execute dbms_connection_pool.stop_pool;;
prompt . execute dbms_connection_pool.restore_defaults();;

col CONNECTION_POOL for a30
select CONNECTION_POOL, STATUS, MINSIZE, MAXSIZE, SESSION_CACHED_CURSORS from DBA_CPOOL_INFO;

prompt .
prompt ======================================================================
prompt .          CURSOR SHARING and STATEMENT PARSING
prompt ======================================================================
prompt . Goal: Executions should be much more than parsings
prompt . Goal: Soft parses should be much more than hard parses
prompt . Hard/Soft parsing ratio based on event model (how many times)
prompt . Performance statistic based on new time model (how many seconds) by ADDM
prompt . The summary is not 100%, some statistic times actually are overlapping.
prompt . Session_cached_cursors excluding SYS and DBSNMP activity, SR #7529530.993

declare
  result1	varchar2(50); 
begin 
  tune.PARAMETER('CURSOR_SHARING', result1);
  dbms_output.put_line('. Think about current CURSOR_SHARING parameter '||rtrim(result1));
  dbms_output.put_line('. Maybe FORCE or SIMILAR more appropriate than EXACT?');
  dbms_output.put_line('.');
end;
/

column parameter format a29
column value     format a5
column usage     format a5
column "PARSE CALLS" format a16
column "EXECUTIONS" format a16
set feedb off

select 
to_char(sum(parse_calls), '999,999,999,999') "PARSE CALLS", 
to_char(sum(executions), '999,999,999,999') "EXECUTIONS" 
from v$sqlarea, dba_users
where username in
(select username from dba_users where PARSING_SCHEMA_ID = user_id) 
and username not in  ('SYS', 'SYSTEM'); 

column soft_parses format a11
column hard_parses format a11

select
  to_char(100 * (calls - hard) / calls, '999990.00') || '%'  soft_parses,
  to_char(100 * hard / calls, '999990.00') || '%'  hard_parses
from
  ( select value calls from sys.v_$sysstat where name = 'parse count (total)' ),
  ( select value hard from sys.v_$sysstat where name = 'parse count (hard)' );

column no_binds format a9
column soft_parses format a11
column hard_parses format a11
column java_exec format a9
column plsql_exec format a10
column plsql_comp format a10
column db_cpu format a10
column rman format a9

select
  to_char(100 * db_cpu / dbt, '9990.00') || '%'         DB_CPU,
  to_char(100 * hard / dbt, '9990.00') || '%'           hard_parses,
  to_char(100 * (parse - hard) / dbt, '9990.00') || '%' soft_parses,
  to_char(100 * nobind / dbt, '9990.00') || '%'         no_binds,
  to_char(100 * java / dbt, '9990.00') || '%'           java_exec,
  to_char(100 * plexec / dbt, '9990.00') || '%'         plsql_exec,
  to_char(100 * plcomp / dbt, '9990.00') || '%'         plsql_comp,
  to_char(100 * rman / dbt, '9990.00') || '%'           rman
from
  ( select value db_cpu from sys.V$SYS_TIME_MODEL where stat_name = 'DB CPU'),
  ( select value dbt from sys.V$SYS_TIME_MODEL where stat_name = 'DB time'),
  ( select value parse from sys.V$SYS_TIME_MODEL where stat_name = 'parse time elapsed'),
  ( select value hard from sys.V$SYS_TIME_MODEL where stat_name = 'hard parse elapsed time'),
  ( select value java from sys.V$SYS_TIME_MODEL where stat_name = 'Java execution elapsed time'),
  ( select value plexec from sys.V$SYS_TIME_MODEL where stat_name = 'PL/SQL execution elapsed time'),
  ( select value plcomp from sys.V$SYS_TIME_MODEL where stat_name = 'PL/SQL compilation elapsed time'),
  ( select value rman from sys.V$SYS_TIME_MODEL where stat_name = 'RMAN cpu time (backup/restore)'),
  ( select value nobind from sys.V$SYS_TIME_MODEL where stat_name = 'hard parse (bind mismatch) elapsed time');

col usage for a15
-- Correction based on SR #7529530.993
select
'session_cached_cursors' parameter,
lpad(value, 5) value,
nvl(to_char(100 * used/value, '9999999999'), '       0') || '%' usage
from
( select
max(s.value) used
from
sys.v$statname n,
sys.v$sesstat s,
sys.v$session sn
where
n.name = 'session cursor cache count' and
s.statistic# = n.statistic# and
sn.SID = s.SID and
sn.username not in ('DBSNMP', 'SYS')
),
( select
value
from
sys.v_$parameter
where
name = 'session_cached_cursors')
union all
select
  'open_cursors',
  lpad(value, 5),
  to_char(100 * used / value,  '9999990') || '%'
from
  ( select
      max(sum(s.value))  used
    from
      sys.v_$statname  n,
      sys.v_$sesstat  s
    where
      n.name in ('opened cursors current') and
      s.statistic# = n.statistic#
    group by
      s.sid
  ),
  ( select
      value
    from
      sys.v_$parameter
    where
      name = 'open_cursors'
  );

break on report;
compute sum of "Open cursors" on report;

col user_name for a30
SELECT user_name, sid, count(*) "Open cursors"
FROM v$open_cursor
where user_name is not null and
user_name not in ('SYS')
GROUP BY user_name, sid
ORDER BY count(*) desc;

prompt .
set feedb on
-- execute tune.free_list;

prompt ======================================================================
prompt .         USER COMMITS/USER ROLLBACKS RATIO (GV$SYSSTAT)
prompt ======================================================================

column u_commit   for 999,999,999,999 heading "User Commits"
column u_rollback for 999,999,999,999 heading "User Rollbacks"
select inst_id, 
       sum(decode(name,'user commits',value,0)) u_commit, 
       sum(decode(name,'user rollbacks',value,0)) u_rollback 
from   gv$sysstat 
where  name in ('user commits','user rollbacks')
group by inst_id;

prompt ======================================================================
prompt .            UNDO SEGMENT LISTING (DBA_ROLLBACK_SEGS)
prompt ======================================================================

column "Tablespaces" format a20
column "Segments" format a20
column "Status" format a7
column "Size, kb" format a11
column "Status" format a7
column "HW Mark, kb" format a11
column "Init, kb" format a8
column "Next, kb" format a8
column "PCT_incr" format a8

select substr(tablespace_name,1,10)          "Tablespaces",
       substr(segment_name,1,20)             "Segments",
       to_char(b.rssize/1024, '99,999,999')  "Size, kb",
       substr(a.status,1,7)                  "Status",
       to_char(hwmsize/1024, '99,999,999')   "HW Mark, kb",
       to_char(initial_extent/1024,'999,999') "Init, kb",
       to_char(next_extent/1024,'999,999')    "Next, kb",
       to_char(pct_increase,'99,999')        "PCT_incr"
from sys.dba_rollback_Segs a, sys.v$rollstat b
where a.segment_id = b.usn(+)
order by 1,2;

set feedb on
-- prompt ======================================================================
-- prompt .        UNDO SPACE USAGE DURING LAST 5 DAYS (V$UNDOSTAT)
-- prompt ======================================================================
-- prompt . Note: First and last lines contain not complete day.
-- prompt . Note: ORA-1555 means "Snapshot too old", check UNDO_RETENTION param.
-- prompt . Be lenient for Max Trans Length, it has cumulative value (MAXQUERYLEN)
-- prompt . for all executions of this statement, SR #7458023.994

-- -- -- Applicable for all editions (EE, SE), sensible for instance restart
-- column "Number of transactions" format 999,999,999,999
-- select inst_id, trunc(begin_time) "Day", 
-- round(sum(undoblks*dbs.value/1048576), 2) "Undo, Mb", 
-- sum(txncount) "Number of transactions",
-- max(maxquerylen) "Max Tran Length, sec",
-- sum(ssolderrcnt) "ORA-1555 counted"
-- from sys.gv$undostat,
-- (SELECT value FROM v$parameter WHERE name = 'db_block_size') dbs
-- group by inst_id, trunc(begin_time)
-- order by inst_id, trunc(begin_time) desc;

prompt ======================================================================
prompt .       UNDO SPACE USAGE DURING LAST 9 DAYS (DBA_HIST_UNDOSTAT)
prompt ======================================================================
prompt . Note: First and last lines contain not complete day.
prompt . Note: ORA-1555 means "Snapshot too old", check UNDO_RETENTION param.
prompt . Be lenient for Max Trans Length, it has cumulative value (MAXQUERYLEN)
prompt . for all executions of this statement, SR #7458023.994

-- It has a time restriction due to AWR bug, holding too old records.
-- Independend of instance restarts.

column "Number of transactions" format 999,999,999,999
break on instance_number skip 1
select instance_number, trunc(begin_time) "Day", 
round(sum(undoblks*dbs.value/1048576), 2) "Undo, Mb", 
sum(txncount) "Number of transactions",
max(maxquerylen) "Max Tran Length, sec",
sum(ssolderrcnt) "ORA-1555 counted"
from sys.dba_hist_undostat,
(SELECT value FROM v$parameter WHERE name = 'db_block_size') dbs
where begin_time > sysdate - 9
group by instance_number, trunc(begin_time)
order by instance_number, trunc(begin_time) desc;

prompt ======================================================================
prompt .   Undo Tablespace Retention Mode (DBA_TABLESPACES)
prompt ======================================================================
prompt . Think twice if you want to use GUARANTEE mode - do you really need it?

col tablespace_name format a20
col retention for a15
select tablespace_name, retention from dba_tablespaces where contents = 'UNDO';

prompt ======================================================================
prompt .   CURRENT PARAMETERS AND CONDITION FOR USING FLASHBACK 
prompt .     V$UNDOSTAT, V$PARAMETER, V$DATAFILE, V$TABLESPACE
prompt ======================================================================

set head off feedb off
select 'Estimated Size for 24 hours  Flashback  is: '||round((select avg(UNDOBLKS) 
  FROM (select TO_CHAR(begin_time,'dd,mm,yy hh24:mi:ss'), undoblks
    FROM sys.v$undostat
    ORDER BY begin_time desc) 
    WHERE rownum <241)*(select value 
      FROM sys.v$parameter
      WHERE name='db_block_size')*240 /1024/1024,2)||' Mb' from dual;
    
select 'Estimated Size for 30 minutes Flashback is: '||round((select avg(UNDOBLKS) 
  FROM (select TO_CHAR(begin_time,'dd,mm,yy hh24:mi:ss'), undoblks
    FROM sys.v$undostat
    ORDER BY begin_time desc) 
    WHERE rownum <4)*(select value 
      FROM sys.v$parameter
        WHERE name='db_block_size')*3 /1024/1024,2)||' Mb' from dual;

select '.       Current size of UNDO_TABLESPACE is: '||bytes/1024/1024||' Mb'
  from sys.v$datafile df, sys.v$tablespace ts
  where df.ts# = ts.ts# and ts.name = (select upper(value) from sys.v$parameter
    where name = 'undo_tablespace');

select '.      Current value for UNDO_RETENTION is: '||value/60||' Minutes'
from sys.v$parameter  where name = 'undo_retention'; 

set head on feedb on
prompt .
prompt ======================================================================
prompt .  Did database have problems with chained rows? 
prompt .       (V_$SYSSTAT, V_$SESSTAT, V_$STATNAME)
prompt ======================================================================
prompt .     Goal: Values should be null or near null, 
prompt .     Goal: they should not increase over time at least

column loc_stat for 999,999,999,999,999 heading "Chained Rows met for current sessions"
column glob_stat for 999,999,999,999,999 heading "Chained Rows met during uptime"

select loc_stat, glob_stat from
(select sum(value) loc_stat from V$SESSTAT a,V$STATNAME b 
where a.statistic#=b.statistic# 
and b.name='table fetch continued row'),
(select sum(value) glob_stat from V$SYSSTAT a,V$STATNAME b 
where a.statistic#=b.statistic# 
and b.name='table fetch continued row'); 

prompt ======================================================================
prompt .  SESSIONS ARE WORKING NOW WITH UNDO (V$TRANSACTIONS, V$SESSIONS, ...)
prompt .      Rolling back to savepoint can cause negative values 
prompt ======================================================================

column segname format a30 heading "Segment Name"
column username format a21
column r_blocks format 99,999,999 heading "Used kb"
column act format a8 heading "Action"
column csid format 999999 heading "SID"

select distinct 'Forward' act, a.name segname, c.sid csid , c.serial#, c.username, 
e.used_ublk*dbs.value/1024 r_blocks
from v$rollname a, v$rollstat b, v$session c, v$sqltext d, v$transaction e,
(SELECT value FROM v$parameter WHERE name = 'db_block_size') dbs
where a.usn = b.usn 
and b.usn = e.xidusn 
and c.taddr = e.addr 
and c.sql_address = d.address 
and c.sql_hash_value = d.hash_value 
and substr(to_char(flag, '0000000X'), -2, 1) = '0'
union all
select distinct 'Rollback', a.name segname, c.sid, c.serial#, c.username, 
e.used_ublk*dbs.value/1024 r_blocks
from v$rollname a, v$rollstat b, v$session c, v$sqltext d, v$transaction e,
(SELECT value FROM v$parameter WHERE name = 'db_block_size') dbs
where a.usn = b.usn 
and b.usn = e.xidusn 
and c.taddr = e.addr 
and c.sql_address = d.address 
and c.sql_hash_value = d.hash_value 
and substr(to_char(flag, '0000000X'), -2, 1) = '8'
order by segname, csid; 

prompt ======================================================================
prompt .          WHICH CONNECTIONS ARE PRESENT NOW (V$SESSION)
prompt ======================================================================
prompt .    Note: NONE means shared, but not active sessions
prompt .

select server "Server", count(*) "Connections"
from sys.v$session 
where username is not null
group by server; 

prompt ======================================================================
prompt .   SESSIONS HAVE BEEN ALTERED (V$SESSION, V$SESS_OPTIMIZER_ENV ...)
prompt ======================================================================
prompt .    For details check "altered_sessions.sql" report
prompt .

col init_parameter for a30
col username for a15
col altered_sessions for 999999 heading "Altered Sessions"

select c.username, a.name init_parameter , count(*) altered_sessions
from v$ses_optimizer_env a 
join v$sys_optimizer_env b on a.id=b.id 
join v$session c on a.sid=c.sid 
where a.value <> b.value
and c.username is not null
and c.username not in ('SYS','SYSTEM','DBSNMP')
group by c.username, a.name
order by 1, 2;

col Protocol for a60
prompt ======================================================================
prompt .    GENERAL SHARED SERVER CONFIGURATION (V$DISPATCHER_CONFIG)
prompt ======================================================================
prompt .

select dispatchers, connections, sessions, pool from V$dispatcher_config;

col abc for a50 heading "Dedicated Server Connection Reservation"
select 'Sessions - Shared Server Sessions = '||
to_char((select to_number(value) from sys.v_$parameter where name = 'sessions') - (select to_number(value) from sys.v_$parameter where name = 'shared_server_sessions')) "abc"
from dual;

prompt ======================================================================
prompt .    CONTENTION FOR DISPATCHER PROCESSES (V$DISPATCHER)
prompt ======================================================================
prompt .    Goal:    Busy rate should be < 50%
prompt .

declare 
  disp		 number;
begin
dbms_output.enable(32000);
select count(*) into disp from v$dispatcher;
dbms_output.put_line('.   Recommendation: Start more dispatchers (Current setting: '||disp||' )');
dbms_output.put_line('.   dispatchers = "(pro=tcp)(dis=5)(con=1000)" in init.ora file');
dbms_output.put_line('.   or ALTER SYSTEM SET dispatchers = '||chr(39)||'(pro=tcp)(dis=5)(con=1000)'||chr(39)||';');
dbms_output.put_line('.');
end;
/

column "Protocol" format a60
column "Total busy rate" format a15
column "Average Wait Time" format a17

select substr(network, instr(network, 'PROTOCOL', 1)-1 ,62) "Protocol",
sum(busy),sum(idle), 
round((sum(busy)/(sum(busy)+sum(idle)))*100,4)||'%' "Total busy rate"
from v$dispatcher
group by network
order by "Total busy rate" desc;

prompt ========================================================================
prompt . CONTENTION FOR DISPATCHER PROCESSES (V$DISPATCHER, V$QUEUE)
prompt ========================================================================
prompt . Goal: Average dispatcher's wait times should not increase over time
prompt .

declare 
  disp		 number;
begin
dbms_output.enable(32000);
select count(*) into disp from v$dispatcher;
dbms_output.put_line('.   Recommendation: Start more dispatchers (Current setting: '||disp||' )');
dbms_output.put_line('.   dispatchers = "(pro=tcp)(dis=5)(con=1000)" in init.ora file');
dbms_output.put_line('.   or ALTER SYSTEM SET dispatchers = '||chr(39)||'(pro=tcp)(dis=5)(con=1000)'||chr(39)||';');
dbms_output.put_line('.');
end;
/

column awt format a26 heading "Average Wait Time "
select substr(network, instr(network, 'PROTOCOL', 1)-1 ,66) "Protocol",
decode(sum(totalq),0,'No Responses',
round(sum(wait)/sum(totalq),5)||' -- 1/100 of seconds') awt
from v$queue q, v$dispatcher d
where q.type='DISPATCHER'
and q.paddr=d.paddr
group by network
order by awt desc;

select round(sum(wait)/sum(totalq),5) "Average -- 1/100 of seconds"
from v$queue q, v$dispatcher d
where q.type='DISPATCHER'
and q.paddr=d.paddr;

prompt ======================================================================
prompt . CONTENTION FOR SHARED SERVER PROCESSES (V$QUEUE, V$SHARED_SERVER)
prompt ======================================================================
prompt .  Goal: Average shared server wait time should not increase over time
prompt .

declare 
  sh_server	 number;
begin
dbms_output.enable(32000);
select count(*) into sh_server from v$shared_server;
dbms_output.put_line('.   Recommendation: Start more shared servers (Current setting: '||sh_server||' )');
dbms_output.put_line('.   shared_servers = # in init.ora file');
dbms_output.put_line('.   or alter system set shared_servers=#; ');
dbms_output.put_line('.   Generally speaking, amount of dispatchers should be connections/10');
dbms_output.put_line('.');
end;
/

prompt . Measure on a queue level
select decode(totalq,0,'No Responses',
       round(wait/totalq,5)||' -- 1/100 of seconds') "Average Wait Time per request"
from sys.v_$queue q
where q.type='COMMON';

prompt . Measure on shared server level
select round(sum(busy)/(sum(busy) + sum(idle)),5) "Average -- 1/100 of seconds"
from v$shared_server;


prompt ======================================================================
prompt .        EVENTS FOR CIRCUITS AND DISPATCHERS (V$SYSTEM_EVENT)
prompt ======================================================================
prompt . Events such as virtual circuit status and dispatcher timer can be used 
prompt . to detect potential problems with shared servers and dispatchers. 
prompt .

COL time_waited FORMAT 999999999999 heading "Total Time| 1/100 sec"
COL event FORMAT a30;
COL waits FORMAT 99999999990 heading "Waits| Number"
COL timeouts FORMAT 99999990 heading "Timeouts| Number"
COL average FORMAT 99999990 heading "Average| 1/100 sec"

SELECT event "Event", time_waited, total_waits
   "Waits", average_wait "Average", total_timeouts "Timeouts"
FROM V$SYSTEM_EVENT
WHERE event IN (
      SELECT name FROM v$EVENT_NAME WHERE name LIKE '%
         dispatcher%'
      OR name LIKE '%circuit%' OR name LIKE '%SQL*Net%'
) ORDER BY EVENT;

execute tune.redo

prompt ======================================================================
prompt .     ORACLE PARALLEL QUERY ACTIVITY (V$PQ_SYSSTAT, V$PQ_SLAVE)
prompt ======================================================================
prompt . If "Server Busy" is consistently less then "PARALLEL_MIN_SERVER"
prompt .    you could reduce "PARALLEL_MIN_SERVER"
prompt . If "Server Busy" is greater than "PARALLEL_MIN_SERVER" and
prompt .    "Server Started" grows over time
prompt .    you need to increase "PARALLEL_MIN_SERVER"
prompt . If "Server Busy" is near "PARALLEL_MAX_SERVER"
prompt .    yuo need to increase the "PARALLEL_MAX_SERVER"
prompt .

execute tune.opq;
column stat_parall format a35
set head off feedb off
select substr(statistic, 1, 35) stat_parall, value value1 from sys.v_$pq_sysstat
where statistic like 'Servers%'
or statistic like '%Initiated%'
union all
select 'Sum Seconds for Parallel Operations' stat_parall, 
nvl(sum(cpu_secs_total), 0) VALUE1
from sys.v_$pq_slave;
prompt .
set head on feedb on

prompt ======================================================================
prompt .         ASM (V$ASM_DISKGROUP, V$ASM_DISK, V$ASM_CLIENT) 
prompt ======================================================================
prompt . It would be informative to start this select by ASM instance

set lines 400 pages 120 trimsp on
col name for a25 heading "Group Name"
col total_mb for 999,999,999
col free_mb for 999,999,999
select group_number, name, state, total_mb, free_mb
from v$asm_diskgroup
order by 1;

col path for a23
col label for a10
col avg_reads for 999.99 heading "Reads, %"
col avg_writes for 999.99 heading "Writes, %"
col HEADER_STATUS for a10 heading "Header"
col TOTAL_MB for 999,999 

select group_number, name, disk_number, path, read_errs, write_errs,
reads*100/sum_reads avg_reads, writes*100/sum_writes avg_writes, 
HEADER_STATUS, MOUNT_STATUS, TOTAL_MB
from v$asm_disk,
(select sum(reads) sum_reads from v$asm_disk),
(select sum(writes) sum_writes from v$asm_disk)
order by 1, 3;

col instance_name for a25
select group_number, instance_name, db_name, status
from v$asm_client;

prompt ======================================================================
prompt .       DATABASE FILE - READ, WRITE AND AUTOEXTEND STATUS 
prompt .          (V$DATAFILE, V$FILESTAT, DBA_DATA_FILES)
prompt ======================================================================

column "Datafile" format a50
column autoextensible format a10 heading "AUTOEXTEND"
select substr(name,1,50) "Datafile",phyrds,phyblkrd,phywrts,phyblkwrt, autoextensible 
from v$datafile a,v$filestat b, dba_data_files c
where a.file#=b.file# and
a.file# = c.file_id
order by 1;

column "Datafile" format a40
select substr(name,1,3) "Datafile",sum(phyrds),sum(phyblkrd),sum(phywrts),sum(phyblkwrt)
from v$datafile a,v$filestat b
where a.file#=b.file#
group by substr(name,1,3);

prompt ======================================================================
prompt .              SESSION I/O (V$SESS_IO)
prompt ======================================================================

column logical format 999,999,999,999
column physical format 999,999,999,999
column ratio format 999.99

select 'SUMMARY OF ALL SESSION I/O: ' status, sum(consistent_gets)+sum(block_gets) "Logical",
       sum(physical_Reads) "Physical",
        ((sum(consistent_Gets)+sum(block_gets))/
                (sum(consistent_Gets)+sum(block_Gets)+sum(physical_reads)
              )
        )*100 "Ratio"
from v$sess_io;

prompt ======================================================================
prompt TABLESPACE USAGE (DBA_DATA_FILES, DBA_FREE_SPACE, V_$BACKUP, DBA_TABLESPACES)
prompt ======================================================================

column "Tablespace" format a18
column "Size, Mb" format a10
column "Used, Mb" format a10
column "Free, Mb" format a10
column "Used %" format a6
column "status" format a10 heading "Backup|status"
column "extent_management" format a10 heading "Extent|Management"
column "segment_space_management" format a10 heading "Segment|Management"
column ts_status format a10 heading "Tablespace|Status"
column bigfile for a7
select  distinct substr(tablespace_name,1,18)                  "Tablespace",
        to_char(bytes/1024/1024,'9,999,999')                   "Size, Mb",
        to_char((bytes-free)/1024/1024,'9,999,999')	       "Used, Mb",
        to_char((free/1024/1024),'9,999,999')                  "Free, Mb",
        to_char((100*(bytes-free)/bytes),'999.99')             "Used %",
-- 	status,
        extent_management,
	segment_space_management,
	ts_status,
        bigfile
from temprpt_status
order by 5 desc;

prompt ======================================================================
prompt .    POSSIBLE TABLESPACE RECLAIMING (DBA_ADVISOR_RECOMMENDATIONS)
prompt ======================================================================
prompt . Be sure, that "auto optimizer stats" and "auto space advisor" jobs enabled
prompt . and have been worked, see "AUTOMATIC MAINTENANCE TASKS" section
prompt . Tablespaces should have Segment Management Auto.

col allocated_space for 999,999,999.99 heading "Allocated space, Mb"
col reclaimable_space for 999,999,999.99 heading "Reclaimable space, Mb"

break on report;
compute sum of reclaimable_space on report;

select tablespace_name, 
allocated_space/1024/1024 allocated_space, 
reclaimable_space/1024/1024 reclaimable_space 
from table(dbms_space.asa_recommendations('TRUE', 'TRUE', 'ALL'));

prompt ======================================================================
prompt . DEFAULT TABLESPACES FOR THE WHOLE DATABASE (DATABASE_PROPERTIES)
prompt ======================================================================

col property_value for a30

select property_name, property_value
from database_properties
where property_name in ('DEFAULT_TEMP_TABLESPACE', 'DEFAULT_PERMANENT_TABLESPACE');

prompt ======================================================================
prompt . TEMPORARY TABLESPACES USAGE IN GENERAL (DBA_TEMP_FILES, V_$TEMPFILE)
prompt ======================================================================
prompt . alter tablespace TEMP shrink space keep 500M; -- for example

col tablespace_name format a20 heading "Tablespace"
col file_name format a50
col d.bytes/1024/1024 format 999,999.99 heading "Size, Mb"
col d.user_bytes/1024/1024 format 999,999.99 heading "Used, Mb"
col usage format 999.99 heading "Usage, %"
col "Inc, Mb" for 999.999
col "Max Mb" for 999,999
col "status" format a9 heading "Status"

select tablespace_name, d.bytes/1024/1024, 
d.user_bytes/1024/1024, d.user_bytes*100/d.bytes usage, 
nvl(increment_by, 0)/1024/1024 "Inc, Mb", 
maxbytes/1024/1024 "Max Mb", d.status, file_name
from dba_temp_files d, v_$tempfile v
where d.file_name = v.name
order by 1;

prompt ======================================================================
prompt .             TEMPORARY TABLESPACES USAGE RIGHT NOW
prompt ======================================================================

column username format a20
column "Sort usage, Mbytes" format 999,999,999,999
break on report;
compute sum of "Sort usage, Mbytes" on report;

select session_num serial, username, segtype, CONTENTS, blocks*dbs.VALUE/1024/1024 "Sort usage, Mbytes", tablespace
from V$TEMPSEG_USAGE, 
(SELECT value FROM v$parameter WHERE name = 'db_block_size') dbs;

prompt ======================================================================
prompt .          FREE SPACE FRAGMENTATION (DBA_FREE_SPACE)
prompt ======================================================================

column "Available  Size" format a15
column "Fragments" format a12
column "Average_size" format a17
column "Max" format a17
column "Min" format a17
select substr(b.tablespace_name,1,15)       "Tablespace",
       to_char(b.frag_sum/1024,'99,999,999,999') "Available  Size, kb",
       to_char(frag,'999,999,999')              "Fragments",
       to_char(c.avg_size/1024,'99,999,999,999') "Average_size, kb",
       to_char(max/1024,'99,999,999,999')          "Max, kb",
       to_char(min/1024,'99,999,999,999')          "Min, kb"
from  temprpt_Frag1 b, temprpt_frag2 c
where  b.tablespace_name=c.tablespace_name
order by 3 desc ;

set head on feedb on
prompt ======================================================================
prompt .   ERROR - These segments owner differs from the OBJECT owner:
prompt ======================================================================
-- corrected by SR 3-4681320721: Ownership is not equali to user
set lines 400;
select substr(d.username,1,15) Owner_, substr(o.name,1,15) Name_,
decode(o.type#, 0, 'NEXT OBJECT', 1, 'INDEX', 2, 'TABLE', 3, 'CLUSTER',
4, 'VIEW', 5, 'SYNONYM', 6, 'SEQUENCE',
7, 'PROCEDURE', 8, 'FUNCTION', 9, 'PACKAGE',
11, 'PACKAGE BODY', 12, 'TRIGGER', 'UNDEFINED') Type_obj,
substr(dd.username,1,10) user_,
substr(v.name,1,50) tablespacename
from sys.obj$ o, sys.tab$ t, sys.seg$ s, dba_users d, dba_users dd, v$datafile v
where o.obj#=t.obj#
and t.ts#=s.ts#
and t.file#=s.file#
and t.block#=s.block#
and o.owner#!=s.user#
and o.owner#=d.user_id
and s.user#=dd.user_id
and o.namespace=v.file#;

prompt ======================================================================
prompt . Warning: OBJECT name clashes with SCHEMA name - Bug:2894111
prompt ======================================================================
prompt .  (ie: objects which could affect name resolution for statements) 

column object_type format a15
column Obj_Name format a60
select object_type, substr(owner||'.'||object_name,1,62) Obj_Name
from dba_objects, dba_users
where object_name=username and (owner=username OR owner='PUBLIC');

prompt ======================================================================
prompt .   ERROR - These segments will fail during NEXT EXTENT (DBA_SEGMENTS)
prompt ======================================================================

column "Segment" format a25
column "Type" format a8
column "NEXT Need" format a12
column "MAX Avail" format a12
column "Owner" format a20
select substr(a.tablespace_name,1,11)       "Tablespace",
       substr(a.owner, 1,20)                "Owner",
       substr(a.segment_name,1,25)          "Segment",
       substr(segment_type,1,8)             "Type",
       to_char(a.next_extent,'999,999,999') "NEXT Need",
       to_char(b.next_ext,'999,999,999')    "MAX Avail"
from sys.dba_segments a, temprpt_next_vw b
where a.tablespace_name=b.tablespace_name
and   b.next_ext < a.next_extent;

prompt ======================================================================
prompt .     WARNING - These segments > 70% of MAX EXTENT (DBA_SEGMENTS)
prompt ======================================================================

select substr(tablespace_name,1,11)    "Tablespace",
       substr(owner, 1,10)             "Owner",
       substr(segment_name,1,25)       "Segment",
       substr(segment_type,1,7)        "Type",
       extents                         "Used",
       max_extents                     "Max"
from   sys.dba_segments
where   (extents/decode(max_extents,0,1,max_extents))*100 > 70
  and   max_extents >0;

prompt ======================================================================
prompt . TABLESPACES IN UNRECOVERABLE STATE (V$DATAFILE; DBA_DATA_FILES)
prompt ======================================================================
prompt . Not filled archive redo logs due to NOLOGGING changes or direct loads
prompt . Make sure that last backup is older than these actions
prompt . Check the time of SCN like: SELECT SCN_TO_TIMESTAMP(15158776029) FROM dual;

column arch format a20 heading "Archive redo log|corrupt time"
column tablespace_name format a20 heading "Tablespace"
column UNRECOVERABLE_CHANGE# format 999999999999999999
SELECT tablespace_name, UNRECOVERABLE_CHANGE#, 
       TO_CHAR(UNRECOVERABLE_TIME, 'dd-mm-yyyy hh24:mi:ss') arch
FROM   V$DATAFILE, dba_data_files
where file_id = file# and
UNRECOVERABLE_TIME is not null
order by UNRECOVERABLE_TIME desc;

prompt ======================================================================
prompt .       SAVED RMAN CONFIGURATION (V_$RMAN_CONFIGURATION)
prompt ======================================================================
prompt .
col name for a35 heading "RMAN Parameter"
col value for a70

select name, value from V_$RMAN_CONFIGURATION
order by conf#;

prompt ======================================================================
prompt .   RMAN COMPRESSION ALGORITHM (V$RMAN_COMPRESSION_ALGORITHM)
prompt ======================================================================
prompt . Use "CONFIGURE COMPRESSION ALGORITHM 'HIGH';;
prompt . DEFAULT compression ratio is between MEDIUM and HIGH

col algorithm_name for a7 heading "Name"
col algorithm_description for a34 heading Description
col IS_VALID for a8
col REQUIRES_ACO for a12 heading "Requires|Advanced|Compression|Option"
select algorithm_name, algorithm_description, IS_VALID, REQUIRES_ACO
from V$RMAN_COMPRESSION_ALGORITHM;

prompt ======================================================================
prompt .   RMAN ENCRYPTION ALGORITHM (V$RMAN_ENCRYPTION_ALGORITHMS)
prompt ======================================================================
prompt . Use "CONFIGURE ENCRYPTION ALGORITHM 'AES256';;

col algorithm_name for a18 heading "Name"
col algorithm_description for a24 heading Description
col IS_DEFAULT for a10
col RESTORE_ONLY for a12
select algorithm_name, algorithm_description, IS_DEFAULT, RESTORE_ONLY
from V$RMAN_ENCRYPTION_ALGORITHMS;

prompt ======================================================================
prompt .   Existed RMAN Backup Pieces encrypted? (V$BACKUP_PIECE)
prompt ======================================================================

col encrypted for a10 heading "Encrypted"

select encrypted, count(*) from v$backup_piece where deleted = 'NO'
group by encrypted;

prompt ======================================================================
prompt . DATAFILE CORRUPTIONS (V$BACKUP_CORRUPTION, V$DATABASE_BLOCK_CORRUPTION,
prompt . V$COPY_CORRUPTION, V$BACKUP_PIECE)
prompt ======================================================================
prompt . Data block corruptions expected during RMAN backup.
prompt . V$BACKUP_CORRUPTION view describes corrupted blocks 
prompt . which existed in some particular backup.
prompt . You can't cleanup v$backup_corruption unless you recreate your controlfile.
prompt . The v$database_block_corruption view represents any corruptions found during
prompt . last backup or validate command. If it is empty - there is no corruptions right now.
prompt . For restore use RMAN command like:
prompt . BLOCKRECOVER DATAFILE 8 BLOCK 13 DATAFILE 2 BLOCK 19;;
prompt . or BLOCKRECOVER CORRUPTION LIST; if you have several blocks;
prompt . You can recheck it manually by "backup validate database;".
prompt . Or: select owner, object_name, object_type from dba_objects where object_id=block_num;
prompt . analyze <object type> <object name> validate structure; against that object than.
prompt . See Note 336133.1, 298137.1, Bug 4101740 description for details.

col corruption_type for a15 heading "Corruption Type"
col corruption_change# for 999999999999999 heading "Corruption SCN"
col name for a55 heading "Datafile name"

prompt .
prompt . History (there was):
select distinct piece#, file#, block#, blocks, corruption_type, corruption_change#
from v$backup_corruption;

prompt . History (there is and when):
select distinct c.piece#, c.file#, c.block#, c.blocks, c.corruption_type, c.corruption_change#, 
to_char(p.start_time, 'dd-mm-yy hh24:mi') date_time
from v$backup_corruption c, v$backup_piece p
where p.stamp = c.stamp
order by date_time desc;

prompt . Present (in backup pieces)
select /*+ rule */ distinct b.file#, b.block#, b.blocks, b.corruption_type, f.name, corruption_change#
from v$database_block_corruption b, v$datafile f
where b.file# = f.file#;

prompt . History (during BACKUP COPY)
select distinct file#, block#, blocks, corruption_type, corruption_change#
from v$copy_corruption;

prompt ======================================================================
prompt .  Whether datafiles require media recovery (V$DATAFILE_HEADER)
prompt ======================================================================
prompt . 

col FILE# for 99999
col STATUS for a10 wrap
col ERROR for a30 wrap
col RECOVER for a7
col name for a40 heading "File name"

SELECT FILE#, STATUS, ERROR, RECOVER, TABLESPACE_NAME, NAME 
FROM V$DATAFILE_HEADER 
WHERE RECOVER = 'YES' 
OR(RECOVER IS NULL AND ERROR IS NOT NULL);

prompt ======================================================================
prompt .            Last 10 RMAN problems (V_$RMAN_STATUS)
prompt ======================================================================
prompt . 

col times for a14 heading "Operation time"
col status for a23
col operation for a40

select /*+ RULE */ * from (select to_char(start_time, 'dd-mm-yy hh24:mi') times, operation, status
from V_$RMAN_STATUS
where status != 'COMPLETED'
order by start_time desc)
where rownum < 11;

prompt ======================================================================
prompt . Block Change Tracking usage (V_$BLOCK_CHANGE_TRACKING)
prompt ======================================================================
prompt . Use "ALTER DATABASE DISABLE BLOCK CHANGE TRACKING;" if you don't need
prompt . It can be used for 8 incremental level 1 backups ONLY

column filename format a60
column bytes/1024/1024 format 9999 heading "Mbytes"
select status, filename, bytes/1024/1024 from V_$BLOCK_CHANGE_TRACKING;

prompt ======================================================================
prompt . Block Change Tracking efficiency last 10 days (V$BACKUP_DATAFILE)
prompt ======================================================================

column tra_usa format 999 heading "Tracking usage, %"
select sumb/suma*100  tra_usa from
(select sum(blocks_read) suma from v$backup_datafile where completion_time < SYSDATE - 10),
(select sum(blocks_read) sumb from v$backup_datafile where used_change_tracking = 'YES' and completion_time < SYSDATE - 10);

prompt ======================================================================
prompt . Flash recovery area usage and limits (V$FLASH_RECOVERY_AREA_USAGE, ...)
prompt ======================================================================
prompt . FRA may contain obsolete flashback logs if any
prompt . Compare db_flashback_retention_target with oldest_flashback_time (FLASHBACK DB section)

set feedb off head off
select '.    Current value for DB_RECOVERY_FILE_DEST_SIZE is: '||round(value/1024/1024)||' Mb'
from sys.v$parameter  where name = 'db_recovery_file_dest_size'; 
select '. Current value for DB_FLASHBACK_RETENTION_TARGET is: '||value/60||' hours'
from sys.v$parameter  where name = 'db_flashback_retention_target'; 
set feedb on head on

col fra_name format a25
col allsize for 999,999,999 head "Size, MB"
col usedallsize for 999,999 head "Used all, MB"
col usedsize for 999,999 head "Used pure, Mb"
select name fra_name,
round(space_limit/1024/1024) allsize,
round(space_used/1024/1024) usedallsize,
round(space_used - space_reclaimable)/1024/1024 usedsize,
round((space_used - space_reclaimable)/space_limit * 100, 1) "Used pure, %"
from v$recovery_file_dest
order by name;

col percent_space_used for 99.9 head "Used %" 
Select file_type, percent_space_used,
percent_space_reclaimable as "Reclaimable %",
number_of_files as "FILES" 
from v$flash_recovery_area_usage;

prompt ======================================================================
prompt . LIST OF OBJECTS HAVING > 40 EXTENTS (DBA_EXTENTS, ALL_TABLES)
prompt ======================================================================

Column "Tablespace" format a10
Column "Owner" format a11
Column "Object" format a20
Column "Type" format a5
column count format 99999;
column "Initial, kb" format 9,999,999
column "Next, kb" format 9,999,999
column "Size, kb" format 999,999,999
break on "Tablespace"
break on "Owner" skip 1
-- select /*+ rule */ substr(a.tablespace_name,1,10) 	"Tablespace" ,
--        substr(a.owner,1,11) 		"Owner",
--        substr(segment_name,1,20)    	"Object",
--        substr(a.segment_type,1,5)     	"Type",
--        count(*)                     	"Count",
--        max(initial_extent)/1024		"Initial, kb",
--        max(next_extent)/1024 		"Next, kb",
--        sum(bytes)/1024 			"Size, kb"
-- from sys.dba_extents a, all_tables b
-- where a.owner = b.owner and a.segment_name = b.table_name
-- group by a.tablespace_name, a.owner, a.segment_name, a.segment_type
-- having count(*)>40
-- order by 1,2,5 desc;

prompt ======================================================================
prompt .     LIST OF UNUSABLE INDEXES (V$OBJECT_USAGE) - NONSYSTEM LEVEL
prompt ======================================================================
prompt .  Goal: The most of indexes have be usable
prompt .
prompt .       It's a result of commands: 
prompt .       alter index "OWNER"."INDEX" monitoring usage;;
prompt . Recommendation: You can drop unusable indexes, if customer agree
prompt .       Let application works with database before decision please ...
prompt .
break on report;
compute sum of bytes on report;
set lines 400 pages 200
column OWNER format a15
column USED format a4
column MONITOR format a7
column TABLE_NAME format a30
column INDEX_NAME format a30
column BYTES format 999,999,999 heading "kBytes"

select us.name OWNER, t.name TABLE_NAME, io.name INDEX_NAME,
       seg.bytes/1024 BYTES,
       decode(bitand(i.flags, 65536), 0, 'NO', 'YES') MONITOR,
--       decode(bitand(ou.flags, 1), 0, 'NO', 'YES') USED,
       ou.start_monitoring START_MONITOR,
       ou.end_monitoring END_MONITOR
from sys.obj$ io, sys.obj$ t, sys.ind$ i, sys.object_usage ou, sys.user$ us, sys.dba_segments seg 
where us.name not in ('SYS', 'SYSTEM', 'OUTLN', 'CTXSYS', 'ORDSYS', 'MDSYS', 'OSE$HTTP$ADMIN', 'AURORA$JIS$UTILITY$', 'WMSYS', 'DBSNMP', 'EXFSYS')
  and i.obj# = ou.obj#
  and io.obj# = ou.obj#
  and t.obj# = i.bo#
  and us.user# = io.owner#
  and decode(bitand(ou.flags, 1), 0, 'NO', 'YES') = 'NO'
  and seg.owner = us.name
  and seg.segment_name = io.name
order by 1, 2, 3;

prompt ======================================================================
prompt .        MONITORING USER TABLES LIST (DBA_TABLES)
prompt ======================================================================
prompt . Note: Use "ALTER TABLE AAA.FOO MONITORING;" for turning on
prompt .       It can felp optimizer if statistics don't collect regulary

select all_tab "All non-system tables", mon_tab "Monitoring non-system tables" from 
(select count(*) all_tab from sys.dba_tables where owner not in ('SYS', 'SYSTEM') or temporary = 'N' or iot_type != 'IOT_OVERFLOW'),
(select count(*) mon_tab from sys.dba_tables where owner not in ('SYS', 'SYSTEM') or monitoring = 'YES' or temporary = 'N' or iot_type != 'IOT_OVERFLOW');

prompt ======================================================================
prompt .   LAST 10 STRUCTURAL CHANGES OF USER OBJECTS (DBA_OBJECTS)
prompt ======================================================================

column object_name for a35
column object_type for a15
column owner format a20 
col last_ddl for a16 heading "Last DDL"
select * from (select owner, object_name, object_type, 
to_char(nvl(last_ddl_time, created), 'dd-mm-yyyy hh24:mi') last_ddl
from dba_objects where owner not in ('SYS', 'SYSTEM') order by nvl(last_ddl_time, created) desc) 
where rownum < 11;

prompt ======================================================================
prompt .   LAST 10 ANALYZED USER TABLES - collected stat (DBA_TABLES)
prompt ======================================================================

column LAST_ANALYZED_ format a16
column owner format a20
column table_name format a40
col last_analyzed for a16 heading "Last Analyzed"

select owner, table_name, to_char(last_analyzed, 'dd-mm-yyyy hh24:mi') last_analyzed
  from (select owner, table_name, last_analyzed from sys.dba_tables
  where owner not in ('SYS', 'SYSTEM', 'DBSNMP', 'WMSYS') and last_analyzed is not null
  order by last_analyzed desc, owner, table_name)
where rownum < 11;

prompt ======================================================================
prompt .   Statistics History Availability (DBMS_STATS)
prompt ======================================================================
prompt .     History retention is 31 days as default
prompt .     STATISTICS_LEVEL should be TYPICAL or ALL
set head off
col curr_level for a30 
SELECT 'Current level is: '||value curr_level FROM v$parameter WHERE name = 'statistics_level';
set head on
col hist_stat for a44 heading "History available since, DD-MM-YYYY HH24:MI"
col hist_ret for 999 heading "History availabe, days"
col hist_pub for a33 heading "Is collected statistic published?"
select to_char(dbms_stats.get_stats_history_availability, 'DD-MM-YYYY HH24:MI') hist_stat from dual;
select dbms_stats.get_stats_history_retention hist_ret from dual;
select dbms_stats.get_prefs('PUBLISH') hist_pub from dual;

prompt ======================================================================
prompt .    Pending Collected Statistics (DBA_TAB/IND/COL_PENDING_STATS)
prompt ======================================================================
prompt . Publish it: exec dbms_stats.publish_pending_stats(null, null);;
prompt . Publish it: exec dbms_stats.publish_pending_stats('SCOTT', null);;
prompt . Publish it: exec dbms_stats.publish_pending_stats('SCOTT', 'DEPT');;
prompt . Delete it:  exec dbms_stats.delete_pending_ststs (null, null);;
prompt . Change the mode: exec dbms_stats.set_schema_prefs('SCOTT', 'PUBLISH', true);;
prompt . Change the mode: exec dbms_stats.set_table_prefs('SCOTT', 'DEPT', 'PUBLISH', true);;

col pen_tabs for 999999 heading "Pending Tables"
col pen_ind  for 999999 heading "Pending Indexes"
col pen_cols for 999999 heading "Pending Columns"

select owner, count(*) pen_tabs from dba_tab_pending_stats group by owner;
select owner, count(*) pen_ind  from dba_ind_pending_stats group by owner;
select owner, count(*) pen_cols from dba_col_pending_stats group by owner;

prompt ======================================================================
prompt . Analyzing end-user objects accuracy (DBA_TAB_COLUMNS, DBA_TAB_STATISTICS)
prompt ======================================================================
prompt . use "exec DBMS_STATS.UNLOCK_SCHEMA_STATS ('EFECTL');" if you need
prompt . or: "exec dbms_stats.unlock_partition_stats ('SYS', 'TABNAME', 'PARTNAME');"

SELECT histogram, COUNT(*) FROM DBA_tab_columns 
where owner not in ('SYS', 'SYSTEM', 'DBSNMP', 'WMSYS')
GROUP BY histogram;

select owner, OBJECT_TYPE, count(*) "Locked statistics objects"
from dba_tab_statistics
where stattype_locked is not null group by owner, OBJECT_TYPE;

prompt ======================================================================
prompt .      Extension end-user statistic (DBA_STAT_EXTENSION)
prompt ======================================================================
prompt . i.e. multicolumn and expression statistics

col owner for a15
col extension for a60
select owner, table_name, to_char(extension) extension
from dba_stat_extensions
where owner not in ('SYS', 'SYSTEM')
order by 1, 2, 3;

prompt ======================================================================
prompt .         Compressed/encrypted Tablespaces (DBA_TABLESPACES)
prompt ======================================================================
prompt . ALTER TABLESPACE tools DEFAULT NOCOMPRESS;;
prompt . ALTER TABLESPACE tools DEFAULT COMPRESS BASIC;;
prompt . ALTER TABLESPACE tools DEFAULT COMPRESS FOR OLTP;;
prompt . ALTER TABLESPACE tools DEFAULT COMPRESS FOR QUERY/ARCHIVE LOW/HIGH;; -- Exadata only
prompt . Needs COMPATIBLE=11.1.0 at least

col compress_for for a20
col encrypted for a9

select tablespace_name, compress_for, encrypted from dba_tablespaces
where encrypted = 'YES' or 
compress_for is not null
order by 1;

prompt ======================================================================
prompt .                    Securefiles  (DBA_LOBS)
prompt ======================================================================
prompt . Check DB_SECUREFILE parameter (should be PERMITTED at least [DEFAULT])

col deduplication for a5
col encrypt for a7
col compression for a8
col cache for a10

select owner, tablespace_name, encrypt, compression, deduplication, cache, count(*) securefiles 
from dba_lobs
where securefile = 'YES'
group by owner, tablespace_name, encrypt, compression, deduplication, cache
order by owner, tablespace_name, encrypt, compression, deduplication, cache;

prompt ======================================================================
prompt .     Compressed Tables, read-only tables  (DBA_TABLES)
prompt ======================================================================
prompt . ALTER TABLE test.tab1 NOCOMPRESS;;
prompt . ALTER TABLE test.tab1 DEFAULT COMPRESS BASIC;;
prompt . ALTER TABLE test.tab1 DEFAULT COMPRESS FOR OLTP;;
prompt . ALTER TABLE test.tab1 DEFAULT COMPRESS FOR QUERY/ARCHIVE LOW/HIGH;; -- Exadata only
prompt . ALTER TABLE test.tab1 READ ONLY/READ WRITE;;

col table_name for a25
col read_only for a9

SELECT owner, table_name, compression, compress_for, read_only FROM dba_tables
where compression='ENABLED' or read_only='YES'
order by 1, 2;

prompt ======================================================================
prompt .             Wallet state (V$ENCRYPTION_WALLET)
prompt ======================================================================
prompt . Needs for all TDE functionality 

col wrl_type for a10
col wrl_parameter for a40
col status for a20
select * from v$encryption_wallet;

prompt ======================================================================
prompt .               Wallet with PKI (V$WALLET)
prompt ======================================================================
prompt . Wallet with certificates, if one PKI private key is used
prompt . Bug No. 7417294

col dn for a40
col issuer for a30
col status for a6
select dn, issuer, status from v$wallet;

prompt ======================================================================
prompt .     Tables with encrypted columns (DBA_ENCRYPTED_COLUMNS)
prompt ======================================================================
prompt . Needs enabled TDE (open wallet)
prompt . alter system set encryption wallet open identified by "SecPass";;

col SALT for a4
select OWNER, ENCRYPTION_ALG, SALT, count(*) tables from dba_encrypted_columns
group by OWNER, ENCRYPTION_ALG, SALT
order by OWNER, ENCRYPTION_ALG, SALT;

prompt ======================================================================
prompt .   System statistic - collected stat (AUX_STATS$)
prompt ======================================================================
prompt If you have no stat - collect and import it. See Note:149560.1 for details
prompt  it can influent to EXPLAIN PLAN output (CPU Cost, TEMP usage)

column "SYSTEM Statistic status" format a25
column "When collected (MM-DD-YYYY)" format a30

select p1 "SYSTEM Statistic status", p2 "When collected (MM-DD-YYYY)" from 
(select pval2 p1 from sys.aux_stats$ where pname = 'STATUS'),
(select pval2 p2 from sys.aux_stats$ where pname = 'DSTOP');

prompt ======================================================================
prompt .   Fixed table statistic - collected stat (DBA_TAB_COL_STATISTICS)
prompt ======================================================================
prompt . Fixed table statistics should appropriate to physical structure 
prompt . and size of DB
prompt . exec DBMS_STATS.GATHER_FIXED_OBJECTS_STATS;;

col dat for a15 heading "YYYY-MM-DD"
select count(*), to_char(last_analyzed, 'yyyy-mm-dd') dat
from dba_tab_col_statistics
where owner = 'SYS' and
table_name like'X$%'
group by to_char(last_analyzed, 'yyyy-mm-dd')
order by 2 desc;

prompt ======================================================================
prompt .   I/O statistic - collected stat (DBA_RSRC_IO_CALIBRATE)
prompt ======================================================================
prompt . timed_statistics must be set to TRUE
prompt . Asynchronous I/O must be enabled (SETALL)
prompt . Start DBMS_RESOURCE_MANAGER.CALIBRATE_IO if you need

set head off echo off feedb off
col tim_stat for a35
col fil_io for a35
SELECT '    Timed statistics is: '||value tim_stat FROM v$parameter WHERE name = 'timed_statistics'
union
SELECT 'Filesystemio_options is: '||value fil_io FROM v$parameter WHERE name = 'filesystemio_options';
set head on feedb on

col start_time for a14
col end_time for a14
col max_iops for 99999 heading "Reads per sec"
col max_mbps for 99999 heading "Mb/sec"
col max_pmbps for 99999 heading "Mb/sec, large "
col latency for 9999.99 heading "Latency, msec"
col num_physical_disks for 9999

select to_char(start_time, 'dd-mm-yy hh24:mi') start_time,
to_char(end_time, 'dd-mm-yy hh24:mi') end_time,
max_iops, max_mbps, max_pmbps, latency, num_physical_disks
from DBA_RSRC_IO_CALIBRATE;

prompt ======================================================================
prompt .           AWR Policy (DBA_HIST_WR_CONTROL)
prompt ======================================================================
prompt . Default policy: snapshot every hour, retention 8 days
prompt . TOPNSQL is 30 for statistics level TYPICAL and 100 for ALL
prompt . Change it by DBMS_WORKLOAD_REPOSITORY.MODIFY_SNAPSHOT_SETTINGS if you need
set head off feedb off
select '.  Current value for STATISTICS LEVEL is: '||value
from sys.v$parameter  where name = 'statistics_level'; 
set head on feedb on
col retention for 9999 heading "Retention, days"
col snap_intervalh for 999 heading "Interval, hours"
col snap_intervalm for 999 heading "Interval, minutes"

select EXTRACT(HOUR   FROM (snap_interval)) snap_intervalh,
       EXTRACT(MINUTE FROM (snap_interval)) snap_intervalm, 
       EXTRACT(DAY    FROM (retention)) retention, topnsql from DBA_HIST_WR_CONTROL;

prompt ======================================================================
prompt .    Modes of SQL management base (SMB) (DBA_SQL_MANAGEMENT_CONFIG)
prompt ======================================================================
prompt . 
col parameter_name for a40
col parameter_value for a10 heading VALUE

select parameter_name, to_char(parameter_value, '999') parameter_value
from sys.smb$config
union
select name, value from v$parameter where name = 'optimizer_capture_sql_plan_baselines'
union
select name, value from v$parameter where name = 'optimizer_use_sql_plan_baselines';

prompt ======================================================================
prompt .    Check baselines condition (DBA_SQL_PLAN_BASELINES)
prompt ======================================================================
prompt . Maybe you want to evolve baselines by DBMS_SPM.EVOLVE_SQL_PLAN_BASELINE?

col enabled for 999999999
select all_, enabled, accepted, fixed from 
(select count(*) all_ from dba_sql_plan_baselines where enabled = 'YES'),
(select count(*) enabled from dba_sql_plan_baselines where enabled = 'YES'),
(select count(*) accepted from dba_sql_plan_baselines where accepted = 'YES'),
(select count(*) fixed from dba_sql_plan_baselines where fixed = 'YES');

prompt ======================================================================
prompt .    Mode of PL/SQL compilation, user level (DBA_STORED_SETTINGS)
prompt ======================================================================
prompt . For production system should be no DEBUG mode
prompt . Recompile user objects by NATIVE mode if you need more performance
prompt . Use dbmsupgnv.sql or dbmsupgin.sql respectively for complete system recompilation.
prompt . Use PLSQL_NATIVE_LIBRARY_SUBDIR_COUNT and subdirectories d0, d1, d2 ...
prompt . if total number of objects there for complete database exceeds 10000.

column param_value format a22
SELECT owner, param_value, count(*) FROM dba_stored_settings WHERE
param_name = 'plsql_compiler_flags'
and owner not in ('SYS', 'SYSTEM', 'DBSNMP', 'REPADMIN', 'EXFSYS', 'REPCMD', 'WMSYS', 'OUTLN')
group by owner, param_value order by 1, 2;

prompt ======================================================================
prompt .     LIST AND SIZE OF OBJECTS IN RECYCLE BIN (DBA_RECYCLEBIN)
prompt ======================================================================
prompt . use PURGE TABLE emp; for one object, or:
prompt . PURGE RECYCLEBIN; -- clean up trash of current user
prompt . PURGE DBA_RECYCLEBIN; -- clean up all users
prompt . FLASHBACK TABLE emp TO BEFORE DROP RENAME TO emp2; -- for restore

break on report;
compute sum of summ_size on report;

col summ_size for 999,999,999.99 heading "Summary Size, Mb"
select owner, count(*), sum(space*dbs.VALUE/1024/1024) summ_size
from dba_recyclebin,
(SELECT value FROM v$parameter WHERE name = 'db_block_size') dbs
group by owner;

prompt ======================================================================
prompt .             UNUSED END-USER COLUMNS (DBA_TAB_COLS)
prompt ======================================================================
prompt . Remove it if you don't need it yet
prompt . by "alter table AAA.TTT drop unused columns;"
prompt . UNUSED and HIDDEN columns, based on user defined types and function-based indexes
prompt . you can extract "from dba_tab_cols where hidden_column = 'YES'"
prompt . SR #7511715.992

col data_type for a15
col data_length for 999999

select t.owner, t.table_name, data_type, data_length
from dba_tab_cols t, dba_unused_col_tabs u
where hidden_column = 'YES' and
t.owner not in ('SYS', 'SYSTEM', 'WMSYS', 'XDB', 'MDSYS', 'SYSMAN', 'EXFSYS') and 
t.owner = u.owner and t.table_name = u.table_name
order by 1, 2;

prompt ======================================================================
prompt .           DEFINED SQL PROFILES (DBA_SQL_PRIOFILES)
prompt ======================================================================
prompt .
col prof_name for a30 heading "Profile name"
col category for a15
col created for a17 heading "Created|YYYY-MM-DD HH:MI"
col status for a10

select name prof_name, category, to_char(created, 'YYYY-MM-DD HH24:MI') created, status 
from dba_sql_profiles
order by 3;

prompt ======================================================================
prompt .           LIST OF DIRECTORIES (DBA_DIRECTORIES)
prompt ======================================================================

column directory_name for a30
column directory_path for a70

select owner, directory_name, directory_path 
from dba_directories order by 1, 2;

prompt ======================================================================
prompt .           Direct NFS Client (V$DNFS_SERVERS)
prompt ======================================================================
prompt . Requires a certified NAS device

column srvname for a30
column dirname for a70

SELECT svrname, dirname FROM v$dnfs_servers;

prompt .
prompt ======================================================================
prompt .       Flashback Database (V$FLASHBACK_DATABASE_LOG)
prompt ======================================================================
prompt . Estimation based on resent database load
prompt . Change retention time if you need 2 days for example
prompt . alter system set DB_FLASHBACK_RETENTION_TARGET = 2880;;
prompt . Don't forget about "ALTER TABLE AAA.BBB ENABLE ROW MOVEMENT;" beforehand
prompt . Warning level is 85%, critical - 97% (hardcoded)

col retention_target for 9999 heading "Retention, minutes"
col oldt format a14 heading "Oldest time"
col si for 999999 heading "Log Size, Mb"
col esi for 999999 heading "Estimated Size, Mb"

select retention_target, to_char(OLDEST_FLASHBACK_TIME, 'dd-mon hh24:mi') oldt,
round(FLASHBACK_SIZE/1024/1024) si, round(ESTIMATED_FLASHBACK_SIZE/1024/1024) esi
from V$FLASHBACK_DATABASE_LOG;

col oldest_flashback_scn for 999999999999999
select oldest_flashback_scn, 
to_char(oldest_flashback_time, 'dd-mm-yyyy hh24:mi') oldest_time
from v$flashback_database_log;

col fra_name for a30
col limit_mb for 9,999,999
col used_mb for 9,999,999
col reclaim_mb for 9,999,999
col real_used for 999 heading "Real used, %"
select name fra_name,
(space_limit/1024/1024) limit_mb,
(space_used/1024/1024) used_mb,
(space_reclaimable/1024/1024) reclaim_mb,
(space_used - space_reclaimable)/space_limit*100 real_used
from v$recovery_file_dest;

col flashback_data for 999,999,999
col db_data for 999,999,999
col redo_data for 999,999
col estimated_flashback_size for 999,999,999
alter session set NLS_DATE_FORMAT='DD-MM-YY HH24:MI';
select begin_time, end_time, round(flashback_data/1024/1024) flashback_data, round(db_data/1024/1024) db_data,
round(redo_data/1024/1024) redo_data, round(estimated_flashback_size/1024/1024) estimated_flashback_size
from v$flashback_database_stat;

prompt ======================================================================
prompt .             RESTORE POINTS (V$RESTORE_POINT)
prompt ======================================================================
prompt . Occupied size shows up for guarantee restore points ONLY
prompt . If you have preserved or guarantee restore points - you have to delete them manually

col name for a30
col storage_size for 999,999,999.99
col preserved for a9 heading "Preserved"
col GUARANTEE_FLASHBACK_DATABASE for a9 heading "Guarantee"

select name, storage_size/1024/1024 storage_size, preserved, GUARANTEE_FLASHBACK_DATABASE
from v$restore_point
order by 2 desc;

prompt .
prompt ======================================================================
prompt . Flashback Data Archives (DBA_FLASHBACK_ARCHIVE_TS/_TABLES) 
prompt ======================================================================
prompt . Purge: ALTER FLASHBACK ARCHIVE fba PURGE before timestamp(systimestamp - interval '2' day);;
prompt . Purge everything: ALTER FLASHBACK ARCHIVE fba PURGE ALL;;
prompt . Disable: ALTER TABLE table_name NO FLASHBACK ARCHIVE;;
prompt . Drop: DROP FLASHBACK ARCHIVE fba;;

col tablespace_name for a20
col flashback_archive_name for a22
col retention_in_days for 9999
col quota_in_mb for a11
select tablespace_name, a.flashback_archive_name, quota_in_mb, status, retention_in_days
from dba_flashback_archive_ts t, dba_flashback_archive a
where a.flashback_archive# = t.flashback_archive#
order by 1, 2;

col owner_name for a15
col table_name for a20
col archive_table_name for a30
select flashback_archive_name, owner_name, table_name, archive_table_name
from dba_flashback_archive_tables
order by 1, 2, 3;

prompt ======================================================================
prompt .         LIST OF SYSTEM LEVEL TRIGGERS - SYS (DBA_TRIGGERS)
prompt ======================================================================

col triggering_event for a20
col trigger_name for a25
col trigger_type for a20
col trigger_event for a30
select owner, trigger_name, status, trigger_type, triggering_event
from sys.dba_triggers
where base_object_type <> 'TABLE'
order by 1, 3, 2;

prompt ======================================================================
prompt .     Network Access Control List (DBA_NETWORK_ACLS[_PRIVILEGES])
prompt ======================================================================

col host format a20
col acl format a40
column principal format a20
col is_grant for a8
select host, principal, lower_port, upper_port, regexp_substr(dna.acl, '[^/]*$') acl, privilege, is_grant
from dba_network_acls dna, dba_network_acl_privileges dnap
where dna.aclid = dnap.aclid
order by 1, 2;

prompt ======================================================================
prompt .                  AUDIT SUMMARY (AUD$)
prompt ======================================================================
prompt . Since 11g aidit option is default (by DBCA)
prompt . delete old records if you need like:
prompt . delete from AUD$ where TIMESTAMP# < SYSDATE-30;;
prompt . delete from AUD$ where NTIMESTAMP# < SYSDATE-30;;

col minaud for a14 heading "Oldest record"
col maxaud for a14 heading "Newest record"
col audval for a15 heading "Audit_trail"
col bytesaud for 999,999 heading "Table size, Mb"
col tbsfree for 999,999 heading "Free space in TBS, Mb"
col tbsaud for a20 heading "TBS for audit table"

select count(*) "Audit records" from AUD$;
select to_char(min(TIMESTAMP#), 'dd-mm-yy hh24:mi') minaud, 
to_char(max(TIMESTAMP#), 'dd-mm-yy hh24:mi') maxaud from AUD$;
SELECT value audval FROM v$parameter WHERE name = 'audit_trail';
select ds.tablespace_name tbsaud, ds.bytes/1024/1024 bytesaud, sum(dfs.bytes)/1024/1024 tbsfree
from dba_segments ds, dba_free_space dfs
where owner ='SYS' and segment_name='AUD$' and ds.tablespace_name = dfs.tablespace_name
group by ds.tablespace_name, ds.bytes;

prompt ======================================================================
prompt .                  AUDIT OPTIONS (DBA_***_AUDIT_OPTS)
prompt ======================================================================
select count(*) audit_statements from sys.dba_stmt_audit_opts;
select count(*) audit_privileges from sys.dba_priv_audit_opts;
select count(*) audit_objects from sys.dba_obj_audit_opts;

prompt ======================================================================
prompt .           LIST OF INVALID OBJECTS (DBA_OBJECTS)
prompt ======================================================================

Column "Owner" format a20
column object_name format a30
col last_ddl for a20 heading "Last DDL Time"
select substr(owner,1,20) "Owner", object_name, object_type, to_char(last_ddl_time, 'DD-MM-YY HH24:MI:SS') last_ddl
from dba_objects 
where status != 'VALID'
order by 1,3,2;

prompt ======================================================================
prompt .           LIST OF ENABLED TRACING (V$SESSION)
prompt ======================================================================
prompt . BTW, DBA_ENABLED_TRACES should work, but it does not (Bugs 6743165, 6144276).
prompt . Check trc file name if any
prompt . SQL> oradebug setorapid SERIAL#
prompt . SQL> oradebug tracefile_name

-- Works with dbms_monitor.session_trace_enable ONLY
col username for a20
col terminal for a25
col program for  a30
select inst_id, serial#, sid, username, program, terminal, type
from GV$session where sql_trace = 'ENABLED';

-- Doers not work at the moment
col trace_type for a21
col primary_id for a20
col QUALIFIER_ID1 for a20
col QUALIFIER_ID2 for a20
col instance_name for a10

select trace_type, primary_id, QUALIFIER_ID1, QUALIFIER_ID2, instance_name
from DBA_ENABLED_TRACES;

prompt ======================================================================
prompt .  LIST OF INVALID OR UNUSABLE INDEXES (DBA_INDEXES) - SYSTEM LEVEL
prompt ======================================================================
prompt .
prompt . Recommendation: Rebuid indexes at place like:
prompt . alter index "USER1"."IDX2" REBUILD ONLINE;;
prompt . Check DBA_IND_PARTITIONS for partitioned indexes (they have N/A status here)
prompt .

column owner format a12
column table_name format a30
column index_name format a30
column tablespace_name format a15
column status format a8 heading "Status"

select owner, table_name, index_name, tablespace_name, status
from dba_indexes
where status != 'VALID' and
(owner != 'SYSTEM' and table_name != 'LOGMNR%')
order by 1, 2, 3;

prompt ======================================================================
prompt .  LIST OF UNUSABLE USER'S PARTITIONED INDEXES (DBA_IND_PARTITIONS)
prompt ======================================================================
prompt . alter index "USER1"."IDX2" rebuild partition PART1 tablespace INDX;;
prompt .

column index_owner format a12
column partition_name format a15 heading "Partition Name"

select index_owner, index_name, tablespace_name, status, partition_name 
from dba_ind_partitions
where status != 'USABLE'
order by 1, 2;

prompt ======================================================================
prompt .           LIST OF INVISIBLE INDEXES (DBA_INDEXES)
prompt ======================================================================
prompt .

select owner, table_name, index_name
from dba_indexes
where visibility != 'VISIBLE'
order by 1, 2, 3;

prompt ======================================================================
prompt .   LIST OF DISABLED OR NOT VALIDATED CONSTRAINTS (DBA_CONSTRAINTS)
prompt ======================================================================

select owner, status, validated, count(*)
from dba_constraints 
where owner not in ('SYS', 'SYSTEM', 'SYSMAN', 'WMSYS', 'CTXSYS', 'DBSMNP', 'DMSYS', 'EXFSYS', 'MDSYS', 'OLAPSYS', 'ORDSYS', 'TMSYS', 'WMSYS', 'XDB')
and (status = 'DISABLED' or validated = 'NOT VALIDATED')
group by owner, status, validated;

prompt ======================================================================
prompt .            LAST 10 FAILURES (V$IR_FAILURE)
prompt ======================================================================

col time_detected for a14
col description for a80
col INST_ID for 9999999
col PRIORITY for a8
set wrap on

select *
from (select INST_ID, PRIORITY, to_char(time_detected, 'YY-MM-DD HH24:MI') time_detected, status, description
  from GV$IR_FAILURE
  order by 3 ) 
where rownum < 11;

prompt ======================================================================
prompt .   LAST 10 OUTSTANDING ALERTS (DBA_OUTSTANDING_ALERTS)
prompt ======================================================================

col reason for a60
col time_sugg for a14
col process_id for a20
col host_id for a10

select * from
(select reason, to_char(time_suggested, 'dd-mm-yy hh24:mi') time_sugg, process_id, host_id
from dba_outstanding_alerts
order by time_suggested desc) where rownum < 11;

prompt ======================================================================
prompt .   LAST 10 PROBLEMS IN ADDM_FINDINGS (DBA_ADDM_FINDINGS/ADDM_TASKS)
prompt ======================================================================
prompt . ADDM analysis run after each AWR snapshot, so it can be some delay

col begin_time for a14
col finding_name for a23
col impact for 999999999999
col impact_type for a17
col message for a50

select * from (select to_char(begin_time, 'YY-MM-DD HH24:MI') begin_time, finding_name, impact, impact_type, message
from dba_addm_findings f, dba_addm_tasks t
where 
impact <> 0 and 
type='PROBLEM' and 
f.task_id = t.task_id
order by 1 desc ) where rownum < 11;

prompt ======================================================================
prompt .        LAST 10 PL/SQL ERRORS (DBA_OBJECTS, DBA_ERRORS)
prompt ======================================================================
prompt .

column LAST_DDL_TIME noprint
COLUMN datetime		    FORMAT a19	    HEAD 'Date_Time'
COLUMN type                 FORMAT a13      HEAD 'Object Type'
COLUMN owner                FORMAT a13      HEAD 'Schema'
COLUMN name                 FORMAT a30      HEAD 'Object Name'
COLUMN sequence             FORMAT 999,999  HEAD 'Sequence'
COLUMN line                 FORMAT 999,999  HEAD 'Line'
COLUMN position             FORMAT 999,999  HEAD 'Position'
COLUMN text                 for a40         HEAD 'Text'

select * from (SELECT distinct to_char(LAST_DDL_TIME, 'dd-mm-yy hh24:mi:ss') datetime, LAST_DDL_TIME, A.OWNER,B.TYPE,NAME,TEXT
FROM DBA_OBJECTS A, DBA_ERRORS B 
WHERE
A.OWNER=B.OWNER AND A.OBJECT_NAME=B.NAME AND 
A.OBJECT_TYPE=B.TYPE
order by LAST_DDL_TIME desc)
where rownum <= 10;

prompt ======================================================================
prompt .          DB EDITIONS (DBA_EDITIONS, DBA_OBJECTS)
prompt ======================================================================
prompt . Use "GRANT USE ON EDITION A1 to SCOTT;"
prompt . "ALTER USER ENABLE EDITIONS", "ALTER SESSION SET EDITION = A1;"
prompt . "ALTER EDITION A1 unusable;", "DROP EDITION A1"

col created for a17 heading "Created|DD-MM-YYYY HH:MI"
col usable for a6
select e.edition_name, e.parent_edition_name, to_char(o.created, 'dd-mm-yyyy hh24:mi') created, usable
from dba_editions e inner join dba_objects o
on e.edition_name = o.object_name
where o.object_type = 'EDITION';

prompt ======================================================================
prompt .      AUTOMATIC DIAGNOSTIC REPOSITORY CONDITION (V$DIAG_INFO)
prompt ======================================================================
prompt . "Diag Trace" value points to flat alert.log file destination
prompt . Use adrci utility, for example: adrci exec="show alert -tail 50"
prompt .

col value for a90
col INST_ID for 9999999
col name for a21

SELECT * FROM V$DIAG_INFO;

prompt ======================================================================
prompt .                 HEALTH CHECK (V_$HM_RUN)
prompt ======================================================================
prompt . When it has been started last 10 times, what has been found
prompt . Or read it by ADRCI: adrci exec="show hm_run"
prompt . Check V_$HM_FINDINGS by RUN_ID for details, if any incidents	

col run_id for 999999
col check_name for a28
col run_mode for a8
col status for a9
col src_incident for 9999999 heading "Source|incident"
col num_incident for 9999999 heading "Number of|incidents"
col error_number for 9999999 heading "Error Num"
col problem_id for   9999999 heading "Problem ID"

select run_id, check_name, run_mode, to_char(start_time, 'dd-mm-yy hh24:mi') start_time, status, src_incident, num_incident, 
error_number, problem_id from (select * from V_$HM_RUN order by start_time desc) where rownum < 11;

prompt ======================================================================
prompt .          LIST OF CURRENT PARAMETER SETTINGS (V$PARAMETER2)
prompt ======================================================================

break on "Default"
-- set lines 300 pages 300
column "Parameter" format a33
column "Value" format a34
column "Default" format a5 heading "DEFAU"
column "Description" format a64

select substr(isdefault,1,7)          "Default",
       substr(name,1,33)              "Parameter",
       substr(value,1,34)             "Value",
       description                    "Description"
from sys.v_$parameter2
order by 1, 2;

prompt ======================================================================
prompt End of Report

spool off

/*********************************************************************/
/*** DROP ALL TUNE RELATED OBJECTS AND VIEW OUTPUT *******************/
/*********************************************************************/
drop package tune;
drop view temprpt_objects;
drop view temprpt_total_Free;
drop view temprpt_Free;
drop view temprpt_bytes;
drop view temprpt_status;
drop view temprpt_frag1;
drop view temprpt_frag2;
drop view temprpt_next_vw;
drop view temprpt_total_obj;
exit;
