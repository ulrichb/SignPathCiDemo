# GH REST API calls

export GH_BEARER_TOKEN="..."


curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/OWNER/REPO/check-runs \
  -d '{"name":"mighty_readme","head_sha":"ce587453ced02b1526dfb4cb910479d431683101","status":"in_progress","external_id":"42","started_at":"2018-05-04T01:14:52Z","output":{"title":"Mighty Readme report","summary":"","text":""}}'



# List runs


curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs > runs.json



curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs?head_sha=6baeaa3a7affb00a9b337c514cd711087516a22d > runs.json


curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs/6642811211



# Re-run workflow

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs/6642811212/rerun


# Re-run job

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/jobs/$JobId/rerun


# List all artifacts


curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/runs/6643557165/artifacts


# Download artifact

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_BEARER_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ulrichb/GhActionsTests/actions/artifacts/1007450973/zip
