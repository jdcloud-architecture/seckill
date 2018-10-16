MichaeldeMacBook-Pro-2:jmeter myang$ ~/tools/apache-jmeter-4.0/bin/jmeter -n -t seckill.jmx -l result.jtl
Creating summariser <summary>
Created the tree successfully using seckill.jmx
Starting the test @ Sun Jun 24 00:48:48 CST 2018 (1529772528350)
Waiting for possible Shutdown/StopTestNow/Heapdump message on port 4445
summary =      2 in 00:00:01 =    2.2/s Avg:    81 Min:    26 Max:   137 Err:     0 (0.00%)
Tidying up ...    @ Sun Jun 24 00:48:49 CST 2018 (1529772529675)
... end of run
The JVM should have exited but did not.
The following non-daemon threads are still running (DestroyJavaVM is OK):
Thread[DestroyJavaVM,5,main], stackTrace:
Thread[AWT-Shutdown,5,system], stackTrace:java.lang.Object#wait
sun.awt.AWTAutoShutdown#run at line:314
java.lang.Thread#run at line:745
