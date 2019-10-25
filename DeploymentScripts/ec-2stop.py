# usr/bin/python -tt
import boto3
region = 'us-east-1'
instances = ['i-0a63dbd22a8278b5b']
ec2 = boto3.client('ec2', region_name=region)

def test(event, context):
    ec2.stop_instances(InstanceIds=instances)
    print('stopped your instances: ' + str(instances))