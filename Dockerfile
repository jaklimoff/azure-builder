FROM node:10-alpine

RUN apk add --no-cache --virtual .pipeline-deps readline linux-pam \
  && apk add bash sudo shadow \
  && apk del .pipeline-deps

LABEL "com.azure.dev.pipelines.agent.handler.node.path"="/usr/local/bin/node"

npm install -g semantic-release
npm install -g @semantic-release/gitlab
npm install -g @semantic-release/changelog
npm install -g @semantic-release/commit-analyzer
npm install -g @semantic-release/exec
npm install -g @semantic-release/git
npm install -g @semantic-release/release-notes-generator

CMD [ "node" ]