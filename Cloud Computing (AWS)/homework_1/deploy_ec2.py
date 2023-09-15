#!/usr/bin/python3

# pip install boto3

import boto3
import botocore
import sys
import time
import logging 
from aws_vars import *

#logging.basicConfig(level=logging.DEBUG)

#boto3.set_stream_logger('botocore', level=logging.DEBUG)

def create_assumed_role_session():
    try:
        # Initialize a session using your IAM user's credentials
        session = boto3.Session(
            aws_access_key_id=aws_access_key_id,
            aws_secret_access_key=aws_secret_access_key,
            region_name=region_name
        )

        # Assume the specified IAM role
        sts_client = session.client('sts')
        assumed_role = sts_client.assume_role(
            RoleArn=assume_role_arn,
            RoleSessionName='AssumeRoleSession'
        )

        # Create a new session using the temporary credentials
        assumed_session = boto3.Session(
            aws_access_key_id=assumed_role['Credentials']['AccessKeyId'],
            aws_secret_access_key=assumed_role['Credentials']['SecretAccessKey'],
            aws_session_token = assumed_role['Credentials']['SessionToken'],
            region_name=region_name 
        )

        return assumed_session

    except botocore.exceptions.ClientError as e:
        print(f"An error occurred while assuming the role: {e}")
        sys.exit(1)

def create_ec2_instance():
    try:
        # Initialize a session using Assume Role
        assumed_session = create_assumed_role_session()
        
        ec2 = assumed_session.resource('ec2')

        # Launch an EC2 instance
        instance = ec2.create_instances(
            ImageId=ec2_ami_id,
            InstanceType=ec2_instance_type,
            MinCount=1,
            MaxCount=1,
            KeyName=ec2_key_pair_name,
            SecurityGroups=[ec2_security_group_name],
            **{'Placement': {'AvailabilityZone': 'us-east-1a'}}
        )[0]

        print(f"EC2 instance with ID {instance.id} is being created...")

        # Wait for the instance to be running
        instance.wait_until_running()

        print(f"EC2 instance with ID {instance.id} is now running.")

        return instance

    except botocore.exceptions.ClientError as e:
        print(f"An error occurred: {e}")
        sys.exit(1)

def main():
    ec2_instance = create_ec2_instance()

    # Terminate the EC2 instance
    print(f"Terminating EC2 instance with ID {ec2_instance.id}...")
    ec2_instance.terminate()

if __name__ == "__main__":
    main()
