#/bin/bash
if curl ecomp.harveensingh.com/version/version.html | grep "1.0.6" > /dev/null; then
if curl --head ecomp.harveensingh.com | grep "200 OK" > /dev/null; then
   echo "website version 1.0.6 is UP and RUNNING "
fi
else
echo "Website version 1.0.6 is DOWN"
fi