#!/usr/bin/env bash

ENV_FILE='/etc/default/td-agent'
ENV="development"
APP="TEST_APP"

grep -qF "export APPLICATION=${APP}" ${ENV_FILE} || echo "export APPLICATION=${APP}" >> ${ENV_FILE}
grep -qF "export APP_ENV=${ENV}" ${ENV_FILE} || echo "export APP_ENV=${ENV}" >> ${ENV_FILE}
