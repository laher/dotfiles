export FZF_COMPLETION_TRIGGER="?"

# Read kube config to load pods
_fzf_complete_k() {
  ARGS="$@"
  local context="$1"
    #local url=$(kubectl config view -o json | jq -r --arg context_name "$context" '.clusters as $clusters | .contexts[] | select(.name==$context_name) as $context | $clusters[] | select(.name==$context.context.cluster) | .cluster.server | rtrimstr(":8443") | "\(.)/api/v1/namespaces/\($context.context.namespace)/pods?pretty=false"')
    _fzf_complete "--multi --reverse" "$@" < <(
        clicache k $context get pod -o json  | jq -r '.items[] | .metadata.name'
    )
}


