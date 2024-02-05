package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"github.com/nuonco/guides/deploy-to-aws-ecs/components/docker-image/internal/health"
	"github.com/nuonco/guides/deploy-to-aws-ecs/components/docker-image/internal/introspection"
	"go.uber.org/zap"
)

func main() {
	l, err := zap.NewProduction()
	if err != nil {
		log.Fatalf("unable to create logger: %s", err)
	}

	r := gin.Default()
	v := validator.New()
	svc, err := introspection.New(v)
	if err != nil {
		log.Fatalf("unable to create introspection service: %s", err)
	}

	healthSvc, err := health.New(v)
	if err != nil {
		log.Fatalf("unable to create health service: %s", err)
	}

	r.GET("/introspect/env", svc.GetEnvHandler)
	r.GET("/introspect/terraform", svc.GetTerraformHandler)
	r.GET("/introspect/secrets", svc.GetSecretsHandler)
	r.GET("/introspect/defaults", svc.GetDefaultsHandler)
	r.GET("/introspect/sandbox", svc.GetSandboxHandler)
	r.GET("/introspect/nuon", svc.GetNuonHandler)
	r.GET("/introspect/docker-build", svc.GetDockerBuildHandler)
	r.GET("/introspect/external-image", svc.GetExternalImageHandler)

	r.GET("/", discoverHandler)
	r.GET("/livez", healthSvc.GetLivezHandler)
	r.GET("/readyz", healthSvc.GetReadyzHandler)

	l.Info("starting server")
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
