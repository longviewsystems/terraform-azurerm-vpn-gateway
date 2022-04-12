package main

import (
	"log"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAzDoAgent(t *testing.T) {
	options := &terraform.Options{
		TerraformDir: "./fixtures",

		// VarFiles     : []string{"./test/fixture/test.tfvars"},
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
}
