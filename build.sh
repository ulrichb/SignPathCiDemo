export github_head_ref=$1
export github_sha=$2

echo "Build script start"


echo "Getting sign workflow id for commit $github_sha ..."

export sign_workflow_id=$(curl -L  \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs?head_sha=$github_sha | jq '.workflow_runs[] | select(.name=="sign") | .id')

echo "sign_workflow_id: $sign_workflow_id"


echo "Building ..."
sleep 2
echo "FIN"


echo "loool" > artifact.txt

echo "Re-running $sign_workflow_id ..."

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/jobs/$sign_workflow_id/rerun
