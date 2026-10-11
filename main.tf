resource "google_vertex_ai_reasoning_engine" "vertex_ai_reasoning_engines" {
  for_each = var.vertex_ai_reasoning_engines

  display_name    = each.value.display_name
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  labels          = each.value.labels
  project         = each.value.project
  region          = each.value.region

  dynamic "context_spec" {
    for_each = each.value.context_spec != null ? [each.value.context_spec] : []
    content {
      dynamic "memory_bank_config" {
        for_each = context_spec.value.memory_bank_config != null ? [context_spec.value.memory_bank_config] : []
        content {
          dynamic "customization_configs" {
            for_each = memory_bank_config.value.customization_configs != null ? memory_bank_config.value.customization_configs : []
            content {
              dynamic "consolidation_config" {
                for_each = customization_configs.value.consolidation_config != null ? [customization_configs.value.consolidation_config] : []
                content {
                  revisions_per_candidate_count = consolidation_config.value.revisions_per_candidate_count
                }
              }
              disable_natural_language_memories = customization_configs.value.disable_natural_language_memories
              enable_third_person_memories      = customization_configs.value.enable_third_person_memories
              dynamic "generate_memories_examples" {
                for_each = customization_configs.value.generate_memories_examples != null ? customization_configs.value.generate_memories_examples : []
                content {
                  dynamic "conversation_source" {
                    for_each = generate_memories_examples.value.conversation_source != null ? [generate_memories_examples.value.conversation_source] : []
                    content {
                      dynamic "events" {
                        for_each = conversation_source.value.events != null ? conversation_source.value.events : []
                        content {
                          content {
                            dynamic "parts" {
                              for_each = events.value.content.parts
                              content {
                                dynamic "audio_transcription" {
                                  for_each = parts.value.audio_transcription != null ? [parts.value.audio_transcription] : []
                                  content {
                                    speaker_label = audio_transcription.value.speaker_label
                                    text          = audio_transcription.value.text
                                    dynamic "words" {
                                      for_each = audio_transcription.value.words != null ? audio_transcription.value.words : []
                                      content {
                                        end_offset   = words.value.end_offset
                                        start_offset = words.value.start_offset
                                        word         = words.value.word
                                      }
                                    }
                                  }
                                }
                                dynamic "code_execution_result" {
                                  for_each = parts.value.code_execution_result != null ? [parts.value.code_execution_result] : []
                                  content {
                                    id      = code_execution_result.value.id
                                    outcome = code_execution_result.value.outcome
                                    output  = code_execution_result.value.output
                                  }
                                }
                                dynamic "executable_code" {
                                  for_each = parts.value.executable_code != null ? [parts.value.executable_code] : []
                                  content {
                                    code     = executable_code.value.code
                                    id       = executable_code.value.id
                                    language = executable_code.value.language
                                  }
                                }
                                dynamic "file_data" {
                                  for_each = parts.value.file_data != null ? [parts.value.file_data] : []
                                  content {
                                    file_uri  = file_data.value.file_uri
                                    mime_type = file_data.value.mime_type
                                  }
                                }
                                dynamic "function_call" {
                                  for_each = parts.value.function_call != null ? [parts.value.function_call] : []
                                  content {
                                    args = function_call.value.args
                                    id   = function_call.value.id
                                    name = function_call.value.name
                                  }
                                }
                                dynamic "function_response" {
                                  for_each = parts.value.function_response != null ? [parts.value.function_response] : []
                                  content {
                                    id       = function_response.value.id
                                    name     = function_response.value.name
                                    response = function_response.value.response
                                  }
                                }
                                dynamic "inline_data" {
                                  for_each = parts.value.inline_data != null ? [parts.value.inline_data] : []
                                  content {
                                    data      = inline_data.value.data
                                    mime_type = inline_data.value.mime_type
                                  }
                                }
                                text    = parts.value.text
                                thought = parts.value.thought
                                dynamic "video_metadata" {
                                  for_each = parts.value.video_metadata != null ? [parts.value.video_metadata] : []
                                  content {
                                    end_offset   = video_metadata.value.end_offset
                                    start_offset = video_metadata.value.start_offset
                                  }
                                }
                              }
                            }
                            role = events.value.content.role
                          }
                        }
                      }
                    }
                  }
                  dynamic "generated_memories" {
                    for_each = generate_memories_examples.value.generated_memories != null ? generate_memories_examples.value.generated_memories : []
                    content {
                      fact = generated_memories.value.fact
                      dynamic "topics" {
                        for_each = generated_memories.value.topics != null ? generated_memories.value.topics : []
                        content {
                          custom_memory_topic_label = topics.value.custom_memory_topic_label
                          managed_memory_topic      = topics.value.managed_memory_topic
                        }
                      }
                    }
                  }
                }
              }
              dynamic "memory_topics" {
                for_each = customization_configs.value.memory_topics != null ? customization_configs.value.memory_topics : []
                content {
                  dynamic "custom_memory_topic" {
                    for_each = memory_topics.value.custom_memory_topic != null ? [memory_topics.value.custom_memory_topic] : []
                    content {
                      description = custom_memory_topic.value.description
                      label       = custom_memory_topic.value.label
                    }
                  }
                  dynamic "managed_memory_topic" {
                    for_each = memory_topics.value.managed_memory_topic != null ? [memory_topics.value.managed_memory_topic] : []
                    content {
                      managed_topic_enum = managed_memory_topic.value.managed_topic_enum
                    }
                  }
                }
              }
              scope_keys = customization_configs.value.scope_keys
            }
          }
          disable_memory_revisions = memory_bank_config.value.disable_memory_revisions
          dynamic "generation_config" {
            for_each = memory_bank_config.value.generation_config != null ? [memory_bank_config.value.generation_config] : []
            content {
              dynamic "generation_trigger_config" {
                for_each = generation_config.value.generation_trigger_config != null ? [generation_config.value.generation_trigger_config] : []
                content {
                  dynamic "generation_rule" {
                    for_each = generation_trigger_config.value.generation_rule != null ? [generation_trigger_config.value.generation_rule] : []
                    content {
                      event_count         = generation_rule.value.event_count
                      fixed_interval      = generation_rule.value.fixed_interval
                      idle_duration       = generation_rule.value.idle_duration
                      overlap_event_count = generation_rule.value.overlap_event_count
                    }
                  }
                }
              }
              model = generation_config.value.model
            }
          }
          dynamic "similarity_search_config" {
            for_each = memory_bank_config.value.similarity_search_config != null ? [memory_bank_config.value.similarity_search_config] : []
            content {
              embedding_model = similarity_search_config.value.embedding_model
            }
          }
          dynamic "structured_memory_configs" {
            for_each = memory_bank_config.value.structured_memory_configs != null ? memory_bank_config.value.structured_memory_configs : []
            content {
              dynamic "schema_configs" {
                for_each = structured_memory_configs.value.schema_configs != null ? structured_memory_configs.value.schema_configs : []
                content {
                  id            = schema_configs.value.id
                  memory_schema = schema_configs.value.memory_schema
                }
              }
              scope_keys = structured_memory_configs.value.scope_keys
            }
          }
          dynamic "ttl_config" {
            for_each = memory_bank_config.value.ttl_config != null ? [memory_bank_config.value.ttl_config] : []
            content {
              default_ttl = ttl_config.value.default_ttl
              dynamic "granular_ttl_config" {
                for_each = ttl_config.value.granular_ttl_config != null ? [ttl_config.value.granular_ttl_config] : []
                content {
                  create_ttl           = granular_ttl_config.value.create_ttl
                  generate_created_ttl = granular_ttl_config.value.generate_created_ttl
                  generate_updated_ttl = granular_ttl_config.value.generate_updated_ttl
                }
              }
              memory_revision_default_ttl = ttl_config.value.memory_revision_default_ttl
            }
          }
        }
      }
    }
  }

  dynamic "encryption_spec" {
    for_each = each.value.encryption_spec != null ? [each.value.encryption_spec] : []
    content {
      kms_key_name = encryption_spec.value.kms_key_name
    }
  }

  dynamic "spec" {
    for_each = each.value.spec != null ? [each.value.spec] : []
    content {
      agent_framework = spec.value.agent_framework
      dynamic "build_spec" {
        for_each = spec.value.build_spec != null ? [spec.value.build_spec] : []
        content {
          service_account = build_spec.value.service_account
          worker_pool     = build_spec.value.worker_pool
        }
      }
      class_methods = spec.value.class_methods
      dynamic "container_spec" {
        for_each = spec.value.container_spec != null ? [spec.value.container_spec] : []
        content {
          image_uri = container_spec.value.image_uri
          port      = container_spec.value.port
        }
      }
      dynamic "deployment_spec" {
        for_each = spec.value.deployment_spec != null ? [spec.value.deployment_spec] : []
        content {
          dynamic "agent_gateway_config" {
            for_each = deployment_spec.value.agent_gateway_config != null ? [deployment_spec.value.agent_gateway_config] : []
            content {
              dynamic "agent_to_anywhere_config" {
                for_each = agent_gateway_config.value.agent_to_anywhere_config != null ? [agent_gateway_config.value.agent_to_anywhere_config] : []
                content {
                  agent_gateway = agent_to_anywhere_config.value.agent_gateway
                }
              }
              dynamic "client_to_agent_config" {
                for_each = agent_gateway_config.value.client_to_agent_config != null ? [agent_gateway_config.value.client_to_agent_config] : []
                content {
                  agent_gateway = client_to_agent_config.value.agent_gateway
                }
              }
            }
          }
          container_concurrency = deployment_spec.value.container_concurrency
          dynamic "env" {
            for_each = deployment_spec.value.env != null ? deployment_spec.value.env : []
            content {
              name  = env.value.name
              value = env.value.value
            }
          }
          max_instances = deployment_spec.value.max_instances
          min_instances = deployment_spec.value.min_instances
          dynamic "psc_interface_config" {
            for_each = deployment_spec.value.psc_interface_config != null ? [deployment_spec.value.psc_interface_config] : []
            content {
              dynamic "dns_peering_configs" {
                for_each = psc_interface_config.value.dns_peering_configs != null ? psc_interface_config.value.dns_peering_configs : []
                content {
                  domain         = dns_peering_configs.value.domain
                  target_network = dns_peering_configs.value.target_network
                  target_project = dns_peering_configs.value.target_project
                }
              }
              network_attachment = psc_interface_config.value.network_attachment
            }
          }
          resource_limits = deployment_spec.value.resource_limits
          dynamic "secret_env" {
            for_each = deployment_spec.value.secret_env != null ? deployment_spec.value.secret_env : []
            content {
              name = secret_env.value.name
              secret_ref {
                secret  = secret_env.value.secret_ref.secret
                version = secret_env.value.secret_ref.version
              }
            }
          }
        }
      }
      identity_type = spec.value.identity_type
      dynamic "package_spec" {
        for_each = spec.value.package_spec != null ? [spec.value.package_spec] : []
        content {
          dependency_files_gcs_uri = package_spec.value.dependency_files_gcs_uri
          pickle_object_gcs_uri    = package_spec.value.pickle_object_gcs_uri
          python_version           = package_spec.value.python_version
          requirements_gcs_uri     = package_spec.value.requirements_gcs_uri
        }
      }
      service_account = spec.value.service_account
      dynamic "source_code_spec" {
        for_each = spec.value.source_code_spec != null ? [spec.value.source_code_spec] : []
        content {
          dynamic "agent_config_source" {
            for_each = source_code_spec.value.agent_config_source != null ? [source_code_spec.value.agent_config_source] : []
            content {
              dynamic "adk_config" {
                for_each = agent_config_source.value.adk_config != null ? [agent_config_source.value.adk_config] : []
                content {
                  json_config = adk_config.value.json_config
                }
              }
              dynamic "inline_source" {
                for_each = agent_config_source.value.inline_source != null ? [agent_config_source.value.inline_source] : []
                content {
                  source_archive = inline_source.value.source_archive
                }
              }
            }
          }
          dynamic "developer_connect_source" {
            for_each = source_code_spec.value.developer_connect_source != null ? [source_code_spec.value.developer_connect_source] : []
            content {
              config {
                dir                 = developer_connect_source.value.config.dir
                git_repository_link = developer_connect_source.value.config.git_repository_link
                revision            = developer_connect_source.value.config.revision
              }
            }
          }
          dynamic "image_spec" {
            for_each = source_code_spec.value.image_spec != null ? [source_code_spec.value.image_spec] : []
            content {
              build_args = image_spec.value.build_args
            }
          }
          dynamic "inline_source" {
            for_each = source_code_spec.value.inline_source != null ? [source_code_spec.value.inline_source] : []
            content {
              source_archive = inline_source.value.source_archive
            }
          }
          dynamic "python_spec" {
            for_each = source_code_spec.value.python_spec != null ? [source_code_spec.value.python_spec] : []
            content {
              entrypoint_module = python_spec.value.entrypoint_module
              entrypoint_object = python_spec.value.entrypoint_object
              requirements_file = python_spec.value.requirements_file
              version           = python_spec.value.version
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

