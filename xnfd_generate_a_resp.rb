require 'json'

# Configuration
MODULE_NAME = "ARVRModuleController"
API_VERSION = "1.0.0"

# API Endpoints
ENDPOINTS = [
  {
    method: "GET",
    path: "/module",
    description: "Get AR/VR module configuration",
    response: {
      200: {
        description: "Module configuration",
        schema: {
          type: "object",
          properties: {
            moduleName: { type: "string" },
            moduleVersion: { type: "string" },
            apiVersion: { type: "string" }
          }
        }
      }
    }
  },
  {
    method: "POST",
    path: "/module/start",
    description: "Start AR/VR module",
    request: {
      description: "Module start request",
      schema: {
        type: "object",
        properties: {
          sceneId: { type: "string" },
          sessionId: { type: "string" }
        }
      }
    },
    response: {
      202: {
        description: "Module started successfully"
      }
    }
  },
  {
    method: "POST",
    path: "/module/stop",
    description: "Stop AR/VR module",
    request: {
      description: "Module stop request",
      schema: {
        type: "object",
        properties: {
          sessionId: { type: "string" }
        }
      }
    },
    response: {
      202: {
        description: "Module stopped successfully"
      }
    }
  },
  {
    method: "GET",
    path: "/scenes",
    description: "Get available AR/VR scenes",
    response: {
      200: {
        description: "List of available scenes",
        schema: {
          type: "array",
          items: {
            type: "object",
            properties: {
              sceneId: { type: "string" },
              sceneName: { type: "string" }
            }
          }
        }
      }
    }
  }
]

# API Documentation
DOCUMENTATION = {
  openapi: API_VERSION,
  info: {
    title: MODULE_NAME,
    description: "AR/VR Module Controller API",
    version: API_VERSION
  },
  paths: ENDPOINTS.reduce({}) { |h, ep| h[ep[:path]] = ep; h }
}

# Output API Documentation as JSON
puts DOCUMENTATION.to_json