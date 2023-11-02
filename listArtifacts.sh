export github_run_id=$1

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs/$github_run_id/artifacts
