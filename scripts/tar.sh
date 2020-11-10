#!/bin/bash
for i in server1 server2;
   do ssh ansible@$i "sudo tar -czf messages.tar.gz /var/log/messages";
done

ansible -m fetch -a "src=/home/ansible/messages.tar.gz dest=/tmp/messages" all

