resource "kubernetes_namespace" "ext_postgres_op_system" {
  metadata {
    name = "ext-postgres-op-system"
  }

  lifecycle {
    ignore_changes = [
      metadata[0].annotations,
      metadata[0].labels
    ]
  }
}

resource "kubernetes_secret" "ext_postgres_op_env" {
  metadata {
    namespace = "ext-postgres-op-system"
    name      = "ext-postgres-op-env"
  }

  data = merge(
    var.additional_env_vars,
    {
      PG_SERVER_LOGIN_HOST     = var.db_attributes.host
      PG_SERVER_LOGIN_PORT     = var.db_attributes.port
      PG_SERVER_LOGIN_USER     = var.db_attributes.user
      PG_SERVER_LOGIN_PASSWORD = var.db_attributes.password
      PG_SERVER_DEFAULT_DB     = var.db_attributes.default_db
    }
  )
}
