package main

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"log"
	"testing"
)

func TestTerraform(t *testing.T) {
	options := &terraform.Options{
		TerraformDir: "../resources",
	}

	defer terraform.Destroy(t, options)

	init, err := terraform.InitE(t, options)

	if err != nil {
		log.Println(err)
	}

	t.Log(init)

	plan, err := terraform.PlanE(t, options)

	if err != nil {
		log.Println(err)
	}

	t.Log(plan)

	apply, err := terraform.ApplyE(t, options)

	if err != nil {
		log.Println(err)
	}

	t.Log(apply)

	tags := "map[Environment:InfraTeam Name:Flugel]"

	instanceTags := terraform.Output(t, options, "instanceTags")
	bucketTags := terraform.Output(t, options, "bucketsTags")

	assert.Equal(t, instanceTags, tags)
	assert.Equal(t, bucketTags, tags)

}
