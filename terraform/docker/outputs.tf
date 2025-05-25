output "container_id" {
  description = "ID of the Moscow Time Docker container"
  value       = docker_container.moscow_time_app.id
}

output "container_ports" {
  description = "Ports used by the Moscow Time app container"
  value       = docker_container.moscow_time_app.ports
}
