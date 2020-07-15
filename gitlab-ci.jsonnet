local param_job(script, parallel_count) =
  {
    script: script,
    parallel: parallel_count,
    rules: [
      { "if": "$CI_COMMIT_BRANCH" }
    ]
  };

[
  {
    "rspec": param_job("my-script", 1),
    "rspec 2": param_job("my-script-2", 1)
  }
]
