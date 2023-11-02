export github_sha=$1
export gh_run_attempt=$2

echo "gh_run_attempt: $gh_run_attempt"

if [ $gh_run_attempt = 1 ]
then
    echo "Okay, waiting ..."
    exit  1
else

    echo "Getting build workflow id for commit $github_sha ..."

    export build_workflow_id=$(curl -L  \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $GH_BEARER_TOKEN" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs?head_sha=$github_sha | jq '.workflow_runs[] | select(.name=="build") | .id')

    echo "build_workflow_id: $build_workflow_id"

   export ArtifactDownloadUrl=$(curl -L \
   -H "Accept: application/vnd.github+json" \
   -H "Authorization: Bearer $GH_BEARER_TOKEN" \
   -H "X-GitHub-Api-Version: 2022-11-28" \
   https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs/$build_workflow_id/artifacts | jq -r '.artifacts[].archive_download_url')


    curl -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $GH_BEARER_TOKEN" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    $ArtifactDownloadUrl --output artifact.zip

   unzip artifact.zip

   ls -la

    echo "======================"
   cat artifact.txt
    echo "======================"

    echo "TODO: Signing ..."
fi

