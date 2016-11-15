FROM centos:7

MAINTAINER Bharat Goyal <bgoyalsapient.com>
RUN yum install -y java;yum clean all

RUN mkdir /home/jmeter
ADD apache-jmeter-3.0.tgz /home/jmeter/
ADD STC.jmx /home/jmeter/STC.jmx

CMD cd /home/jmeter; tar -xzf /home/jmeter/apache-jmeter-3.0.tgz
ADD jmeter.properties /home/jmeter/apache-jmeter-3.0/bin/
CMD /home/jmeter/apache-jmeter-3.0/bin/jmeter.sh -n -t /home/jmeter/STC.jmx -l /home/jmeter/STC_Result.jtl -JTEST_DURATION=$TEST_DURATION -JREPORT_DIR_PATH=./reports/ -q /home/jmeter/apache-jmeter-3.0/bin/jmeter.properties
