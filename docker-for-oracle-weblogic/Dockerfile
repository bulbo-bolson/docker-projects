FROM store/oracle/weblogic:12.2.1.3

# -------------------------------------------------------------
ENV FMW_PKG="fmw_12.2.1.3.0_wls_supplemental_quick_Disk1_1of1.zip" \
    FMW_JAR="fmw_12.2.1.3.0_wls_supplemental_quick.jar" \
    MW_HOME="$ORACLE_HOME" \ 
    PATH="$ORACLE_HOME/wlserver/server/bin:$ORACLE_HOME/wlserver/../oracle_common/modules/org.apache.ant_1.9.2/bin:$JAVA_HOME/jre/bin:$JAVA_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$ORACLE_HOME/oracle_common/common/bin:$ORACLE_HOME/wlserver/common/bin:$ORACLE_HOME/user_projects/domains/medrec/bin:$ORACLE_HOME/wlserver/samples/server/medrec/:$ORACLE_HOME/wlserver/samples/server/:$ORACLE_HOME/wlserver/../oracle_common/modules/org.apache.maven_3.2.5/bin"
ENV WEBLOGIC_OS_USER="oracle"
ENV WEBLOGIC_OS_GROUP="oracle"
ENV ANSIBLE_VERSION=2.5.2

# Copy supplemental package and scripts
# --------------------------------
COPY $FMW_PKG /u01/
USER root
COPY container-scripts/*  /u01/oracle/
COPY demo_oracle.ddl  /u01/oracle/
COPY sqlcl-19.4.0.354.0937.zip  /u01/oracle/
RUN chmod +xr /u01/oracle/startSample.sh 

# Installation of Supplemental Quick Installer 
# --------------------------------------------
USER oracle
RUN cd /u01 && $JAVA_HOME/bin/jar xf /u01/$FMW_PKG && cd - ; \
    $JAVA_HOME/bin/java -jar /u01/$FMW_JAR  ORACLE_HOME=$ORACLE_HOME ; \
    echo $USER ; \
    mv /u01/oracle/startSample.sh /u01/oracle/wlserver/samples/server/ ; \
    rm /u01/$FMW_PKG /u01/$FMW_JAR ; \
    tail -f /dev/null

