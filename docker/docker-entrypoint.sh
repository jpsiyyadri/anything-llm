#!/bin/bash
{
  cd /app/server/ &&
    npx prisma generate --schema=./prisma/schema.prisma &&
    npx prisma migrate deploy --schema=./prisma/schema.prisma &&
    node --inspect=0.0.0.0:9229 /app/server/index.js
} &
{ node --inspect=0.0.0.0:9230 /app/collector/index.js; } &
wait -n
exit $?
