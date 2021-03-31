    clear
    echo "--------------------------------------"       
    echo "-  upgradeing to latest GA build of  -"
    echo "- Relational Junction Data Warehouse -"
    echo "--------------------------------------"
    service tomcat stop
    su -c "rm -rf /opt/tomcat/webapps/rj*" tomcat
    su -c "wget -O /opt/tomcat/webapps/rj.war http://sesamesoftware.com/rjdw/rj.war" tomcat
    service tomcat start