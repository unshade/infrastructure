output "kubeconfig" {
  description = "Cluster kubeconfig content"
  value       = infomaniak_kaas.kaastorama.kubeconfig
  sensitive   = true
}
