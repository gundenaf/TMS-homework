#!/bin/bash

echo "Update packages"
sudo apt update
echo "======================================"

echo "Install Java, unzip, wget"
sudo apt install default-jdk wget unzip -y
echo "======================================"

echo "Download Apache JMeter"
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.6.zip
sudo unzip apache-jmeter-5.6.zip -d /opt/
echo "======================================"

echo "Add JMeter to user PATH"
echo '# set JMeter path' | tee -a /home/$SUDO_USER/.profile
echo "JMETER_HOME=\"/opt/apache-jmeter-5.6\"" | tee -a /home/$SUDO_USER/.profile
echo "PATH=\"\$JMETER_HOME/bin:\$PATH\"" | tee -a /home/$SUDO_USER/.profile
source /home/$SUDO_USER/.profile
echo "======================================"

echo "Show Apache JMeter version"
jmeter --version
echo "======================================"

echo "Create directory for testcases"
mkdir -p /home/$SUDO_USER/test_cases
echo "======================================"

echo "Create Apache JMeter test"
load_test_content='<?xml version="1.0" encoding="UTF-8"?>
<jmeterTestPlan version="1.2" properties="2.7" jmeter="2.12 r1636949">
  <hashTree>
    <TestPlan guiclass="TestPlanGui" testclass="TestPlan" testname="Test Plan" enabled="true">
      <stringProp name="TestPlan.comments"></stringProp>
      <boolProp name="TestPlan.functional_mode">false</boolProp>
      <boolProp name="TestPlan.serialize_threadgroups">false</boolProp>
      <elementProp name="TestPlan.user_defined_variables" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" testname="User Defined Variables" enabled="true">
        <collectionProp name="Arguments.arguments"/>
      </elementProp>
      <stringProp name="TestPlan.user_define_classpath"></stringProp>
    </TestPlan>
    <hashTree>
      <ConfigTestElement guiclass="HttpDefaultsGui" testclass="ConfigTestElement" testname="HTTP Request Defaults" enabled="true">
        <elementProp name="HTTPsampler.Arguments" elementType="Arguments" guiclass="HTTPArgumentsPanel" testclass="Arguments" testname="User Defined Variables" enabled="true">
          <collectionProp name="Arguments.arguments"/>
        </elementProp>
        <stringProp name="HTTPSampler.domain">${__P(host,tms.by)}</stringProp>
        <stringProp name="HTTPSampler.port">${__P(port,80)}</stringProp>
        <stringProp name="HTTPSampler.connect_timeout"></stringProp>
        <stringProp name="HTTPSampler.response_timeout"></stringProp>
        <stringProp name="HTTPSampler.protocol">${__P(protocol,http)}</stringProp>
        <stringProp name="HTTPSampler.contentEncoding"></stringProp>
        <stringProp name="HTTPSampler.path">${__P(path,/)}</stringProp>
        <stringProp name="HTTPSampler.implementation">HttpClient4</stringProp>
        <boolProp name="HTTPSampler.image_parser">true</boolProp>
        <stringProp name="HTTPSampler.concurrentPool">4</stringProp>
      </ConfigTestElement>
      <hashTree/>
      <CookieManager guiclass="CookiePanel" testclass="CookieManager" testname="HTTP Cookie Manager" enabled="true">
        <collectionProp name="CookieManager.cookies"/>
        <boolProp name="CookieManager.clearEachIteration">true</boolProp>
        <stringProp name="CookieManager.policy">default</stringProp>
        <stringProp name="CookieManager.implementation">org.apache.jmeter.protocol.http.control.HC4CookieHandler</stringProp>
      </CookieManager>
      <hashTree/>
      <CacheManager guiclass="CacheManagerGui" testclass="CacheManager" testname="HTTP Cache Manager" enabled="true">
        <boolProp name="clearEachIteration">true</boolProp>
        <boolProp name="useExpires">true</boolProp>
      </CacheManager>
      <hashTree/>
      <ThreadGroup guiclass="ThreadGroupGui" testclass="ThreadGroup" testname="Thread Group" enabled="true">
        <stringProp name="ThreadGroup.on_sample_error">continue</stringProp>
        <elementProp name="ThreadGroup.main_controller" elementType="LoopController" guiclass="LoopControlPanel" testclass="LoopController" testname="Loop Controller" enabled="true">
          <boolProp name="LoopController.continue_forever">false</boolProp>
          <intProp name="LoopController.loops">-1</intProp>
        </elementProp>
        <stringProp name="ThreadGroup.num_threads">${__P(threads,50)}</stringProp>
        <stringProp name="ThreadGroup.ramp_time">${__P(rampup,30)}</stringProp>
        <longProp name="ThreadGroup.start_time">1345498621000</longProp>
        <longProp name="ThreadGroup.end_time">1345498621000</longProp>
        <boolProp name="ThreadGroup.scheduler">true</boolProp>
        <stringProp name="ThreadGroup.duration">${__P(duration,30)}</stringProp>
        <stringProp name="ThreadGroup.delay"></stringProp>
      </ThreadGroup>
      <hashTree>
        <HTTPSamplerProxy guiclass="HttpTestSampleGui" testclass="HTTPSamplerProxy" testname="home_page" enabled="true">
          <elementProp name="HTTPsampler.Arguments" elementType="Arguments" guiclass="HTTPArgumentsPanel" testclass="Arguments" testname="User Defined Variables" enabled="true">
            <collectionProp name="Arguments.arguments"/>
          </elementProp>
          <stringProp name="HTTPSampler.domain"></stringProp>
          <stringProp name="HTTPSampler.port"></stringProp>
          <stringProp name="HTTPSampler.connect_timeout"></stringProp>
          <stringProp name="HTTPSampler.response_timeout"></stringProp>
          <stringProp name="HTTPSampler.protocol"></stringProp>
          <stringProp name="HTTPSampler.contentEncoding"></stringProp>
          <stringProp name="HTTPSampler.path"></stringProp>
          <stringProp name="HTTPSampler.method">GET</stringProp>
          <boolProp name="HTTPSampler.follow_redirects">true</boolProp>
          <boolProp name="HTTPSampler.auto_redirects">false</boolProp>
          <boolProp name="HTTPSampler.use_keepalive">true</boolProp>
          <boolProp name="HTTPSampler.DO_MULTIPART_POST">false</boolProp>
          <boolProp name="HTTPSampler.image_parser">true</boolProp>
          <boolProp name="HTTPSampler.concurrentDwn">true</boolProp>
          <boolProp name="HTTPSampler.monitor">false</boolProp>
          <stringProp name="HTTPSampler.embedded_url_re"></stringProp>
        </HTTPSamplerProxy>
        <hashTree>
          <GaussianRandomTimer guiclass="GaussianRandomTimerGui" testclass="GaussianRandomTimer" testname="think_time" enabled="true">
            <stringProp name="ConstantTimer.delay">1000</stringProp>
            <stringProp name="RandomTimer.range">5000</stringProp>
          </GaussianRandomTimer>
          <hashTree/>
        </hashTree>
      </hashTree>
    </hashTree>
  </hashTree>
</jmeterTestPlan>'

echo "$load_test_content" > /home/$SUDO_USER/test_cases/load_test.jmx
echo "======================================"

echo "Run Apache JMeter test"
JVM_ARGS="-Xms2048m -Xmx2048m" jmeter -n -t /home/$SUDO_USER/test_cases/load_test.jmx -l /home/$SUDO_USER/test_cases/load_test.jtl -H tms.by -P 80
echo "======================================"

echo "Show results of the test"
cat /home/$SUDO_USER/test_cases/load_test.jtl
echo "======================================"