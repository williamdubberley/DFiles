clear
if [ $# -gt 0 ] && [ $1 == '-b' ]
then
   clear
    read -p "version: " version
    read -p "build: " build
    echo "--------------------------------------"       
    echo "-  upgradeing to latest Beta build of  -"
    echo "- Relational Junction Data Warehouse -"
    echo "--------------------------------------"
    sudo service tomcat stop
    sudo su -c "rm -rf /u01/tomcat/tomcat/webapps/rj*" tomcat
    sudo su -c "wget -O /u01/tomcat/tomcat/webapps/rj.war http://sesamesoftware.com/download/UnderQA/$version/$build/rj.war" tomcat
    sudo service tomcat start

else
    clear
    echo "--------------------------------------"       
    echo "-  upgradeing to latest GA build of  -"
    echo "- Relational Junction Data Warehouse -"
    echo "--------------------------------------"
    sudo service tomcat stop
    sudo su -c "rm -rf /u01/tomcat/tomcat/webapps/rj*" tomcat
    sudo su -c "wget -O /u01/tomcat/tomcat/webapps/rj.war http://sesamesoftware.com/rjdw/rj.war" tomcat
    sudo service tomcat start

fi