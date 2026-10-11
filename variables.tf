variable "vertex_ai_reasoning_engines" {
  description = <<EOT
Map of vertex_ai_reasoning_engines, attributes below
Required:
    - display_name
Optional:
    - deletion_policy
    - description
    - labels
    - project
    - region
    - context_spec (block):
        - memory_bank_config (optional, block):
            - customization_configs (optional, block):
                - consolidation_config (optional, block):
                    - revisions_per_candidate_count (optional)
                - disable_natural_language_memories (optional)
                - enable_third_person_memories (optional)
                - generate_memories_examples (optional, block):
                    - conversation_source (optional, block):
                        - events (optional, block):
                            - content (required, block):
                                - parts (required, block):
                                    - audio_transcription (optional, block):
                                        - speaker_label (optional)
                                        - text (required)
                                        - words (optional, block):
                                            - end_offset (optional)
                                            - start_offset (optional)
                                            - word (required)
                                    - code_execution_result (optional, block):
                                        - id (optional)
                                        - outcome (required)
                                        - output (optional)
                                    - executable_code (optional, block):
                                        - code (required)
                                        - id (optional)
                                        - language (required)
                                    - file_data (optional, block):
                                        - file_uri (required)
                                        - mime_type (required)
                                    - function_call (optional, block):
                                        - args (optional)
                                        - id (optional)
                                        - name (optional)
                                    - function_response (optional, block):
                                        - id (optional)
                                        - name (required)
                                        - response (optional)
                                    - inline_data (optional, block):
                                        - data (required)
                                        - mime_type (required)
                                    - text (optional)
                                    - thought (optional)
                                    - video_metadata (optional, block):
                                        - end_offset (optional)
                                        - start_offset (optional)
                                - role (optional)
                    - generated_memories (optional, block):
                        - fact (required)
                        - topics (optional, block):
                            - custom_memory_topic_label (optional)
                            - managed_memory_topic (optional)
                - memory_topics (optional, block):
                    - custom_memory_topic (optional, block):
                        - description (optional)
                        - label (optional)
                    - managed_memory_topic (optional, block):
                        - managed_topic_enum (optional)
                - scope_keys (optional)
            - disable_memory_revisions (optional)
            - generation_config (optional, block):
                - generation_trigger_config (optional, block):
                    - generation_rule (optional, block):
                        - event_count (optional)
                        - fixed_interval (optional)
                        - idle_duration (optional)
                        - overlap_event_count (optional)
                - model (required)
            - similarity_search_config (optional, block):
                - embedding_model (required)
            - structured_memory_configs (optional, block):
                - schema_configs (optional, block):
                    - id (required)
                    - memory_schema (optional)
                - scope_keys (optional)
            - ttl_config (optional, block):
                - default_ttl (optional)
                - granular_ttl_config (optional, block):
                    - create_ttl (optional)
                    - generate_created_ttl (optional)
                    - generate_updated_ttl (optional)
                - memory_revision_default_ttl (optional)
    - encryption_spec (block):
        - kms_key_name (required)
    - spec (block):
        - agent_framework (optional)
        - build_spec (optional, block):
            - service_account (optional)
            - worker_pool (optional)
        - class_methods (optional)
        - container_spec (optional, block):
            - image_uri (required)
            - port (optional)
        - deployment_spec (optional, block):
            - agent_gateway_config (optional, block):
                - agent_to_anywhere_config (optional, block):
                    - agent_gateway (required)
                - client_to_agent_config (optional, block):
                    - agent_gateway (required)
            - container_concurrency (optional)
            - env (optional, block):
                - name (required)
                - value (required)
            - max_instances (optional)
            - min_instances (optional)
            - psc_interface_config (optional, block):
                - dns_peering_configs (optional, block):
                    - domain (required)
                    - target_network (required)
                    - target_project (required)
                - network_attachment (optional)
            - resource_limits (optional)
            - secret_env (optional, block):
                - name (required)
                - secret_ref (required, block):
                    - secret (required)
                    - version (optional)
        - identity_type (optional)
        - package_spec (optional, block):
            - dependency_files_gcs_uri (optional)
            - pickle_object_gcs_uri (optional)
            - python_version (optional)
            - requirements_gcs_uri (optional)
        - service_account (optional)
        - source_code_spec (optional, block):
            - agent_config_source (optional, block):
                - adk_config (optional, block):
                    - json_config (required)
                - inline_source (optional, block):
                    - source_archive (required)
            - developer_connect_source (optional, block):
                - config (required, block):
                    - dir (required)
                    - git_repository_link (required)
                    - revision (required)
            - image_spec (optional, block):
                - build_args (optional)
            - inline_source (optional, block):
                - source_archive (optional)
            - python_spec (optional, block):
                - entrypoint_module (optional)
                - entrypoint_object (optional)
                - requirements_file (optional)
                - version (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    display_name    = string
    deletion_policy = optional(string)
    description     = optional(string)
    labels          = optional(map(string))
    project         = optional(string)
    region          = optional(string)
    context_spec = optional(object({
      memory_bank_config = optional(object({
        customization_configs = optional(list(object({
          consolidation_config = optional(object({
            revisions_per_candidate_count = optional(number)
          }))
          disable_natural_language_memories = optional(bool)
          enable_third_person_memories      = optional(bool)
          generate_memories_examples = optional(list(object({
            conversation_source = optional(object({
              events = optional(list(object({
                content = object({
                  parts = list(object({
                    audio_transcription = optional(object({
                      speaker_label = optional(string)
                      text          = string
                      words = optional(list(object({
                        end_offset   = optional(string)
                        start_offset = optional(string)
                        word         = string
                      })))
                    }))
                    code_execution_result = optional(object({
                      id      = optional(string)
                      outcome = string
                      output  = optional(string)
                    }))
                    executable_code = optional(object({
                      code     = string
                      id       = optional(string)
                      language = string
                    }))
                    file_data = optional(object({
                      file_uri  = string
                      mime_type = string
                    }))
                    function_call = optional(object({
                      args = optional(string)
                      id   = optional(string)
                      name = optional(string)
                    }))
                    function_response = optional(object({
                      id       = optional(string)
                      name     = string
                      response = optional(string)
                    }))
                    inline_data = optional(object({
                      data      = string
                      mime_type = string
                    }))
                    text    = optional(string)
                    thought = optional(bool)
                    video_metadata = optional(object({
                      end_offset   = optional(string)
                      start_offset = optional(string)
                    }))
                  }))
                  role = optional(string)
                })
              })))
            }))
            generated_memories = optional(list(object({
              fact = string
              topics = optional(list(object({
                custom_memory_topic_label = optional(string)
                managed_memory_topic      = optional(string)
              })))
            })))
          })))
          memory_topics = optional(list(object({
            custom_memory_topic = optional(object({
              description = optional(string)
              label       = optional(string)
            }))
            managed_memory_topic = optional(object({
              managed_topic_enum = optional(string)
            }))
          })))
          scope_keys = optional(list(string))
        })))
        disable_memory_revisions = optional(bool)
        generation_config = optional(object({
          generation_trigger_config = optional(object({
            generation_rule = optional(object({
              event_count         = optional(number)
              fixed_interval      = optional(string)
              idle_duration       = optional(string)
              overlap_event_count = optional(number)
            }))
          }))
          model = string
        }))
        similarity_search_config = optional(object({
          embedding_model = string
        }))
        structured_memory_configs = optional(list(object({
          schema_configs = optional(list(object({
            id            = string
            memory_schema = optional(string)
          })))
          scope_keys = optional(list(string))
        })))
        ttl_config = optional(object({
          default_ttl = optional(string)
          granular_ttl_config = optional(object({
            create_ttl           = optional(string)
            generate_created_ttl = optional(string)
            generate_updated_ttl = optional(string)
          }))
          memory_revision_default_ttl = optional(string)
        }))
      }))
    }))
    encryption_spec = optional(object({
      kms_key_name = string
    }))
    spec = optional(object({
      agent_framework = optional(string)
      build_spec = optional(object({
        service_account = optional(string)
        worker_pool     = optional(string)
      }))
      class_methods = optional(string)
      container_spec = optional(object({
        image_uri = string
        port      = optional(number)
      }))
      deployment_spec = optional(object({
        agent_gateway_config = optional(object({
          agent_to_anywhere_config = optional(object({
            agent_gateway = string
          }))
          client_to_agent_config = optional(object({
            agent_gateway = string
          }))
        }))
        container_concurrency = optional(number)
        env = optional(list(object({
          name  = string
          value = string
        })))
        max_instances = optional(number)
        min_instances = optional(number)
        psc_interface_config = optional(object({
          dns_peering_configs = optional(list(object({
            domain         = string
            target_network = string
            target_project = string
          })))
          network_attachment = optional(string)
        }))
        resource_limits = optional(map(string))
        secret_env = optional(list(object({
          name = string
          secret_ref = object({
            secret  = string
            version = optional(string)
          })
        })))
      }))
      identity_type = optional(string)
      package_spec = optional(object({
        dependency_files_gcs_uri = optional(string)
        pickle_object_gcs_uri    = optional(string)
        python_version           = optional(string)
        requirements_gcs_uri     = optional(string)
      }))
      service_account = optional(string)
      source_code_spec = optional(object({
        agent_config_source = optional(object({
          adk_config = optional(object({
            json_config = string
          }))
          inline_source = optional(object({
            source_archive = string
          }))
        }))
        developer_connect_source = optional(object({
          config = object({
            dir                 = string
            git_repository_link = string
            revision            = string
          })
        }))
        image_spec = optional(object({
          build_args = optional(map(string))
        }))
        inline_source = optional(object({
          source_archive = optional(string)
        }))
        python_spec = optional(object({
          entrypoint_module = optional(string)
          entrypoint_object = optional(string)
          requirements_file = optional(string)
          version           = optional(string)
        }))
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.vertex_ai_reasoning_engines : (
        v.context_spec == null || (v.context_spec.memory_bank_config == null || (v.context_spec.memory_bank_config.customization_configs == null || alltrue([for item in v.context_spec.memory_bank_config.customization_configs : (item.generate_memories_examples == null || alltrue([for item in item.generate_memories_examples : (item.conversation_source == null || (item.conversation_source.events == null || alltrue([for item in item.conversation_source.events : (length(item.content.parts) >= 1)])))]))])))
      )
    ])
    error_message = "Each parts list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.vertex_ai_reasoning_engines : (
        v.context_spec == null || (v.context_spec.memory_bank_config == null || (v.context_spec.memory_bank_config.customization_configs == null || alltrue([for item in v.context_spec.memory_bank_config.customization_configs : (item.generate_memories_examples == null || alltrue([for item in item.generate_memories_examples : (item.conversation_source == null || (item.conversation_source.events == null || alltrue([for item in item.conversation_source.events : (alltrue([for item in item.content.parts : (item.function_call == null || (item.function_call.args == null || (can(jsondecode(item.function_call.args)))))]))])))]))])))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.vertex_ai_reasoning_engines : (
        v.context_spec == null || (v.context_spec.memory_bank_config == null || (v.context_spec.memory_bank_config.customization_configs == null || alltrue([for item in v.context_spec.memory_bank_config.customization_configs : (item.generate_memories_examples == null || alltrue([for item in item.generate_memories_examples : (item.conversation_source == null || (item.conversation_source.events == null || alltrue([for item in item.conversation_source.events : (alltrue([for item in item.content.parts : (item.function_response == null || (item.function_response.response == null || (can(jsondecode(item.function_response.response)))))]))])))]))])))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.vertex_ai_reasoning_engines : (
        v.context_spec == null || (v.context_spec.memory_bank_config == null || (v.context_spec.memory_bank_config.structured_memory_configs == null || alltrue([for item in v.context_spec.memory_bank_config.structured_memory_configs : (item.schema_configs == null || alltrue([for item in item.schema_configs : (item.memory_schema == null || (can(jsondecode(item.memory_schema))))]))])))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.vertex_ai_reasoning_engines : (
        v.spec == null || (v.spec.class_methods == null || (can(jsondecode(v.spec.class_methods))))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.vertex_ai_reasoning_engines : (
        v.spec == null || (v.spec.source_code_spec == null || (v.spec.source_code_spec.agent_config_source == null || (v.spec.source_code_spec.agent_config_source.adk_config == null || (can(jsondecode(v.spec.source_code_spec.agent_config_source.adk_config.json_config))))))
      )
    ])
    error_message = "must be valid JSON"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

