# README

Demo app that allows the selection of a redis connection whey queuing a job.

## Start the sidekiq servers

```bash
  bundle exec sidekiq -q default -c 1
  USE_REDIS=new bundle exec sidekiq -q default -c 1
```

## Queue jobs

```bash
  bin/rails c
  TestWorker.perform_async
  TestWorker.perform_async_on_new_cluster
```
