#!/usr/bin/env python3 -W ignore::DeprecationWarning

import sys
import getpass
import configparser
import logging
import re
import os
import argparse
from os.path import expanduser
from urllib3.exceptions import ProtocolError
import boto3
       
client = boto3.client('iam')
client_response = client.list_users()
def lambda_handler(event, context):
while True:
    user_count = len(client_response['Users'])
    for i in range(user_count):
       _userName =  client_response['Users'][i]['UserName']
       usertag_response = client.tag_user(
            UserName=_userName,
            Tags=[
                {
                    'Key': 'Engineer',
                    'Value': 'Yes'
                },
            ]
        )

    if client_response['IsTruncated'] == False:
        break
    _marker= client_response['Marker']
    client_response = client.list_users(Marker=_marker)
