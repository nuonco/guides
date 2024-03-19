package dynamodb

import (
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/dynamodb"
)

const region = "us-east-1"

var db = dynamodb.New(session.New(), aws.NewConfig().WithRegion(region))

// var db = dynamodb.New(session.NewSession(), aws.NewConfig().WithRegion(region))
