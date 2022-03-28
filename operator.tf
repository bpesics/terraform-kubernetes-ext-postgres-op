
data "kubectl_file_documents" "manifests" {
  content = file("${path.module}/files/ext-postgres-op-manifests.yaml")
}

resource "kubectl_manifest" "ext_postgres_op" {
  depends_on = [
    kubernetes_namespace.ext_postgres_op_system
  ]
  count     = length(data.kubectl_file_documents.manifests.documents)
  yaml_body = element(data.kubectl_file_documents.manifests.documents, count.index)
}
