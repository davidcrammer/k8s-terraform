resource "kubernetes_manifest" "customresourcedefinition_imagepolicies_image_toolkit_fluxcd_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "controller-gen.kubebuilder.io/version" = "v0.12.0"
      }
      "labels" = {
        "app.kubernetes.io/component" = "image-reflector-controller"
        "app.kubernetes.io/instance" = "flux-system"
        "app.kubernetes.io/part-of" = "flux"
        "app.kubernetes.io/version" = "v2.1.1"
      }
      "name" = "imagepolicies.image.toolkit.fluxcd.io"
    }
    "spec" = {
      "group" = "image.toolkit.fluxcd.io"
      "names" = {
        "kind" = "ImagePolicy"
        "listKind" = "ImagePolicyList"
        "plural" = "imagepolicies"
        "singular" = "imagepolicy"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "jsonPath" = ".status.latestImage"
              "name" = "LatestImage"
              "type" = "string"
            },
          ]
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "description" = "ImagePolicy is the Schema for the imagepolicies API"
              "properties" = {
                "apiVersion" = {
                  "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
                  "type" = "string"
                }
                "kind" = {
                  "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
                  "type" = "string"
                }
                "metadata" = {
                  "type" = "object"
                }
                "spec" = {
                  "description" = "ImagePolicySpec defines the parameters for calculating the ImagePolicy"
                  "properties" = {
                    "filterTags" = {
                      "description" = "FilterTags enables filtering for only a subset of tags based on a set of rules. If no rules are provided, all the tags from the repository will be ordered and compared."
                      "properties" = {
                        "extract" = {
                          "description" = "Extract allows a capture group to be extracted from the specified regular expression pattern, useful before tag evaluation."
                          "type" = "string"
                        }
                        "pattern" = {
                          "description" = "Pattern specifies a regular expression pattern used to filter for image tags."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                    "imageRepositoryRef" = {
                      "description" = "ImageRepositoryRef points at the object specifying the image being scanned"
                      "properties" = {
                        "name" = {
                          "description" = "Name of the referent."
                          "type" = "string"
                        }
                        "namespace" = {
                          "description" = "Namespace of the referent, when not specified it acts as LocalObjectReference."
                          "type" = "string"
                        }
                      }
                      "required" = [
                        "name",
                      ]
                      "type" = "object"
                    }
                    "policy" = {
                      "description" = "Policy gives the particulars of the policy to be followed in selecting the most recent image"
                      "properties" = {
                        "alphabetical" = {
                          "description" = "Alphabetical set of rules to use for alphabetical ordering of the tags."
                          "properties" = {
                            "order" = {
                              "default" = "asc"
                              "description" = "Order specifies the sorting order of the tags. Given the letters of the alphabet as tags, ascending order would select Z, and descending order would select A."
                              "enum" = [
                                "asc",
                                "desc",
                              ]
                              "type" = "string"
                            }
                          }
                          "type" = "object"
                        }
                        "numerical" = {
                          "description" = "Numerical set of rules to use for numerical ordering of the tags."
                          "properties" = {
                            "order" = {
                              "default" = "asc"
                              "description" = "Order specifies the sorting order of the tags. Given the integer values from 0 to 9 as tags, ascending order would select 9, and descending order would select 0."
                              "enum" = [
                                "asc",
                                "desc",
                              ]
                              "type" = "string"
                            }
                          }
                          "type" = "object"
                        }
                        "semver" = {
                          "description" = "SemVer gives a semantic version range to check against the tags available."
                          "properties" = {
                            "range" = {
                              "description" = "Range gives a semver range for the image tag; the highest version within the range that's a tag yields the latest image."
                              "type" = "string"
                            }
                          }
                          "required" = [
                            "range",
                          ]
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "imageRepositoryRef",
                    "policy",
                  ]
                  "type" = "object"
                }
                "status" = {
                  "default" = {
                    "observedGeneration" = -1
                  }
                  "description" = "ImagePolicyStatus defines the observed state of ImagePolicy"
                  "properties" = {
                    "conditions" = {
                      "items" = {
                        "description" = <<-EOT
                        Condition contains details for one aspect of the current state of this API Resource. --- This struct is intended for direct use as an array at the field path .status.conditions.  For example, 
                         type FooStatus struct{ // Represents the observations of a foo's current state. // Known .status.conditions.type are: "Available", "Progressing", and "Degraded" // +patchMergeKey=type // +patchStrategy=merge // +listType=map // +listMapKey=type Conditions []metav1.Condition `json:"conditions,omitempty" patchStrategy:"merge" patchMergeKey:"type" protobuf:"bytes,1,rep,name=conditions"` 
                         // other fields }
                        EOT
                        "properties" = {
                          "lastTransitionTime" = {
                            "description" = "lastTransitionTime is the last time the condition transitioned from one status to another. This should be when the underlying condition changed.  If that is not known, then using the time when the API field changed is acceptable."
                            "format" = "date-time"
                            "type" = "string"
                          }
                          "message" = {
                            "description" = "message is a human readable message indicating details about the transition. This may be an empty string."
                            "maxLength" = 32768
                            "type" = "string"
                          }
                          "observedGeneration" = {
                            "description" = "observedGeneration represents the .metadata.generation that the condition was set based upon. For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date with respect to the current state of the instance."
                            "format" = "int64"
                            "minimum" = 0
                            "type" = "integer"
                          }
                          "reason" = {
                            "description" = "reason contains a programmatic identifier indicating the reason for the condition's last transition. Producers of specific condition types may define expected values and meanings for this field, and whether the values are considered a guaranteed API. The value should be a CamelCase string. This field may not be empty."
                            "maxLength" = 1024
                            "minLength" = 1
                            "pattern" = "^[A-Za-z]([A-Za-z0-9_,:]*[A-Za-z0-9_])?$"
                            "type" = "string"
                          }
                          "status" = {
                            "description" = "status of the condition, one of True, False, Unknown."
                            "enum" = [
                              "True",
                              "False",
                              "Unknown",
                            ]
                            "type" = "string"
                          }
                          "type" = {
                            "description" = "type of condition in CamelCase or in foo.example.com/CamelCase. --- Many .condition.type values are consistent across resources like Available, but because arbitrary conditions can be useful (see .node.status.conditions), the ability to deconflict is important. The regex it matches is (dns1123SubdomainFmt/)?(qualifiedNameFmt)"
                            "maxLength" = 316
                            "pattern" = "^([a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*/)?(([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9])$"
                            "type" = "string"
                          }
                        }
                        "required" = [
                          "lastTransitionTime",
                          "message",
                          "reason",
                          "status",
                          "type",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "latestImage" = {
                      "description" = "LatestImage gives the first in the list of images scanned by the image repository, when filtered and ordered according to the policy."
                      "type" = "string"
                    }
                    "observedGeneration" = {
                      "format" = "int64"
                      "type" = "integer"
                    }
                  }
                  "type" = "object"
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
        {
          "additionalPrinterColumns" = [
            {
              "jsonPath" = ".status.latestImage"
              "name" = "LatestImage"
              "type" = "string"
            },
          ]
          "name" = "v1beta2"
          "schema" = {
            "openAPIV3Schema" = {
              "description" = "ImagePolicy is the Schema for the imagepolicies API"
              "properties" = {
                "apiVersion" = {
                  "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
                  "type" = "string"
                }
                "kind" = {
                  "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
                  "type" = "string"
                }
                "metadata" = {
                  "type" = "object"
                }
                "spec" = {
                  "description" = "ImagePolicySpec defines the parameters for calculating the ImagePolicy."
                  "properties" = {
                    "filterTags" = {
                      "description" = "FilterTags enables filtering for only a subset of tags based on a set of rules. If no rules are provided, all the tags from the repository will be ordered and compared."
                      "properties" = {
                        "extract" = {
                          "description" = "Extract allows a capture group to be extracted from the specified regular expression pattern, useful before tag evaluation."
                          "type" = "string"
                        }
                        "pattern" = {
                          "description" = "Pattern specifies a regular expression pattern used to filter for image tags."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                    "imageRepositoryRef" = {
                      "description" = "ImageRepositoryRef points at the object specifying the image being scanned"
                      "properties" = {
                        "name" = {
                          "description" = "Name of the referent."
                          "type" = "string"
                        }
                        "namespace" = {
                          "description" = "Namespace of the referent, when not specified it acts as LocalObjectReference."
                          "type" = "string"
                        }
                      }
                      "required" = [
                        "name",
                      ]
                      "type" = "object"
                    }
                    "policy" = {
                      "description" = "Policy gives the particulars of the policy to be followed in selecting the most recent image"
                      "properties" = {
                        "alphabetical" = {
                          "description" = "Alphabetical set of rules to use for alphabetical ordering of the tags."
                          "properties" = {
                            "order" = {
                              "default" = "asc"
                              "description" = "Order specifies the sorting order of the tags. Given the letters of the alphabet as tags, ascending order would select Z, and descending order would select A."
                              "enum" = [
                                "asc",
                                "desc",
                              ]
                              "type" = "string"
                            }
                          }
                          "type" = "object"
                        }
                        "numerical" = {
                          "description" = "Numerical set of rules to use for numerical ordering of the tags."
                          "properties" = {
                            "order" = {
                              "default" = "asc"
                              "description" = "Order specifies the sorting order of the tags. Given the integer values from 0 to 9 as tags, ascending order would select 9, and descending order would select 0."
                              "enum" = [
                                "asc",
                                "desc",
                              ]
                              "type" = "string"
                            }
                          }
                          "type" = "object"
                        }
                        "semver" = {
                          "description" = "SemVer gives a semantic version range to check against the tags available."
                          "properties" = {
                            "range" = {
                              "description" = "Range gives a semver range for the image tag; the highest version within the range that's a tag yields the latest image."
                              "type" = "string"
                            }
                          }
                          "required" = [
                            "range",
                          ]
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "imageRepositoryRef",
                    "policy",
                  ]
                  "type" = "object"
                }
                "status" = {
                  "default" = {
                    "observedGeneration" = -1
                  }
                  "description" = "ImagePolicyStatus defines the observed state of ImagePolicy"
                  "properties" = {
                    "conditions" = {
                      "items" = {
                        "description" = <<-EOT
                        Condition contains details for one aspect of the current state of this API Resource. --- This struct is intended for direct use as an array at the field path .status.conditions.  For example, 
                         type FooStatus struct{ // Represents the observations of a foo's current state. // Known .status.conditions.type are: "Available", "Progressing", and "Degraded" // +patchMergeKey=type // +patchStrategy=merge // +listType=map // +listMapKey=type Conditions []metav1.Condition `json:"conditions,omitempty" patchStrategy:"merge" patchMergeKey:"type" protobuf:"bytes,1,rep,name=conditions"` 
                         // other fields }
                        EOT
                        "properties" = {
                          "lastTransitionTime" = {
                            "description" = "lastTransitionTime is the last time the condition transitioned from one status to another. This should be when the underlying condition changed.  If that is not known, then using the time when the API field changed is acceptable."
                            "format" = "date-time"
                            "type" = "string"
                          }
                          "message" = {
                            "description" = "message is a human readable message indicating details about the transition. This may be an empty string."
                            "maxLength" = 32768
                            "type" = "string"
                          }
                          "observedGeneration" = {
                            "description" = "observedGeneration represents the .metadata.generation that the condition was set based upon. For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date with respect to the current state of the instance."
                            "format" = "int64"
                            "minimum" = 0
                            "type" = "integer"
                          }
                          "reason" = {
                            "description" = "reason contains a programmatic identifier indicating the reason for the condition's last transition. Producers of specific condition types may define expected values and meanings for this field, and whether the values are considered a guaranteed API. The value should be a CamelCase string. This field may not be empty."
                            "maxLength" = 1024
                            "minLength" = 1
                            "pattern" = "^[A-Za-z]([A-Za-z0-9_,:]*[A-Za-z0-9_])?$"
                            "type" = "string"
                          }
                          "status" = {
                            "description" = "status of the condition, one of True, False, Unknown."
                            "enum" = [
                              "True",
                              "False",
                              "Unknown",
                            ]
                            "type" = "string"
                          }
                          "type" = {
                            "description" = "type of condition in CamelCase or in foo.example.com/CamelCase. --- Many .condition.type values are consistent across resources like Available, but because arbitrary conditions can be useful (see .node.status.conditions), the ability to deconflict is important. The regex it matches is (dns1123SubdomainFmt/)?(qualifiedNameFmt)"
                            "maxLength" = 316
                            "pattern" = "^([a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*/)?(([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9])$"
                            "type" = "string"
                          }
                        }
                        "required" = [
                          "lastTransitionTime",
                          "message",
                          "reason",
                          "status",
                          "type",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "latestImage" = {
                      "description" = "LatestImage gives the first in the list of images scanned by the image repository, when filtered and ordered according to the policy."
                      "type" = "string"
                    }
                    "observedGeneration" = {
                      "format" = "int64"
                      "type" = "integer"
                    }
                    "observedPreviousImage" = {
                      "description" = "ObservedPreviousImage is the observed previous LatestImage. It is used to keep track of the previous and current images."
                      "type" = "string"
                    }
                  }
                  "type" = "object"
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_imagerepositories_image_toolkit_fluxcd_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "controller-gen.kubebuilder.io/version" = "v0.12.0"
      }
      "labels" = {
        "app.kubernetes.io/component" = "image-reflector-controller"
        "app.kubernetes.io/instance" = "flux-system"
        "app.kubernetes.io/part-of" = "flux"
        "app.kubernetes.io/version" = "v2.1.1"
      }
      "name" = "imagerepositories.image.toolkit.fluxcd.io"
    }
    "spec" = {
      "group" = "image.toolkit.fluxcd.io"
      "names" = {
        "kind" = "ImageRepository"
        "listKind" = "ImageRepositoryList"
        "plural" = "imagerepositories"
        "singular" = "imagerepository"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "jsonPath" = ".status.lastScanResult.scanTime"
              "name" = "Last scan"
              "type" = "string"
            },
            {
              "jsonPath" = ".status.lastScanResult.tagCount"
              "name" = "Tags"
              "type" = "string"
            },
          ]
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "description" = "ImageRepository is the Schema for the imagerepositories API"
              "properties" = {
                "apiVersion" = {
                  "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
                  "type" = "string"
                }
                "kind" = {
                  "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
                  "type" = "string"
                }
                "metadata" = {
                  "type" = "object"
                }
                "spec" = {
                  "description" = "ImageRepositorySpec defines the parameters for scanning an image repository, e.g., `fluxcd/flux`."
                  "properties" = {
                    "accessFrom" = {
                      "description" = "AccessFrom defines an ACL for allowing cross-namespace references to the ImageRepository object based on the caller's namespace labels."
                      "properties" = {
                        "namespaceSelectors" = {
                          "description" = "NamespaceSelectors is the list of namespace selectors to which this ACL applies. Items in this list are evaluated using a logical OR operation."
                          "items" = {
                            "description" = "NamespaceSelector selects the namespaces to which this ACL applies. An empty map of MatchLabels matches all namespaces in a cluster."
                            "properties" = {
                              "matchLabels" = {
                                "additionalProperties" = {
                                  "type" = "string"
                                }
                                "description" = "MatchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed."
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "type" = "array"
                        }
                      }
                      "required" = [
                        "namespaceSelectors",
                      ]
                      "type" = "object"
                    }
                    "certSecretRef" = {
                      "description" = <<-EOT
                      CertSecretRef can be given the name of a secret containing either or both of 
                       - a PEM-encoded client certificate (`certFile`) and private key (`keyFile`); - a PEM-encoded CA certificate (`caFile`) 
                       and whichever are supplied, will be used for connecting to the registry. The client cert and key are useful if you are authenticating with a certificate; the CA cert is useful if you are using a self-signed server certificate.
                      EOT
                      "properties" = {
                        "name" = {
                          "description" = "Name of the referent."
                          "type" = "string"
                        }
                      }
                      "required" = [
                        "name",
                      ]
                      "type" = "object"
                    }
                    "exclusionList" = {
                      "description" = "ExclusionList is a list of regex strings used to exclude certain tags from being stored in the database."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "image" = {
                      "description" = "Image is the name of the image repository"
                      "type" = "string"
                    }
                    "interval" = {
                      "description" = "Interval is the length of time to wait between scans of the image repository."
                      "pattern" = "^([0-9]+(\\.[0-9]+)?(ms|s|m|h))+$"
                      "type" = "string"
                    }
                    "secretRef" = {
                      "description" = "SecretRef can be given the name of a secret containing credentials to use for the image registry. The secret should be created with `kubectl create secret docker-registry`, or the equivalent."
                      "properties" = {
                        "name" = {
                          "description" = "Name of the referent."
                          "type" = "string"
                        }
                      }
                      "required" = [
                        "name",
                      ]
                      "type" = "object"
                    }
                    "serviceAccountName" = {
                      "description" = "ServiceAccountName is the name of the Kubernetes ServiceAccount used to authenticate the image pull if the service account has attached pull secrets."
                      "maxLength" = 253
                      "type" = "string"
                    }
                    "suspend" = {
                      "description" = "This flag tells the controller to suspend subsequent image scans. It does not apply to already started scans. Defaults to false."
                      "type" = "boolean"
                    }
                    "timeout" = {
                      "description" = "Timeout for image scanning. Defaults to 'Interval' duration."
                      "pattern" = "^([0-9]+(\\.[0-9]+)?(ms|s|m))+$"
                      "type" = "string"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "default" = {
                    "observedGeneration" = -1
                  }
                  "description" = "ImageRepositoryStatus defines the observed state of ImageRepository"
                  "properties" = {
                    "canonicalImageName" = {
                      "description" = "CanonicalName is the name of the image repository with all the implied bits made explicit; e.g., `docker.io/library/alpine` rather than `alpine`."
                      "type" = "string"
                    }
                    "conditions" = {
                      "items" = {
                        "description" = <<-EOT
                        Condition contains details for one aspect of the current state of this API Resource. --- This struct is intended for direct use as an array at the field path .status.conditions.  For example, 
                         type FooStatus struct{ // Represents the observations of a foo's current state. // Known .status.conditions.type are: "Available", "Progressing", and "Degraded" // +patchMergeKey=type // +patchStrategy=merge // +listType=map // +listMapKey=type Conditions []metav1.Condition `json:"conditions,omitempty" patchStrategy:"merge" patchMergeKey:"type" protobuf:"bytes,1,rep,name=conditions"` 
                         // other fields }
                        EOT
                        "properties" = {
                          "lastTransitionTime" = {
                            "description" = "lastTransitionTime is the last time the condition transitioned from one status to another. This should be when the underlying condition changed.  If that is not known, then using the time when the API field changed is acceptable."
                            "format" = "date-time"
                            "type" = "string"
                          }
                          "message" = {
                            "description" = "message is a human readable message indicating details about the transition. This may be an empty string."
                            "maxLength" = 32768
                            "type" = "string"
                          }
                          "observedGeneration" = {
                            "description" = "observedGeneration represents the .metadata.generation that the condition was set based upon. For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date with respect to the current state of the instance."
                            "format" = "int64"
                            "minimum" = 0
                            "type" = "integer"
                          }
                          "reason" = {
                            "description" = "reason contains a programmatic identifier indicating the reason for the condition's last transition. Producers of specific condition types may define expected values and meanings for this field, and whether the values are considered a guaranteed API. The value should be a CamelCase string. This field may not be empty."
                            "maxLength" = 1024
                            "minLength" = 1
                            "pattern" = "^[A-Za-z]([A-Za-z0-9_,:]*[A-Za-z0-9_])?$"
                            "type" = "string"
                          }
                          "status" = {
                            "description" = "status of the condition, one of True, False, Unknown."
                            "enum" = [
                              "True",
                              "False",
                              "Unknown",
                            ]
                            "type" = "string"
                          }
                          "type" = {
                            "description" = "type of condition in CamelCase or in foo.example.com/CamelCase. --- Many .condition.type values are consistent across resources like Available, but because arbitrary conditions can be useful (see .node.status.conditions), the ability to deconflict is important. The regex it matches is (dns1123SubdomainFmt/)?(qualifiedNameFmt)"
                            "maxLength" = 316
                            "pattern" = "^([a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*/)?(([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9])$"
                            "type" = "string"
                          }
                        }
                        "required" = [
                          "lastTransitionTime",
                          "message",
                          "reason",
                          "status",
                          "type",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "lastHandledReconcileAt" = {
                      "description" = "LastHandledReconcileAt holds the value of the most recent reconcile request value, so a change of the annotation value can be detected."
                      "type" = "string"
                    }
                    "lastScanResult" = {
                      "description" = "LastScanResult contains the number of fetched tags."
                      "properties" = {
                        "scanTime" = {
                          "format" = "date-time"
                          "type" = "string"
                        }
                        "tagCount" = {
                          "type" = "integer"
                        }
                      }
                      "required" = [
                        "tagCount",
                      ]
                      "type" = "object"
                    }
                    "observedGeneration" = {
                      "description" = "ObservedGeneration is the last reconciled generation."
                      "format" = "int64"
                      "type" = "integer"
                    }
                  }
                  "type" = "object"
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
        {
          "additionalPrinterColumns" = [
            {
              "jsonPath" = ".status.lastScanResult.scanTime"
              "name" = "Last scan"
              "type" = "string"
            },
            {
              "jsonPath" = ".status.lastScanResult.tagCount"
              "name" = "Tags"
              "type" = "string"
            },
          ]
          "name" = "v1beta2"
          "schema" = {
            "openAPIV3Schema" = {
              "description" = "ImageRepository is the Schema for the imagerepositories API"
              "properties" = {
                "apiVersion" = {
                  "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
                  "type" = "string"
                }
                "kind" = {
                  "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
                  "type" = "string"
                }
                "metadata" = {
                  "type" = "object"
                }
                "spec" = {
                  "description" = "ImageRepositorySpec defines the parameters for scanning an image repository, e.g., `fluxcd/flux`."
                  "properties" = {
                    "accessFrom" = {
                      "description" = "AccessFrom defines an ACL for allowing cross-namespace references to the ImageRepository object based on the caller's namespace labels."
                      "properties" = {
                        "namespaceSelectors" = {
                          "description" = "NamespaceSelectors is the list of namespace selectors to which this ACL applies. Items in this list are evaluated using a logical OR operation."
                          "items" = {
                            "description" = "NamespaceSelector selects the namespaces to which this ACL applies. An empty map of MatchLabels matches all namespaces in a cluster."
                            "properties" = {
                              "matchLabels" = {
                                "additionalProperties" = {
                                  "type" = "string"
                                }
                                "description" = "MatchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed."
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "type" = "array"
                        }
                      }
                      "required" = [
                        "namespaceSelectors",
                      ]
                      "type" = "object"
                    }
                    "certSecretRef" = {
                      "description" = <<-EOT
                      CertSecretRef can be given the name of a Secret containing either or both of 
                       - a PEM-encoded client certificate (`tls.crt`) and private key (`tls.key`); - a PEM-encoded CA certificate (`ca.crt`) 
                       and whichever are supplied, will be used for connecting to the registry. The client cert and key are useful if you are authenticating with a certificate; the CA cert is useful if you are using a self-signed server certificate. The Secret must be of type `Opaque` or `kubernetes.io/tls`. 
                       Note: Support for the `caFile`, `certFile` and `keyFile` keys has been deprecated.
                      EOT
                      "properties" = {
                        "name" = {
                          "description" = "Name of the referent."
                          "type" = "string"
                        }
                      }
                      "required" = [
                        "name",
                      ]
                      "type" = "object"
                    }
                    "exclusionList" = {
                      "default" = [
                        "^.*\\.sig$",
                      ]
                      "description" = "ExclusionList is a list of regex strings used to exclude certain tags from being stored in the database."
                      "items" = {
                        "type" = "string"
                      }
                      "maxItems" = 25
                      "type" = "array"
                    }
                    "image" = {
                      "description" = "Image is the name of the image repository"
                      "type" = "string"
                    }
                    "interval" = {
                      "description" = "Interval is the length of time to wait between scans of the image repository."
                      "pattern" = "^([0-9]+(\\.[0-9]+)?(ms|s|m|h))+$"
                      "type" = "string"
                    }
                    "provider" = {
                      "default" = "generic"
                      "description" = "The provider used for authentication, can be 'aws', 'azure', 'gcp' or 'generic'. When not specified, defaults to 'generic'."
                      "enum" = [
                        "generic",
                        "aws",
                        "azure",
                        "gcp",
                      ]
                      "type" = "string"
                    }
                    "secretRef" = {
                      "description" = "SecretRef can be given the name of a secret containing credentials to use for the image registry. The secret should be created with `kubectl create secret docker-registry`, or the equivalent."
                      "properties" = {
                        "name" = {
                          "description" = "Name of the referent."
                          "type" = "string"
                        }
                      }
                      "required" = [
                        "name",
                      ]
                      "type" = "object"
                    }
                    "serviceAccountName" = {
                      "description" = "ServiceAccountName is the name of the Kubernetes ServiceAccount used to authenticate the image pull if the service account has attached pull secrets."
                      "maxLength" = 253
                      "type" = "string"
                    }
                    "suspend" = {
                      "description" = "This flag tells the controller to suspend subsequent image scans. It does not apply to already started scans. Defaults to false."
                      "type" = "boolean"
                    }
                    "timeout" = {
                      "description" = "Timeout for image scanning. Defaults to 'Interval' duration."
                      "pattern" = "^([0-9]+(\\.[0-9]+)?(ms|s|m))+$"
                      "type" = "string"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "default" = {
                    "observedGeneration" = -1
                  }
                  "description" = "ImageRepositoryStatus defines the observed state of ImageRepository"
                  "properties" = {
                    "canonicalImageName" = {
                      "description" = "CanonicalName is the name of the image repository with all the implied bits made explicit; e.g., `docker.io/library/alpine` rather than `alpine`."
                      "type" = "string"
                    }
                    "conditions" = {
                      "items" = {
                        "description" = <<-EOT
                        Condition contains details for one aspect of the current state of this API Resource. --- This struct is intended for direct use as an array at the field path .status.conditions.  For example, 
                         type FooStatus struct{ // Represents the observations of a foo's current state. // Known .status.conditions.type are: "Available", "Progressing", and "Degraded" // +patchMergeKey=type // +patchStrategy=merge // +listType=map // +listMapKey=type Conditions []metav1.Condition `json:"conditions,omitempty" patchStrategy:"merge" patchMergeKey:"type" protobuf:"bytes,1,rep,name=conditions"` 
                         // other fields }
                        EOT
                        "properties" = {
                          "lastTransitionTime" = {
                            "description" = "lastTransitionTime is the last time the condition transitioned from one status to another. This should be when the underlying condition changed.  If that is not known, then using the time when the API field changed is acceptable."
                            "format" = "date-time"
                            "type" = "string"
                          }
                          "message" = {
                            "description" = "message is a human readable message indicating details about the transition. This may be an empty string."
                            "maxLength" = 32768
                            "type" = "string"
                          }
                          "observedGeneration" = {
                            "description" = "observedGeneration represents the .metadata.generation that the condition was set based upon. For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date with respect to the current state of the instance."
                            "format" = "int64"
                            "minimum" = 0
                            "type" = "integer"
                          }
                          "reason" = {
                            "description" = "reason contains a programmatic identifier indicating the reason for the condition's last transition. Producers of specific condition types may define expected values and meanings for this field, and whether the values are considered a guaranteed API. The value should be a CamelCase string. This field may not be empty."
                            "maxLength" = 1024
                            "minLength" = 1
                            "pattern" = "^[A-Za-z]([A-Za-z0-9_,:]*[A-Za-z0-9_])?$"
                            "type" = "string"
                          }
                          "status" = {
                            "description" = "status of the condition, one of True, False, Unknown."
                            "enum" = [
                              "True",
                              "False",
                              "Unknown",
                            ]
                            "type" = "string"
                          }
                          "type" = {
                            "description" = "type of condition in CamelCase or in foo.example.com/CamelCase. --- Many .condition.type values are consistent across resources like Available, but because arbitrary conditions can be useful (see .node.status.conditions), the ability to deconflict is important. The regex it matches is (dns1123SubdomainFmt/)?(qualifiedNameFmt)"
                            "maxLength" = 316
                            "pattern" = "^([a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*/)?(([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9])$"
                            "type" = "string"
                          }
                        }
                        "required" = [
                          "lastTransitionTime",
                          "message",
                          "reason",
                          "status",
                          "type",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "lastHandledReconcileAt" = {
                      "description" = "LastHandledReconcileAt holds the value of the most recent reconcile request value, so a change of the annotation value can be detected."
                      "type" = "string"
                    }
                    "lastScanResult" = {
                      "description" = "LastScanResult contains the number of fetched tags."
                      "properties" = {
                        "latestTags" = {
                          "items" = {
                            "type" = "string"
                          }
                          "type" = "array"
                        }
                        "scanTime" = {
                          "format" = "date-time"
                          "type" = "string"
                        }
                        "tagCount" = {
                          "type" = "integer"
                        }
                      }
                      "required" = [
                        "tagCount",
                      ]
                      "type" = "object"
                    }
                    "observedExclusionList" = {
                      "description" = "ObservedExclusionList is a list of observed exclusion list. It reflects the exclusion rules used for the observed scan result in spec.lastScanResult."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "observedGeneration" = {
                      "description" = "ObservedGeneration is the last reconciled generation."
                      "format" = "int64"
                      "type" = "integer"
                    }
                  }
                  "type" = "object"
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "serviceaccount_flux_system_image_reflector_controller" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "image-reflector-controller"
        "app.kubernetes.io/instance" = "flux-system"
        "app.kubernetes.io/part-of" = "flux"
        "app.kubernetes.io/version" = "v2.1.1"
      }
      "name" = "image-reflector-controller"
      "namespace" = "flux-system"
    }
  }
}

resource "kubernetes_manifest" "deployment_flux_system_image_reflector_controller" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "image-reflector-controller"
        "app.kubernetes.io/instance" = "flux-system"
        "app.kubernetes.io/part-of" = "flux"
        "app.kubernetes.io/version" = "v2.1.1"
        "control-plane" = "controller"
      }
      "name" = "image-reflector-controller"
      "namespace" = "flux-system"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "image-reflector-controller"
        }
      }
      "template" = {
        "metadata" = {
          "annotations" = {
            "prometheus.io/port" = "8080"
            "prometheus.io/scrape" = "true"
          }
          "labels" = {
            "app" = "image-reflector-controller"
          }
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "--events-addr=",
                "--watch-all-namespaces=true",
                "--log-level=info",
                "--log-encoding=json",
                "--enable-leader-election",
              ]
              "env" = [
                {
                  "name" = "RUNTIME_NAMESPACE"
                  "valueFrom" = {
                    "fieldRef" = {
                      "fieldPath" = "metadata.namespace"
                    }
                  }
                },
              ]
              "image" = "ghcr.io/fluxcd/image-reflector-controller:v0.30.0"
              "imagePullPolicy" = "IfNotPresent"
              "livenessProbe" = {
                "httpGet" = {
                  "path" = "/healthz"
                  "port" = "healthz"
                }
              }
              "name" = "manager"
              "ports" = [
                {
                  "containerPort" = 8080
                  "name" = "http-prom"
                  "protocol" = "TCP"
                },
                {
                  "containerPort" = 9440
                  "name" = "healthz"
                  "protocol" = "TCP"
                },
              ]
              "readinessProbe" = {
                "httpGet" = {
                  "path" = "/readyz"
                  "port" = "healthz"
                }
              }
              "resources" = {
                "limits" = {
                  "cpu" = "1000m"
                  "memory" = "1Gi"
                }
                "requests" = {
                  "cpu" = "100m"
                  "memory" = "64Mi"
                }
              }
              "securityContext" = {
                "allowPrivilegeEscalation" = false
                "capabilities" = {
                  "drop" = [
                    "ALL",
                  ]
                }
                "readOnlyRootFilesystem" = true
                "runAsNonRoot" = true
                "seccompProfile" = {
                  "type" = "RuntimeDefault"
                }
              }
              "volumeMounts" = [
                {
                  "mountPath" = "/tmp"
                  "name" = "temp"
                },
                {
                  "mountPath" = "/data"
                  "name" = "data"
                },
              ]
            },
          ]
          "nodeSelector" = {
            "kubernetes.io/os" = "linux"
          }
          "securityContext" = {
            "fsGroup" = 1337
          }
          "serviceAccountName" = "image-reflector-controller"
          "terminationGracePeriodSeconds" = 10
          "volumes" = [
            {
              "emptyDir" = {}
              "name" = "temp"
            },
            {
              "emptyDir" = {}
              "name" = "data"
            },
          ]
        }
      }
    }
  }
}
