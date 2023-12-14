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



# Sample `ACTIONS_...` values

```
ACTIONS_RUNTIME_URL: 'https://pipelinesghubeus13.actions.githubusercontent.com/RQXmc9XZRVa4YpN7F0L5ggdeS6YcFGPrheuA75mpKZzsjgAgqj/',
ACTIONS_CACHE_URL: 'https://acghubeus2.actions.githubusercontent.com/RQXmc9XZRVa4YpN7F0L5ggdeS6YcFGPrheuA75mpKZzsjgAgqj/',
ACTIONS_RESULTS_URL: 'https://results-receiver.actions.githubusercontent.com/'

ACTIONS_RUNTIME_TOKEN

{
  "nameid": "dddddddd-dddd-dddd-dddd-dddddddddddd",
  "scp": "Actions.GenericRead:00000000-0000-0000-0000-000000000000 Actions.Results:3cbf460f-3f19-4b38-9062-90dec255b01b:ca395085-040a-526b-2ce8-bdc85f692774 Actions.UploadArtifacts:00000000-0000-0000-0000-000000000000/1:Build/Build/78 LocationService.Connect ReadAndUpdateBuildByUri:00000000-0000-0000-0000-000000000000/1:Build/Build/78",
  "IdentityTypeClaim": "System:ServiceIdentity",
  "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid": "DDDDDDDD-DDDD-DDDD-DDDD-DDDDDDDDDDDD",
  "http://schemas.microsoft.com/ws/2008/06/identity/claims/primarysid": "dddddddd-dddd-dddd-dddd-dddddddddddd",
  "aui": "fb844113-16fb-41f9-8745-20dcca49121c",
  "sid": "7b5cfdb4-a77b-4c22-81db-1d9ec11ee71b",
  "ac": "[{\"Scope\":\"refs/heads/main\",\"Permission\":3}]",
  "acsl": "10",
  "orchid": "3cbf460f-3f19-4b38-9062-90dec255b01b.build.__default",
  "iss": "vstoken.actions.githubusercontent.com",
  "aud": "vstoken.actions.githubusercontent.com|vso:36415a43-9788-4139-8437-176b5621b245",
  "nbf": 1702576701,
  "exp": 1702599501
}
```

OIDC authority: https://vstoken.actions.githubusercontent.com/.well-known/openid-configuration
