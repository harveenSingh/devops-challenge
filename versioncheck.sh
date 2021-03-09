#/bin/bash
if curl ec2-3-23-102-151.us-east-2.compute.amazonaws.com/version/version.html | grep "1.0.6" > /dev/null; then
if curl --head ec2-3-23-102-151.us-east-2.compute.amazonaws.com | grep "200 OK" > /dev/null; then
   echo "website version 1.0.6 is UP and RUNNING "
fi
else
echo "Website version 1.0.6 is DOWN"
fi