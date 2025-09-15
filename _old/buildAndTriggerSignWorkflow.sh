export github_sha=$1

echo "Build script start"

echo "Getting sign workflow id for commit $github_sha ..."

export sign_workflow_id=$(curl -L  \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs?head_sha=$github_sha | jq '.workflow_runs[] | select(.name=="sign") | .id')

echo "sign_workflow_id: $sign_workflow_id"




./build.sh


echo "Re-running $sign_workflow_id ..."

# could issue "This workflow is already running"
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs/$sign_workflow_id/rerun
 