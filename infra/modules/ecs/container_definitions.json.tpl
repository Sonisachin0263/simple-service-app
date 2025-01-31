[
  {
    "name": "${service_name}",
    "image": "${container_image}",
    "cpu": "${task_cpu}",
    "memory": "${task_memory}",
    "essential": true,
    "runtime_platform": {
      "operating_system_family": "LINUX",
      "cpu_architecture": "X86_64"
    },
    "portMappings": [
      {
        "containerPort": "${container_port}",
        "protocol": "tcp"
      }
    ]
  }
]